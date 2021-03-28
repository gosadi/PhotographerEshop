package eshop.service;

import eshop.entity.Orderr;
import eshop.repository.OrderrRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class OrderrServiceImpl implements OrderrService{
    
    @Autowired OrderrRepo orderrRepo;
    
    @Override
    public List<Orderr> getOrderrs(){
        List<Orderr> orderrs = orderrRepo.findAll();
        return orderrs;
    }
    
}
