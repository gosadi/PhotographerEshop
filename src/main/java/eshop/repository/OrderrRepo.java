package eshop.repository;

import eshop.entity.Orderr;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderrRepo extends JpaRepository<Orderr, Integer>{
    
    @Query(value = "SELECT * FROM ORDERS WHERE account_id =:id",nativeQuery = true)
    List<Orderr> findOrderrsByAccountId(@Param("id")int id);
    
    }
