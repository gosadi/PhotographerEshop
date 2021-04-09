package eshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    //show the registration form
    @RequestMapping("/loginPage")
    public String showLoginPage() {
        return "forma";//login-page
    }

    //show access denied in case a USER tries go write in url /admin
    @GetMapping("/access-denied")
    public String showAccessDeniedPage() {
        return "access-denied";
    }

}
