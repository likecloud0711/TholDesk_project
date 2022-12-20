package com.work;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
public class TholDeskProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TholDeskProjectApplication.class, args);
	}
	@Bean
	   public HiddenHttpMethodFilter hiddenHttpMethodFilter(){
	         return new HiddenHttpMethodFilter();
	      //<input type="hidden" name="_method" value="put/delete">
	   }
}
