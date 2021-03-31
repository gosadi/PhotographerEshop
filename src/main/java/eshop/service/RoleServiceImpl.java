package eshop.service;

import eshop.entity.Role;
import eshop.repository.RoleRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class RoleServiceImpl implements RoleService{

    @Autowired RoleRepo roleRepo;
    
    @Override
    public List<Role> getAllRoles() {
        return roleRepo.findAll();
    }
    
    
}
