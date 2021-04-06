package eshop.service;

import eshop.entity.Orderr;
import java.util.List;


public interface OrderrService {
    
    List<Orderr> getOrderrs();
    
    List<Orderr> getOrdersByAccountId(int id);
    
    List<Orderr> getUserOrderrsByAccountId(int id);
    
    Orderr saveOrder(Orderr order);
}
