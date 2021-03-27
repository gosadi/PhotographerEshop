package eshop.repository;

import eshop.entity.Account;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<Account, Integer>{
    
    @Query(value = "SELECT a FROM Account a WHERE a.username = ?1")
    Account findByUsername(String username);
    
//    @Query(value="SELECT a FROM Account a WHERE a.id IN SELECT r.account_id FROM account_has_role WHERE r.role_id =:role_id")
    @Query(value = "SELECT * FROM ACCOUNT ac JOIN ACCOUNT_HAS_ROLE ahc ON ac.ID = ahc.account_id and ahc.role_id =:id",nativeQuery = true)
    List<Account> findAllByRoles(@Param("id") int id);
//    List<Account> findAdmins();
    
    
}