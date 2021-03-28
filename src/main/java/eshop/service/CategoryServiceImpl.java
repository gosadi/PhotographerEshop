package eshop.service;

import eshop.entity.Category;
import eshop.repository.CategoryRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class CategoryServiceImpl implements CategoryService{
    
    @Autowired
    CategoryRepo categoryRepo;
    
    @Override
    public List<Category> getCategories(){
        List<Category> categories = categoryRepo.findAll();
        return categories;
    }
}
