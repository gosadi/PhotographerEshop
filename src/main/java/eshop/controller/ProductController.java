/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author alkinoos
 */
@Controller
@RequestMapping("/products")
public class ProductController {
    
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
