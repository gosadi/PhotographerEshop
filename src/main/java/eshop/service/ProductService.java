package eshop.service;

import eshop.entity.Product;
import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpServletResponse;
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

    public void save(Product product);

    public void saveImage(MultipartFile imageFile) throws Exception;
    
    public void downloadImage(String filepath,HttpServletResponse response);
    
    public void findAllPeopleByBasePriceAsc(HttpServletResponse response);
    public List<Product> findAllProductsByBasePriceDesc(int categoryid);
    public List<Product> findAllProductsByBasePriceHigherOrEqual500(int categoryid);
    public List<Product> findAllProductsByBasePriceLower500(int categoryid);
    public List<Product> findAllProductsByDescrAsc(int categoryid);
    public List<Product> findAllProductsByDescrDesc(int categoryid);
}