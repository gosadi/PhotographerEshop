
package eshop.service;

import eshop.entity.Product;
import eshop.repository.ProductRepo;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class ProductService {
    
    @Autowired 
    ProductRepo productRepo;

public List<Product> getProducts(){
    List<Product> products = productRepo.findAll();
    return products;
}    

public void addProduct (Product product){
    productRepo.save(product);
}

public void deleteProduct(int id){
    productRepo.deleteById(id);
}

public Optional<Product> getProductById(int id){
    return productRepo.findById(id);
}

public Product updateProduct (Product product){
    return productRepo.save(product);
}
}
