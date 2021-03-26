/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop.controller;

import eshop.entity.Product;
import eshop.service.ProductService;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author alkinoos
 */
@Controller
@RequestMapping("/products")
public class ProductController {
    
    @Autowired
    ProductService productService;
    
    @RequestMapping
    public String showProductsList(Model model){
        List<Product> productsList = productService.getProducts();
        model.addAttribute("productsList", productsList);
        return "productsList";
    }
    
    @GetMapping
    public String showProducts(){
        return "/global/products";
    }
    @GetMapping("/landscapes")
    public String showLandscapes(){
        return "/global/landscapes";
    }
    @GetMapping("/animals")
    public String showAnimals(){
        return "/global/animals";
    }
    @GetMapping("/people")
    public String showPeople(){
        return "/global/people";
    }   
    
}
