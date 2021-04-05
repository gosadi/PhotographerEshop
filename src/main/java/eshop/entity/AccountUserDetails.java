
package eshop.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class AccountUserDetails implements UserDetails {

    private Account account;

    public AccountUserDetails() {
    }

    public AccountUserDetails(Account account) {
        this.account = account;
    }
    
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
    List<Role> roles = account.getRoles();
    List<SimpleGrantedAuthority> authorities = new ArrayList<>();
    
    for (Role role:roles){
        authorities.add(new SimpleGrantedAuthority(role.getName()));
    }
    return authorities;
    }

    @Override
    public String getPassword() {
    return account.getPassword();
    }

    @Override
    public String getUsername() {
    return account.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
    return true;
    }

    @Override
    public boolean isAccountNonLocked() {
    return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
    return true;
    }

    @Override
    public boolean isEnabled() {
    return true;
    }
    
    public String getFirstname(){
        return account.getFirstname();
    }
    public Account getAccount(){
        return this.account;
    }
    
}
