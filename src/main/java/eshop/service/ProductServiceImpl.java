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
public class ProductServiceImpl implements ProductService{

    @Autowired
    ProductRepo productRepo;

    @Override
    public List<Product> getProducts() {
        List<Product> products = productRepo.findAll();
        return products;
    }
    
    @Override
    public List<Product> getLandscapes(){
        List<Product> products = productRepo.findAllByCategoryId(1);
        return products;
    }
    
    @Override
    public List<Product> getAnimals(){
        List<Product> products = productRepo.findAllByCategoryId(2);
        return products;
    }
    
    @Override
    public List<Product> getPeople(){
        List<Product> products = productRepo.findAllByCategoryId(3);
        return products;
    }

    @Override
    public void addProduct(Product product) {
        productRepo.save(product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepo.deleteById(id);
    }

    @Override
    public Optional<Product> getProductById(int id) {
        return productRepo.findById(id);
    }

    @Override
    public Product updateProduct(Product product) {
        return productRepo.save(product);
    }

    @Override
    public void save(Product product) {
        productRepo.save(product);
    }
    
}
