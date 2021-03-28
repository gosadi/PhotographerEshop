/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop.repository;

import eshop.entity.Category;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
 public interface CategoryRepo extends JpaRepository<Category, Integer>{
//    @Query("SELECT c FROM Category c")
//    List<Category> findAllByCategory();    
    }
