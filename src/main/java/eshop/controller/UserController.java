package eshop.controller;

import eshop.entity.Account;
import eshop.entity.OrderDetails;
import eshop.entity.Orderr;
import eshop.entity.Product;
import eshop.service.OrderDetailsService;
import eshop.service.OrderrService;
import eshop.service.ProductService;
import eshop.service.UserService;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    OrderrService orderrService;

    @Autowired
    UserService userService;
    
    @Autowired
    OrderDetailsService orderDetailsService;
    
    @Autowired
    ProductService productService;

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
    public String updateUserInfo(@Valid Account user,BindingResult result,RedirectAttributes attributes) {
        if(result.hasErrors()){
            attributes.addFlashAttribute("error", "Invalid credentials");
            return "redirect:/user/user-edit";
        }
        userService.updateUser(user);
        return "redirect:/user/user-edit";
    }

    @GetMapping("/user-order-details")
    public String showUserOrderDetails(@RequestParam("id") int id, Model model) {
        List<OrderDetails> userOrderDetails = orderDetailsService.findOrderDetailsByOrderId(id);
        model.addAttribute("userOrderDetails", userOrderDetails);
        return "global/user-order-details";
    }
    
    @GetMapping("/product/download/{id}")
    @ResponseBody
    public void downloadProduct(@PathVariable("id") int id,HttpServletResponse response){
        Product product = productService.getProductById(id).get();
        productService.downloadImage(product.getPath(), response);
    }
}
