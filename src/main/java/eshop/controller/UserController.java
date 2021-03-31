package eshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {
    
    @GetMapping("/user-history")
    public String showUserHistory(){
        return "global/user-history";
    }
    
    @GetMapping("/user-info")
    public String showUserInfo(){
        return "global/user-info";
    }
    
     @GetMapping("/user-update")
    public String showUpdateForm(){
        return "global/user-update";
    }
    
     @GetMapping("/user-order-details")
    public String showUserOrderDetails(){
        return "global/user-order-details";
    }
}