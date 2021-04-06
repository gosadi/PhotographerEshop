package eshop.service;

import eshop.entity.ProductCategory;
import eshop.repository.ProductCategoryRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductCategoryServiceImpl implements ProductCategoryService {

    @Autowired
    ProductCategoryRepo productCategoryRepo;
    
    @Override
    public List<ProductCategory> findAll() {
        return productCategoryRepo.findAll();
    }
    
}
