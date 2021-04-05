package eshop.controller;

import eshop.entity.Account;
import eshop.entity.AccountUserDetails;
import eshop.entity.Orderr;
import eshop.service.OrderrService;
import eshop.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/user")
@Controller
public class UserController {
    
    @Autowired
    OrderrService orderrService;
    
    @Autowired
    UserService userService;
    
//    @GetMapping("/user-history")
//    public String showUserHistory(@RequestParam("id")int id, Model model, RedirectAttributes attributes){
//        String url = "";
//        List<Orderr> ordersByAccountId = orderrService.getUserOrderrsByAccountId(id);
//        model.addAttribute("ordersByAccountId", ordersByAccountId);
//        return "/global/user-history";
//    }
    

    @GetMapping("/user-info")
    public String showUserInfo(@AuthenticationPrincipal, Model model){
        Account account = userService.findByUsername(username);
        model.addAttribute("account", account);
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