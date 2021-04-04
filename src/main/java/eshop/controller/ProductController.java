
package eshop.controller;

import eshop.entity.Product;
import eshop.service.CategoryService;
import eshop.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/products")
public class ProductController {
    
    @Autowired
    ProductService productService;
    
    @Autowired
    CategoryService categoryService;
    
    @GetMapping
    public String showProducts(Model model){
        List<Product> products = productService.getProducts();
        model.addAttribute("products", products);
        return "/global/products";
    }
            
    @GetMapping("/landscapes")
    public String showLandscapes(Model model){
        List<Product> products = productService.getLandscapes();
        model.addAttribute("products", products);
        return "/global/landscapes";
    }
    @GetMapping("/animals")
    public String showAnimals(Model model){
        List<Product> products = productService.getAnimals();
        model.addAttribute("products", products);
        return "/global/animals";
    }
    @GetMapping("/people")
    public String showPeople(Model model){
        List<Product> products = productService.getPeople();
        model.addAttribute("products", products);
        return "/global/people";
    }   
    
//    @GetMapping("/cart")
//    public String showCart(Model model){
//        List<Product> cartProducts = productService.getProducts();
//        model.addAttribute("cartProducts", cartProducts);
//        return "/global/cart";
//    }
}
