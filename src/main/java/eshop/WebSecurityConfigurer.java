/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import eshop.service.UserService;


@EnableWebSecurity
public class WebSecurityConfigurer extends WebSecurityConfigurerAdapter{
    
    @Autowired
    UserService accountService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }
    
   @Override
   protected void configure(HttpSecurity http) throws Exception{
       http
               .authorizeRequests()
               .antMatchers("/admin/**").hasRole("ADMIN") //covers admin and anything under this
               .antMatchers("/user/**").hasRole("USER")
               .antMatchers("/").permitAll()
               
               .and()
               .formLogin()
               .loginPage("/register") // kanei override tin spring security DEFAULT login page
               .loginProcessingUrl("/authenticate") // default tou spring security otan kanei login
               .permitAll()
               
               
       
               .and()
               .logout().logoutSuccessUrl("/")
               .permitAll()
       
               .and().exceptionHandling().accessDeniedPage("/access-denied");
               
   }
   
   
   @Bean
   public DaoAuthenticationProvider authenticationProvider(){
       DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
       provider.setUserDetailsService(accountService);
       provider.setPasswordEncoder(passwordEncoder());        //in case we don't set bcrypt in Workbench
       return provider;
   }
    
   @Bean
   public PasswordEncoder passwordEncoder(){       //in case we don't set bcrypt in Workbench
       return new BCryptPasswordEncoder();
   }
}
