package eshop.service;

import eshop.entity.Product;
import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;


    public interface ProductService {
    
    List<Product> getProducts();
    
    List<Product> getLandscapes();
    
    List<Product> getAnimals();
    
    List<Product> getPeople();
    
    void addProduct(Product product);
    
    void deleteProduct(int id);
    
    Optional<Product> getProductById(int id);
    
    Product updateProduct(Product product);

    void save(Product product);

    void saveImage(MultipartFile imageFile) throws Exception;
    
    void downloadImage(String filepath,HttpServletResponse response);
    
    List<Product> findAllProductsByBasePriceAsc(int categoryid);
    List<Product> findAllProductsByBasePriceDesc(int categoryid);
    List<Product> findAllProductsByBasePriceHigherOrEqual500(int categoryid);
    List<Product> findAllProductsByBasePriceLower500(int categoryid);
    List<Product> findAllProductsByDescrAsc(int categoryid);
    List<Product> findAllProductsByDescrDesc(int categoryid);
}