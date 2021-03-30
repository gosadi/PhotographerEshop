
package eshop.service;

import eshop.entity.ProductHasCategory;
import eshop.repository.ProductHasCategoryRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class ProductHasCategoryImpl implements ProductHasCategoryService{
    
    @Autowired
    ProductHasCategoryRepo productHasCategoryRepo;

    @Override
    public List<ProductHasCategory> getProductHasCategory() {
        List<ProductHasCategory> productHasCategorys = productHasCategoryRepo.findAll();
        return productHasCategorys;
    }
    
}
