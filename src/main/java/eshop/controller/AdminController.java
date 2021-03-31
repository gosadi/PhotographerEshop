package eshop.controller;

import eshop.entity.Account;
import eshop.entity.OrderDetails;
import eshop.entity.Orderr;
import eshop.entity.Product;
import eshop.entity.Role;
import eshop.service.OrderDetailsService;
import eshop.service.OrderrService;
import eshop.service.ProductService;
import eshop.service.RoleService;
import eshop.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/admin")
@Controller
public class AdminController {

    @Autowired
    ProductService productService;
    @Autowired
    OrderrService orderrService;
    @Autowired
    UserService userService;
    @Autowired
    OrderDetailsService orderDetailsService;
    @Autowired
    RoleService roleService;

    @GetMapping
    public String AdminHome(Model model) {
        return "/admin/admin-home";
    }

    @GetMapping("/products")
    public String viewProducts(Model model) {
        List<Product> products = productService.getProducts();
        model.addAttribute("products", products);
        return "/admin/admin-products";
    }

    @GetMapping("/orders")
    public String viewOrders(Model model) {
        List<Orderr> orderrs = orderrService.getOrderrs();
        model.addAttribute("orders", orderrs);
        return "/admin/admin-orders";
    }

    @GetMapping("/orders/orderdetails")
    public String viewOrderDetails(@RequestParam("id") int id, Model model) {
        List<OrderDetails> orderDetails = orderDetailsService.findOrderDetailsByOrderId(id);
        model.addAttribute("orderDetails", orderDetails);
        return "/admin/admin-order-details";
    }

    @GetMapping("/users")
    public String viewAccounts(Model model) {
        List<Account> users = userService.getUsersWithRoleUser();
        model.addAttribute("users", users);
        return "/admin/admin-accounts";
    }

    @GetMapping("/users/orders")
    public String viewOrdersByAccount(@RequestParam("id") int id, Model model, RedirectAttributes attributes) {
        String url = "";
        List<Orderr> ordersByAccount = orderrService.getOrdersByAccountId(id);
        if (ordersByAccount.isEmpty()) {
            url = "redirect:/admin/users";
            attributes.addFlashAttribute("wrong", "This account hasn't got any orders");
        } else {
            model.addAttribute("ordersByAccount", ordersByAccount);
            url = "/admin/admin-orders-by-account";
        }
        return url;

    }

    @GetMapping("/admins")
    public String viewAdmins(Model model) {
        List<Account> admins = userService.getUsersWithRoleAdmin();
        model.addAttribute("admins", admins);
        return "/admin/admin-accounts";
    }
    
    @GetMapping("/users/edit/{id}")
    public String editUsers(@PathVariable(name = "id")int id, Model model){
        Account account = userService.getUserById(id);
        List<Role> roles = roleService.getAllRoles();
        model.addAttribute("accountToEdit", account);
        model.addAttribute("roles", roles);
        return "/admin/admin-form-account";
    }

}
