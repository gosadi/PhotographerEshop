package eshop.repository;

import eshop.entity.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ProductCategoryRepo extends JpaRepository<ProductCategory, Integer>{
    
}
