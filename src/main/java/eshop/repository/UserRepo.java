package eshop.repository;

import eshop.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<Account, Integer>{
    
    @Query(value = "SELECT a FROM Account a WHERE a.username = ?1")
    Account findByUsername(String username);
    
}