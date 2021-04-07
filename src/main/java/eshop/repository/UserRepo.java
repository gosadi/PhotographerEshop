package eshop.repository;

import eshop.entity.Account;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<Account, Integer>{
//    needs ?1 to work. https://www.objectdb.com/java/jpa/query/parameter
    @Query(value = "SELECT a FROM Account a WHERE a.username = ?1")
    Account findByUsername(String username);
    
    @Query(value = "SELECT * FROM ACCOUNT ac JOIN ACCOUNT_HAS_ROLE ahc ON ac.ID = ahc.account_id and ahc.role_id =:id",nativeQuery = true)
    List<Account> findAllByRoles(@Param("id") int id);

    @Modifying
    @Query(value = "INSERT INTO ACCOUNT_HAS_ROLE (account_id,role_id) VALUES (:accountid,1)",nativeQuery = true)
    void saveToUserHasRoleAsAdmin(@Param("accountid")int accountid);
    
    @Modifying
    @Query(value = "INSERT INTO ACCOUNT_HAS_ROLE (account_id,role_id) VALUES (:accountid,2)",nativeQuery = true)
    void saveToUserHasRoleAsUser(@Param("accountid")int accountid);
    
}