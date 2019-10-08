package com.cloud.oauth2;

import java.util.HashMap;
import java.util.Map;

//import javax.sql.DataSource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@EnableResourceServer
public class OAuth2ServerInDbApplication {

	@RequestMapping(value="/security")
	public String security() {
		return "security DB version.";
	}
	
	@RequestMapping(value = { "/user" }, produces = "application/json")    
	public Map<String, Object> user(OAuth2Authentication user) {      
		Map<String, Object> userInfo = new HashMap<>();      
		userInfo.put("user",                  
				user.getUserAuthentication().getPrincipal());      
		userInfo.put("authorities",                  
				AuthorityUtils.authorityListToSet(                  
						user.getUserAuthentication(). getAuthorities()));      
		return userInfo;    
	}
	
	
	public static void main(String[] args) {
		System.out.println(new BCryptPasswordEncoder().encode("000000"));
		SpringApplication.run(OAuth2ServerInDbApplication.class, args);
//		ConfigurableApplicationContext context = SpringApplication.run(OAuth2ServerInDbApplication.class, args);
//		
//		DataSource ds = context.getBean(DataSource.class);
//		try {
//			System.out.println(ds.getConnection().getSchema());
//		}
//		catch(Exception ex) {
//			System.out.println("exception: " + ex.getMessage());
//		}
	}

}
