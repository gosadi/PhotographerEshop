package eshop.controller;

import eshop.entity.Account;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import eshop.service.UserService;

@Controller
public class RegistrationController {

    @Autowired
    UserService userService;

    @GetMapping("/register")
    public String showRegisterForm(@ModelAttribute("accountuser") Account accountuser) {
        return "/global/form";//register-page
    }

    //saves the user to the database and returns to login page
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("accountuser") Account accountuser, BindingResult result, RedirectAttributes attributes) {
        if (result.hasErrors()) {
            return "/global/form";//register-page
        }
        userService.saveUser(accountuser);
        attributes.addFlashAttribute("registered", "Successfully registered! Please sign in.");
        return "redirect:/register";//loginPage
    }
}
