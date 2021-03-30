/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop.service;

import eshop.entity.OrderDetails;
import eshop.repository.OrderDetailsRepo;
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
    
}
