package eshop.controller;

import eshop.entity.Orderr;
import eshop.service.OrderrService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/user")
@Controller
public class UserController {
    
    @Autowired
    OrderrService orderrService;
    
    @GetMapping("/user-history")
    public String showUserHistory(@RequestParam("id") int id, Model model, RedirectAttributes attributes){
        String url = "";
        List<Orderr> orderByAccountId = orderrService.getOrdersByAccountId(id);
        if(orderByAccountId.isEmpty()){
            url = "redirect:/user";
            attributes.addFlashAttribute("empty", "You haven't ordered anything yet. Go shopping!!");
        } else{
            model.addAttribute("orderByAccountId", orderByAccountId);
            url = "/user/user-history";
        }
        return url;
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