/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop.controller;

import eshop.entity.Category;
import eshop.entity.Product;
import eshop.service.CategoryService;
import eshop.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author alkinoos
 */
@Controller
@RequestMapping("/products")
public class ProductController {
    
    @Autowired
    ProductService productService;
    
    @Autowired
    CategoryService categoryService;
    
//    @RequestMapping
//    public String showSizes(Model model){
//        List<Category> size = categoryService.getCategories();
//        model.addAttribute("size",size);
//        return "/global/landscapes";
//    }
    
    @GetMapping
    public String showProducts(Model model){
        List<Product> products = productService.getProducts();
        model.addAttribute("products", products);
        return "/global/landscapes";
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
