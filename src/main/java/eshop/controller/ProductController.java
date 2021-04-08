package eshop.controller;

import eshop.entity.Product;
import eshop.service.CategoryService;
import eshop.service.ProductService;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    //SHOW ALL PRODUCTS IN GLOBAL products.jsp
    @GetMapping
    public String showProducts(Model model) {
        List<Product> products = productService.getProducts();
        model.addAttribute("products", products);
        return "/global/products";
    }

    //SHOW PRODUCTS IN GLOBAL landscape.jsp
    @GetMapping("/landscapes")
    public String showLandscapes(Model model) {
        List<Product> products = productService.getLandscapes();
        model.addAttribute("products", products);
        return "/global/landscapes";
    }

    //SHOW PRODUCTS IN GLOBAL animals.jsp
    @GetMapping("/animals")
    public String showAnimals(Model model) {
        List<Product> products = productService.getAnimals();
        model.addAttribute("products", products);
        return "/global/animals";
    }

    //SHOW PRODUCTS IN GLOBAL people.jsp
    @GetMapping("/people")
    public String showPeople(Model model) {
        List<Product> products = productService.getPeople();
        model.addAttribute("products", products);
        return "/global/people";
    }

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FILTERS (WANNABE) <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\\
    //SHOW PRODUCTS BASE PRICE ASCENDING
    @GetMapping("/filter/ascprice")
    public String showPeopleByBasePriceAsc(@RequestParam("id") int id, Model model) {
        String animals = "animals";
        String people = "people";
        String landscapes = "landscapes";
        List<Product> products = productService.findAllProductsByBasePriceAsc(id);
        model.addAttribute("products", products);
        if (id == 1) {
            return "/global/" + landscapes;
        } else if (id == 2) {
            return "/global/" + animals;
        } else if (id == 3) {
            return "/global/" + people;
        } else {
            return "redirect:/";
        }
    }

    //SHOW PRODUCTS BASE PRICE DESCENDING
    @GetMapping("/filter/descprice")
    public String showPeopleByBasePriceDesc(@RequestParam("id") int id, Model model) {
        String animals = "animals";
        String people = "people";
        String landscapes = "landscapes";
        List<Product> products = productService.findAllProductsByBasePriceDesc(id);
        model.addAttribute("products", products);
        if (id == 1) {
            return "/global/" + landscapes;
        } else if (id == 2) {
            return "/global/" + animals;
        } else if (id == 3) {
            return "/global/" + people;
        } else {
            return "redirect:/";
        }
    }

    //SHOW PRODUCTS BASE PRICE HIGHER OR EQUAL TO 500€
    @GetMapping("/filter/pricehigherorequal")
    public String showPeopleByBasePriceHigherOrEqual500(@RequestParam("id") int id, Model model) {
        String animals = "animals";
        String people = "people";
        String landscapes = "landscapes";
        List<Product> products = productService.findAllProductsByBasePriceHigherOrEqual500(id);
        model.addAttribute("products", products);
        if (id == 1) {
            return "/global/" + landscapes;
        } else if (id == 2) {
            return "/global/" + animals;
        } else if (id == 3) {
            return "/global/" + people;
        } else {
            return "redirect:/";
        }
    }

    //SHOW PRODUCTS BASE PRICE LOWER THAN 500 €
    @GetMapping("/filter/pricelower")
    public String showPeopleByBasePriceLower500(@RequestParam("id") int id, Model model) {
        String animals = "animals";
        String people = "people";
        String landscapes = "landscapes";
        List<Product> products = productService.findAllProductsByBasePriceLower500(id);
        model.addAttribute("products", products);
        if (id == 1) {
            return "/global/" + landscapes;
        } else if (id == 2) {
            return "/global/" + animals;
        } else if (id == 3) {
            return "/global/" + people;
        } else {
            return "redirect:/";
        }
    }

    //SHOW PRODUCTS DESCRIPTION ASCENDING
    @GetMapping("/filter/ascname")
    public String showPeopleByDescrAsc(@RequestParam("id") int id, Model model) {
        String animals = "animals";
        String people = "people";
        String landscapes = "landscapes";
        List<Product> products = productService.findAllProductsByDescrAsc(id);
        model.addAttribute("products", products);
        if (id == 1) {
            return "/global/" + landscapes;
        } else if (id == 2) {
            return "/global/" + animals;
        } else if (id == 3) {
            return "/global/" + people;
        } else {
            return "redirect:/";
        }
    }

    //SHOW PRODUCTS DESCRIPTION DESCENDING
    @GetMapping("/filter/descname")
    public String showPeopleByDescrDesc(@RequestParam("id") int id, Model model) {
        String animals = "animals";
        String people = "people";
        String landscapes = "landscapes";
        List<Product> products = productService.findAllProductsByDescrDesc(id);
        model.addAttribute("products", products);
        if (id == 1) {
            return "/global/" + landscapes;
        } else if (id == 2) {
            return "/global/" + animals;
        } else if (id == 3) {
            return "/global/" + people;
        } else {
            return "redirect:/";
        }
    }

}
