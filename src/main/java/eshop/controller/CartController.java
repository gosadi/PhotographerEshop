package eshop.controller;

import eshop.entity.Category;
import eshop.entity.Item;
import eshop.service.CategoryService;
import eshop.service.ProductService;
import java.math.BigDecimal;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    //shows the contents of the cart for the current session.
    @GetMapping
    public String showCart(Model model, HttpSession session) {
        List<Category> categories = categoryService.getCategories();
        model.addAttribute("categories", categories);
        if (session.getAttribute("cartTotal") == null) {
            BigDecimal totalOrderDetail = BigDecimal.valueOf(0);
            session.setAttribute("cartTotal", totalOrderDetail);
        }
        model.addAttribute("cartTotal", cartTotal(session));
        return "/global/cart";
    }

    //selects a product and adds it in the cart.
    @GetMapping(value = "buy/{id}")
    public String buy(@PathVariable("id") int id, HttpSession session) {

        if (session.getAttribute("cart") == null) {
            List<Item> items = new ArrayList();
            items.add(new Item(productService.getProductById(id).get(), 1, categoryService.getCategoryById(1).get()));
            session.setAttribute("cart", items);
        } else {
            List<Item> items = (List<Item>) session.getAttribute("cart");
            items.add(new Item(productService.getProductById(id).get(), 1, categoryService.getCategoryById(1).get()));
        }
        return "redirect:/cart";
    }

    
    //updates the items in the cart with the correct category and quality.
    @PostMapping(value = "update")
    public String update(HttpServletRequest request, HttpSession session) {

        String[] quantities = request.getParameterValues("quantity");
        String[] qualities = request.getParameterValues("category");
        List<Item> items = (List<Item>) session.getAttribute("cart");
        for (int i = 0; i < items.size(); i++) {
            items.get(i).setQuantity(Integer.parseInt(quantities[i]));
            items.get(i).setCategory(categoryService.getCategoryById(Integer.parseInt(qualities[i])).get());
        }
        onlyOne(session); //unifies multiple entries of the same product and quality.
        session.setAttribute("cart", items);
        return "redirect:/cart";
    }

    //deletes an item from the cart.
    @GetMapping(value = "delete/{id}/{catId}/{quantity}")
    public String delete(@PathVariable("id") int id, @PathVariable("catId") int catId,
            @PathVariable("quantity") int quantity, HttpSession session) {

        List<Item> items = (List<Item>) session.getAttribute("cart");
        int index = checkIfExists(id, catId, quantity, items);
        items.remove(index);
        session.setAttribute("cart", items);
        return "redirect:/cart";
    }

    //checks if an item with product id, category id and quantity exists in a certain list of items.
    private int checkIfExists(int id, int catId, int quantity, List<Item> items) {
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getProduct().getId() == id) {
                if (items.get(i).getCategory().getId() == catId) {
                    if (items.get(i).getQuantity() == quantity) {
                        return i;
                    }
                }
            }
        }
        return -1;
    }
    
    //calculates the total price of the items in the cart.
    private BigDecimal cartTotal(HttpSession session) {
        if(session.getAttribute("cart") == null){
            List<Item> itemList = new ArrayList();
            session.setAttribute("cart", itemList);
        }
        List<Item> items = (List<Item>) session.getAttribute("cart");
        BigDecimal totalOrderDetail = BigDecimal.valueOf(0);
        for (int i = 0; i < items.size(); i++) {
            int quant = items.get(i).getQuantity();
            BigDecimal priceRate = items.get(i).getCategory().getPriceRate();
            BigDecimal basePrice = items.get(i).getProduct().getBasePrice();
            totalOrderDetail = totalOrderDetail.add(basePrice.multiply(new BigDecimal(quant)).multiply(priceRate));
        }
        session.setAttribute("cartValue", totalOrderDetail); //saves the cart's sum to an attribute named cartValue.
        return totalOrderDetail;
    }

    //checks if every item in the cart has unique product id and category id. If not, it unifies the multiple items with 
    //the same attributes and adds their quantities into a single item.
    private void onlyOne(HttpSession session) {
        List<Item> items = (List<Item>) session.getAttribute("cart");
        if (items.size() > 1) {
            for (int i = 0; i < items.size(); i++) {
                for (int j = 1; j < (items.size() - i); j++) {
                    if (items.get(i).getProduct().getId() == items.get(i + j).getProduct().getId()) {
                        if (items.get(i).getCategory().getId() == items.get(i + j).getCategory().getId()) {
                            items.get(i).setQuantity(items.get(i).getQuantity() + items.get(i + j).getQuantity());
                            items.remove(i + j);
                            j = j - 1;
                        }
                    }
                }
            }
        }
    }

    
}
