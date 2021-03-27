package eshop.repository;

import eshop.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepo extends JpaRepository<Role, Integer>{
   
    @Query("SELECT r FROM Role r WHERE r.name = :name")
    public Role findByName(@Param("name") String name);
    
}
