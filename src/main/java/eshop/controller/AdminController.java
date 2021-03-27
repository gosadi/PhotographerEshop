package eshop.controller;

import eshop.entity.Orderr;
import eshop.entity.Product;
import eshop.service.OrderrService;
import eshop.service.ProductService;
import eshop.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
    
    @Autowired ProductService productService;
    @Autowired OrderrService orderrService;
    @Autowired UserService userService;
    
    @GetMapping
    public String AdminHome(Model model){
        return "/admin/admin-home";
    }
    
    @GetMapping("/products")
    public String viewProducts(Model model){
        List<Product> products = productService.getProducts();
        model.addAttribute("products",products);
        return "/admin/admin-products";
    }
    
    @GetMapping("/orders")
    public String viewOrders(Model model){
        List<Orderr> orderrs = orderrService.getOrderrs();
        model.addAttribute("orders", orderrs);
        return "/admin/admin-orders";
    }
    
//    @GetMapping("/accounts")
//    public String viewAccounts(Model model){
//        List<Account> accounts = userService.getUsers();
//        model.addAttribute("accounts", accounts);
//        return "/admin/admin-accounts";
//    }
    
}