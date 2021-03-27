package eshop.controller;

import eshop.entity.Product;
import eshop.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
    
    @Autowired ProductService productService;
    
    @GetMapping
    public String AdminHome(Model model){
        List<Product> products = productService.getProducts();
        model.addAttribute("products", products);
        return "/admin/admin-home";//admin-home
    }
    
    @GetMapping("/products")
    public String viewProducts(Model model){
        List<Product> products = productService.getProducts();
        model.addAttribute("products",products);
        return "/admin/admin-products";
    }
    
//        @GetMapping
//    public String showProducts(Model model){
//        List<Product> products = productService.getProducts();
//        model.addAttribute("products", products);
//        return "admin/admin-home";
//    }
}