package eshop.repository;

import eshop.entity.Orderr;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderrRepo extends JpaRepository<Orderr, Integer>{
    
}
