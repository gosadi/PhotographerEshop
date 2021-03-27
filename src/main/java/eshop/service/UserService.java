package eshop.service;

import eshop.entity.Account;
import org.springframework.security.core.userdetails.UserDetailsService;


public interface UserService extends UserDetailsService{
    
    Account findByUsername(String username);
    
    Account saveUser(Account accountuser);
} 