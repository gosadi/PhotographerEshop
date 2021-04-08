
package eshop.controller;

import eshop.entity.Product;
import eshop.service.CategoryService;
import eshop.service.ProductService;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/products")
public class ProductController {
    
    @Autowired
    ProductService productService;
    
    @Autowired
    CategoryService categoryService;
    
    @GetMapping
    public String showProducts(Model model){
        List<Product> products = productService.getProducts();
        model.addAttribute("products", products);
        return "/global/products";
    }
            
    @GetMapping("/landscapes")
    public String showLandscapes(Model model){
        List<Product> products = productService.getLandscapes();
        model.addAttribute("products", products);
        return "/global/landscapes";
    }
    @GetMapping("/animals")
    public String showAnimals(Model model){
        List<Product> products = productService.getAnimals();
        model.addAttribute("products", products);
        return "/global/animals";
    }
    @GetMapping("/people")
    public String showPeople(Model model){
        List<Product> products = productService.getPeople();
        model.addAttribute("products", products);
        return "/global/people";
    }   
    
    @GetMapping("/listAscByPriceRate")
    @ResponseBody
    public void showPeopleByBasePriceAsc(HttpServletResponse response){
        productService.findAllPeopleByBasePriceAsc(response);
    }
}
