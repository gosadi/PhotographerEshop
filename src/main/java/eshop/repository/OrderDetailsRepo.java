package eshop.repository;

import eshop.entity.OrderDetails;
import eshop.entity.Orderr;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailsRepo extends JpaRepository<OrderDetails, Integer> {

    @Query(value = "select * from order_details od join product p on od.product_id = p.id join order_details_has_category odhc on od.id = odhc.order_details_id join category cat on odhc.category_id = cat.id where od.order_id =:id", nativeQuery = true)
    List<OrderDetails> findOrderDetailsByOrder(@Param("id") int id);

    @Modifying
    @Query(value = "insert into order_details (quant,current_price,order_id,product_id) values (?1,?2,?3,?4)", nativeQuery = true)
    void saveOrderDetail(int quant, BigDecimal currentPrice, int orderid, int productid);
}
