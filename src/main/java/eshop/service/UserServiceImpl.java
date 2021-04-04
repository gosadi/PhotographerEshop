package eshop.service;

import eshop.entity.Account;
import eshop.entity.Role;
import eshop.repository.RoleRepo;
import eshop.repository.UserRepo;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepo userRepo;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    RoleRepo roleRepo;

    @Override
    public Account findByUsername(String username) {
        return userRepo.findByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //Get the user from the database
        Account accountUser = findByUsername(username);
        //check if exists
        if (accountUser == null) {
            throw new UsernameNotFoundException("Invalid Username");
        }
        List<GrantedAuthority> authorities = convertRolesToGrantedAuthorities(accountUser.getRoles());
        User eshopUser = new User(accountUser.getUsername(), accountUser.getPassword(), authorities);
        return eshopUser;
    }

    private List<GrantedAuthority> convertRolesToGrantedAuthorities(List<Role> roles) {
        List<GrantedAuthority> authorities = new ArrayList();
        for (Role r : roles) {
            GrantedAuthority authority = new SimpleGrantedAuthority(r.getName());
            authorities.add(authority);
        }
        return authorities;
    }

    @Override
    public Account saveUser(Account accountuser) {
        String plainPassword = accountuser.getPassword();
        String hashedPassword = passwordEncoder.encode(plainPassword);
        accountuser.setPassword(hashedPassword);
        Role role = roleRepo.findByName("ROLE_USER");
        accountuser.AddRole(role);
        accountuser = userRepo.save(accountuser);
        return accountuser;
    }

    @Override
    public List<Account> getUsers() {
        List<Account> accounts = userRepo.findAll();
        return accounts;
    }

    @Override
    public List<Account> getUsersWithRoleAdmin() {
        return userRepo.findAllByRoles(1);
    }

    @Override
    public List<Account> getUsersWithRoleUser() {
        return userRepo.findAllByRoles(2);
    }

    @Override
    public Account getUserById(int id) {
        return userRepo.findById(id).get();
    }

    @Override
    public void updateUserAndRole(Account account, Role role) {
        userRepo.save(account);
        for(Role r : account.getRoles()){
            
        }

//        if (role.getName().equals("ROLE_ADMIN")) {
//            userRepo.saveToUserHasRoleAsAdmin(account.getId());
//            userRepo.saveToUserHasRoleAsUser(account.getId());
//        } else if (role.getName().equals("ROLE_USER")) {
//            userRepo.saveToUserHasRoleAsUser(account.getId());
//        }

    }

}
