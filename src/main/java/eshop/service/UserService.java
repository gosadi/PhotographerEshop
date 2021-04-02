package eshop.service;

import eshop.entity.Account;
import eshop.entity.Role;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;


public interface UserService extends UserDetailsService{
    
    List<Account> getUsersWithRoleAdmin();
    List<Account> getUsersWithRoleUser();

    
    List<Account> getUsers();
    
    Account findByUsername(String username);
    
    Account saveUser(Account accountuser);
    
    Account getUserById(int id);
    
    Account updateUserAndRole(Account account,Role role);
    
    
    
} 