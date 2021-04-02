/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop.service;

import eshop.entity.OrderDetails;
import java.util.List;

/**
 *
 * @author alkinoos
 */
public interface OrderDetailsService {
    List<OrderDetails> findOrderDetailsByOrderId(int id);
}
