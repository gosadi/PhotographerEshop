
package eshop.controller;



import eshop.entity.OrderDetails;
import eshop.entity.ProductHasCategory;
import eshop.service.ProductHasCategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
    
    @Autowired
    ProductHasCategoryService productHasCategoryService;
    
    @GetMapping
    public String showCart(@ModelAttribute("order") ProductHasCategory productHasCategory){
        return "order";
    }
    
    @ModelAttribute("sizes")
    public List<ProductHasCategory> getProductSize(){
        return productHasCategoryService.getProductHasCategory();
    }

}
