package eshop.repository;

import eshop.entity.Product;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepo extends JpaRepository<Product, Integer> {

    @Query("SELECT p from Product p WHERE p.productcategory.id =:id")
    List<Product> findAllByCategoryId(@Param("id") int id);

    @Query(value="SELECT * FROM PRODUCT p WHERE p.product_category_id = ?1 ORDER BY p.base_price ASC", nativeQuery = true)
    List<Product> findAllProductsByBasePriceAsc(int categoryid);
    
    @Query(value="SELECT * FROM PRODUCT p WHERE p.product_category_id = ?1 ORDER BY p.base_price DESC",nativeQuery = true)
    List<Product> findAllProductsByBasePriceDesc(int categoryid);
    
    @Query(value="SELECT * FROM PRODUCT p WHERE p.product_category_id = ?1 AND p.base_price >= 500",nativeQuery = true)
    List<Product> findAllProductsByBasePriceHigherOrEqual500(int categoryid);
    
    @Query(value="SELECT * FROM PRODUCT p WHERE p.product_category_id = ?1 AND p.base_price < 500",nativeQuery = true)
    List<Product> findAllProductsByBasePriceLower500(int categoryid);
    
    @Query(value = "SELECT * FROM PRODUCT p WHERE p.product_category_id = ?1 ORDER BY p.descr ASC",nativeQuery = true)
    List<Product> findAllProductsByDescrAsc(int categoryid);
    
    @Query(value = "SELECT * FROM PRODUCT p WHERE p.product_category_id = ?1 ORDER BY p.descr DESC",nativeQuery = true)
    List<Product> findAllProductsByDescrDesc(int categoryid);
    
}
