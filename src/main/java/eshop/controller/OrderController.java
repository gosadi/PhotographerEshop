
package eshop.controller;

import eshop.entity.Category;
import eshop.entity.Product;
import eshop.service.CategoryService;
import eshop.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class OrderController {
    
    @Autowired
    ProductService productService;
    
    @Autowired
    CategoryService categoryService;
    
    @ModelAttribute("sizes")
    public List<Category> getProductSize(){
        List<Category> sizes = categoryService.getCategories();
        return sizes;
    }
}
