package eshop.repository;

import eshop.entity.Orderr;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderrRepo extends JpaRepository<Orderr, Integer> {

    @Query(value = "SELECT * FROM ORDERS WHERE account_id =:id", nativeQuery = true)
    List<Orderr> findOrderrsByAccountId(@Param("id") int id);

//    @Query(value = "select * from orders o, account a where o.account_id = a.id and a.id=:id", nativeQuery = true)
    @Query(value = "SELECT *"
            + " FROM orders o"
            + " JOIN account a"
            + " ON o.account_id = a.id"
            + " WHERE o.account_id= :id"
            + " ORDER BY o.order_date DESC;", nativeQuery = true)
    List<Orderr> findUserOrderrsByAccountId(@Param("id") int id);
    
    @Query(value = "SELECT max(id) FROM ORDERS WHERE account_id =:id", nativeQuery = true)
    int findOrderrsMaxIdByAccountId(@Param("id") int id);

}
