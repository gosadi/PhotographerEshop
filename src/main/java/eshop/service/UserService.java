/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop.service;

import eshop.entity.Account;
import org.springframework.security.core.userdetails.UserDetailsService;


public interface UserService extends UserDetailsService{
    
    Account findByUsername(String username);
    
    Account saveUser(Account accountuser);
} 