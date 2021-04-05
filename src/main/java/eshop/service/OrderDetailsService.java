package eshop.service;

import eshop.entity.OrderDetails;
import java.util.List;

public interface OrderDetailsService {
    List<OrderDetails> findOrderDetailsByOrderId(int id);
    void saveOrderDetail(OrderDetails orderDetails);
}
