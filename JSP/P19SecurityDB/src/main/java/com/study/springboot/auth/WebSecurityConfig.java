package com.study.springboot.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.DispatcherType;

@Configuration
public class WebSecurityConfig {
	@Autowired
	public AuthenticationFailureHandler authenFailHandler;
	@Autowired
	public AuthenticationSuccessHandler suHandler;
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		http.csrf().disable().cors().disable();
		http.authorizeHttpRequests(request -> request
			.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
			.requestMatchers("/").permitAll()
			.requestMatchers("/css/**","/js/**","/img/**").permitAll()
			.requestMatchers("/guest/**").permitAll()
			.requestMatchers("/member/**").hasAnyRole("USER","ADMIN")
			.anyRequest().authenticated());
	
		http.formLogin().loginPage("/loginForm")	//default : /login
			.loginProcessingUrl("/j_spring_security_check")
			//.fial
			//.failureUrl("/loginForm?error")
			.failureHandler(authenFailHandler)
			.successHandler(suHandler)
			//.successForwardUrl("/forward")
			//.defaultSuccessUrl("/")
			.usernameParameter("j_username")
			.passwordParameter("j_password")
			.permitAll();
		http.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/loginForm")
			.permitAll();
		return http.build();
	}
	
	@Bean
	public InMemoryUserDetailsManager userDetailService() {
		UserDetails user = User.withUsername("user").password(passwordEncoder().encode("1234")).roles("USER").build();
				
		UserDetails admin = User.withUsername("admin").password(passwordEncoder().encode("1234"))
				.roles("ADMIN").build();
		UserDetails[] userDetails = new UserDetails[2];
		userDetails[0]=user;
		userDetails[1]=admin;
		System.out.println(">> ");
		System.out.println(passwordEncoder().encode("1234"));
		System.out.println(" >> ");
		return new InMemoryUserDetailsManager(userDetails);
		
	}
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
		//StandardPasswordEncoder() - SHA256
		//NoOpPasswordEncoder() - 암호화하지 않는 데이터
	}
}
