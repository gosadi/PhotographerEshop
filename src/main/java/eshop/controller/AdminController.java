package eshop.controller;

import eshop.entity.Account;
import eshop.entity.OrderDetails;
import eshop.entity.Orderr;
import eshop.entity.Product;
import eshop.entity.ProductCategory;
import eshop.entity.Role;
import eshop.service.OrderDetailsService;
import eshop.service.OrderrService;
import eshop.service.ProductCategoryService;
import eshop.service.ProductService;
import eshop.service.RoleService;
import eshop.service.UserService;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
    @Autowired
    ProductCategoryService productCategoryService;
    @Autowired
    PasswordEncoder passwordEncoder;

//    ADMIN SHOW FIRST PAGE
    @GetMapping
    public String AdminHome(Model model) {
        return "/admin/admin-home";
    }

//    ADMIN VIEW PRODUCTS
    @GetMapping("/products")
    public String viewProducts(Model model) {
        List<Product> products = productService.getProducts();
        model.addAttribute("products", products);
        return "/admin/admin-products";
    }

    //ADMIN EDIT PRODUCTS (GET METHOD)         1
    @GetMapping("/products/edit/{id}")
    public String editProducts(@PathVariable("id") int id, Model model) {
        Product product = productService.getProductById(id).get();
        List<ProductCategory> productCategories = productCategoryService.findAll();
        model.addAttribute("productToEdit", product);
        model.addAttribute("productCategoriesToEdit", productCategories);
        return "/admin/admin-edit-product";
    }

    //ADMIN ADD EDIT PRODUCT (POST METHOD) 1
    @PostMapping("/products/update")
    public String updateProduct(Product product) {
        productService.save(product);
        return "redirect:/admin/products";
    }

//    ADMIN ADD PRODUCT CATEGORIES TO THE MODELATTRIBUTE TO SHOW PRODUCT FORM
    @ModelAttribute("productCategories")
    public List<ProductCategory> allProductCategories() {
        return productCategoryService.findAll();
    }

//    ADMIN SHOW PRODUCT FORM
    @GetMapping("/addProduct")
    public String addProduct(@ModelAttribute("product") Product product) {
        return "/admin/admin-add-product";
    }

//    ADMIN ADD A NEW PRODUCT
    @PostMapping("/addProduct")
    public String saveProduct(@Valid @ModelAttribute("product") Product product, BindingResult result, RedirectAttributes attributes, @RequestParam("imageFile") MultipartFile imageFile) {
        if (result.hasErrors()) {
            attributes.addFlashAttribute("error", "Please give valid value!!");
            return "redirect:/admin/addProduct?error";
        }
        try {
            productService.saveImage(imageFile);
        } catch (Exception e) {
            e.printStackTrace();
            attributes.addFlashAttribute("failedToUpload", "Failed to Upload the image!");
            return "redirect:/admin/addProduct?error";
        }
        productService.save(product);
        attributes.addFlashAttribute("createdProduct", "Product successfully created!");
        return "redirect:/admin/addProduct";
    }

//    DOWNLOAD A PRODUCT
    @GetMapping("/products/download/{id}")
    @ResponseBody
    public void downloadProductImage(@PathVariable("id") int id, HttpServletResponse response) {
        Product product = productService.getProductById(id).get();
        productService.downloadImage(product.getPath(), response);

    }

//    ADMIN VIEW ORDERS
    @GetMapping("/orders")
    public String viewOrders(Model model) {
        List<Orderr> orderrs = orderrService.getOrderrs();
        model.addAttribute("orders", orderrs);
        return "/admin/admin-orders";
    }

//    ADMIN VIEW ORDER DETAILS OF EACH ORDER
    @GetMapping("/orders/orderdetails")
    public String viewOrderDetails(@RequestParam("id") int id, Model model) {
        List<OrderDetails> orderDetails = orderDetailsService.findOrderDetailsByOrderId(id);
        model.addAttribute("orderDetails", orderDetails);
        return "/admin/admin-order-details";
    }

//    ADMIN VIEW USERS
    @GetMapping("/users")
    public String viewAccounts(Model model) {
        List<Account> users = userService.getUsersWithRoleUser();
        model.addAttribute("users", users);
        return "/admin/admin-accounts";
    }

//    ADMIN VIEW ORDERS OF EACH ACCOUNT
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

//    ADMIN VIEW ADMINS
    @GetMapping("/admins")
    public String viewAdmins(Model model) {
        List<Account> admins = userService.getUsersWithRoleAdmin();
        model.addAttribute("admins", admins);
        return "/admin/admin-accounts";
    }

//    ADMIN VIEW "EDIT USER FORM"
    @GetMapping("/users/edit/{id}")
    public String editUsers(@PathVariable(name = "id") int id, Model model) {
        Account account = userService.getUserById(id);
        List<Role> roles = roleService.getAllRoles();
        model.addAttribute("accountToEdit", account); //account getRoles()
        model.addAttribute("rolesToEdit", roles); // ROLE_ADMIN - ROLE_USER
        return "/admin/admin-edit-account";
    }

//    ADMIN EDIT USER
    @PostMapping("/users/update")
    public String updateUser(Account account) {
        userService.updateUserAndRole(account);
        return "redirect:/admin/users";
    }

    //    ADMIN ADD ADMIN ROLE TO THE MODELATTRIBUTE TO SHOW ADMIN-ADD-ACCOUNT FORM
    @ModelAttribute("adminRole")//accountRoles
    public Role fetchAdminRole() {
        return roleService.getRoleAdmin();
    }

    //ADMIN SHOW USER FORM
    @GetMapping("/addUser")
    public String addUser(@ModelAttribute("newAccount") Account account) {
        return "/admin/admin-add-account";
    }

    //ADMIN ADD A NEW USER
    @PostMapping("/addUser")
    public String saveUser(@Valid @ModelAttribute("newAccount") Account account, BindingResult result, RedirectAttributes attributes) {
        if (result.hasErrors()) {
            return "redirect:/admin/addUser?error";
        }
        userService.saveUser(account);
        attributes.addFlashAttribute("createdAccount", "Account successfully created!");
        return "redirect:/admin/addUser";
    }
}
