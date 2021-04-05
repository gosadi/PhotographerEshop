package eshop.service;

import eshop.entity.OrderDetails;
import eshop.repository.OrderDetailsRepo;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrderDetailsServiceImpl implements OrderDetailsService {

    
    @Autowired OrderDetailsRepo orderDetailsRepo;
    
    @Override
    public List<OrderDetails> findOrderDetailsByOrderId(int id) {
        return orderDetailsRepo.findOrderDetailsByOrder(id);
    }

    @Override
    public void saveOrderDetail(OrderDetails orderDetails) {
        int quant = orderDetails.getQuant();
        BigDecimal currentPrice = orderDetails.getCurrentPrice();
//        int orderid = orderDetails.getOrderr().getId(); // NULL
        int productid = orderDetails.getProduct().getId();
        orderDetailsRepo.saveOrderDetail(quant,currentPrice,2,productid);
    }
    
    
}
