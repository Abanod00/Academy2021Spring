package com.cds.academy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableAutoConfiguration
@ComponentScan(basePackages = "com.cds.academy")
@SpringBootApplication
public class CDSTwitterApplication {
	public static void main(String[] args) {
		SpringApplication.run(CDSTwitterApplication.class, args);
	}

}
