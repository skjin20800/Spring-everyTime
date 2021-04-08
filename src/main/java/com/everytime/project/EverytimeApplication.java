package com.everytime.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class EverytimeApplication {

	public static void main(String[] args) {
		SpringApplication.run(EverytimeApplication.class, args);
	}

}
