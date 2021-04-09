package eshop.service;

import eshop.entity.Category;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public interface CategoryService {
    
    List<Category> getCategories();
    
    Optional<Category> getCategoryById(int id);
}
