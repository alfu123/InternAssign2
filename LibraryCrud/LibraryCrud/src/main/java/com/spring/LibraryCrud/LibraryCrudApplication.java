package com.spring.LibraryCrud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;



@SpringBootApplication
public class LibraryCrudApplication {

	public static void main(String[] args) {
		SpringApplication.run(LibraryCrudApplication.class, args);
	}
	@Bean
	 RestTemplate rest()
	 {
		 return new RestTemplate();
	 }

}
