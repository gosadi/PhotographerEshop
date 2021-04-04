package eshop.controller;

import eshop.entity.Category;
import eshop.entity.Item;
import eshop.entity.Payment;
import eshop.service.CategoryService;
import eshop.service.PaymentService;
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
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("cart")
public class CartController {

    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private PaymentService paymentService;

    @GetMapping
    public String showCart(Model model, HttpSession session) {
        List<Category> categories = categoryService.getCategories();
        model.addAttribute("categories", categories);
        model.addAttribute("cartTotal", cartTotal(session));
        return "/global/cart";
    }

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

    @PostMapping(value = "update")
    public String update(HttpServletRequest request, HttpSession session) {

        String[] quantities = request.getParameterValues("quantity");
        String[] qualities = request.getParameterValues("category");
        List<Item> items = (List<Item>) session.getAttribute("cart");
        for (int i = 0; i < items.size(); i++) {
            items.get(i).setQuantity(Integer.parseInt(quantities[i]));
            items.get(i).getCategory().setPriceRate(Float.parseFloat(qualities[i]));
        }
        onlyOne(session); //unifies multiple entries of the same product and quality
        session.setAttribute("cart", items);
        return "redirect:/cart";
    }

    @GetMapping(value = "delete/{id}/{catId}/{quantity}")
    public String delete(@PathVariable("id") int id, @PathVariable("catId") int catId,
            @PathVariable("quantity") int quantity, HttpSession session) {

        List<Item> items = (List<Item>) session.getAttribute("cart");
        int index = checkIfExists(id, catId, quantity, items);
        items.remove(index);
        session.setAttribute("cart", items);
        return "redirect:/cart";
    }

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

    private java.math.BigDecimal cartTotal(HttpSession session) { 
        List<Item> items = (List<Item>) session.getAttribute("cart");
        java.math.BigDecimal s = java.math.BigDecimal.valueOf(0);
        for (int i = 0; i < items.size(); i++) {
            int a = items.get(i).getQuantity();
            float b = items.get(i).getCategory().getPriceRate();
            BigDecimal c = items.get(i).getProduct().getBasePrice();
            s = s.add(java.math.BigDecimal.valueOf(a*b).multiply(c));
        }
        session.setAttribute("cartValue", s); //saves the cart's sum to an attribute named cartvalue
        return s;
    }

    private void onlyOne(HttpSession session) {
        List<Item> items = (List<Item>) session.getAttribute("cart");
        if (items.size() > 1) {
            for (int i = 0; i < items.size(); i++) {
                for (int j = 1; j < (items.size() - i); j++) {
                    if (items.get(i).getProduct().getId() == items.get(i + j).getProduct().getId()) {
                        if (items.get(i).getCategory().getId() == items.get(i + j).getCategory().getId()) {
                            items.get(i).setQuantity(items.get(i).getQuantity() + items.get(i+j).getQuantity());
                            items.remove(i + j);
                            j=j-1;
                        }
                    }
                }
            }
        }
    }

//    @GetMapping(value = "/paypal")
//    public String checkoutPaypal(HttpSession session) {
//        Optional<Payment> paypalPayment = paymentService.getPaymentById(2);
//        if (session.getAttribute("payment") == null) {
//        session.setAttribute("payment", paypalPayment);
//        }
//        else{
//            session.removeAttribute("payment");
//            session.setAttribute("payment", paypalPayment);
//        }
//        return "global/checkout";
//    }
    
     @GetMapping(value = "/cash")
    public String checkoutCash(HttpSession session) {
        Optional<Payment> cashPayment = paymentService.getPaymentById(1);
        if (session.getAttribute("payment") == null) {
        session.setAttribute("payment", cashPayment);
        }
        else{
            session.removeAttribute("payment");
            session.setAttribute("payment", cashPayment);
        }
        return "global/cash";
    }
}
