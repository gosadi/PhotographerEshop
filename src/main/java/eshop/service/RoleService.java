package eshop.service;

import eshop.entity.Role;
import java.util.List;


public interface RoleService {
    List<Role> getAllRoles();
    Role getRoleAdmin();
}
