package eshop.controller;

import eshop.entity.Account;
import eshop.entity.OrderDetails;
import eshop.entity.Orderr;
import eshop.service.OrderDetailsService;
import eshop.service.OrderrService;
import eshop.service.UserService;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    OrderrService orderrService;

    @Autowired
    UserService userService;
    
    @Autowired
    OrderDetailsService orderDetailsService;

    @GetMapping("/user-history")
    public String showUserHistory( Principal principal, Model model){
        Account account = userService.findByUsername(principal.getName());
        List<Orderr> ordersByAccountId = orderrService.getUserOrderrsByAccountId(account.getId());
        model.addAttribute("ordersByAccountId", ordersByAccountId);
        return "/global/user-history";
    }
    @GetMapping("/user-edit")
    public String showUserInfo(Principal principal, Model model) {
        Account account = userService.findByUsername(principal.getName());
        model.addAttribute("account", account);
        return "global/user-edit";
    }

    @PostMapping("/user-update")
    public String updateUserInfo(Account user) {
        userService.updateUser(user);
        return "redirect:/user/user-edit";
    }

    @GetMapping("/user-order-details")
    public String showUserOrderDetails(@RequestParam("id") int id, Model model) {
        List<OrderDetails> userOrderDetails = orderDetailsService.findOrderDetailsByOrderId(id);
        model.addAttribute("userOrderDetails", userOrderDetails);
        return "global/user-order-details";
    }
}
