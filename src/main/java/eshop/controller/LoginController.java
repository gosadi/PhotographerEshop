package eshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
    @RequestMapping("/loginPage")
    public String showLoginPage(){
        return "forma";//login-page
    }
    
    @GetMapping("/access-denied")
    public String showAccessDeniedPage(){
        return "access-denied";
    }
    
}