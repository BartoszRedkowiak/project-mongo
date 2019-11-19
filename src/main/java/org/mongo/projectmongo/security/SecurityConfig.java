package org.mongo.projectmongo.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("user1").password("{noop}user123").roles("USER")
                .and()
                .withUser("admin1").password("{noop}admin123").roles("ADMIN");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers(
                        "/markers/add",
                        "/markers/edit/**",
                        "/markers/tricks/{id}/vote",
                        "/users/profile",
                        "/users/edit/{id}").hasAnyRole("USER", "ADMIN")
                .antMatchers(HttpMethod.POST,
                        "/markers/tricks/{id}",
                        "/markers/details/{id}").hasAnyRole("USER", "ADMIN")
                .antMatchers(
                        "/markers/list",
                        "/users/list",
                        "/contributions/**",
                        "/markers/delete/**",
                        "/markers/acceptEdit/**",
                        "/markers/visibilityTog/**",
                        "/markers/eventTog/**",
                        "/users/delete/**").hasRole("ADMIN")
                .anyRequest().permitAll()
                .and().formLogin().loginPage("/login")
                .and().logout().logoutSuccessUrl("/").permitAll();


    }






}
