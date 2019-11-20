package org.mongo.projectmongo.security;

import org.mongo.projectmongo.user.SpringDataUserDetailsService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

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
                .and().formLogin()
                    .loginPage("/login").failureUrl("/login?error=true")
                    .defaultSuccessUrl("/")
                    .usernameParameter("username")
                    .passwordParameter("password")
                .and().logout()
                    .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                    .logoutSuccessUrl("/logoutSuccess")
                .and().exceptionHandling()
                    .accessDeniedPage("/403");
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SpringDataUserDetailsService customUserDetailsService() {
        return new SpringDataUserDetailsService();
    }
}
