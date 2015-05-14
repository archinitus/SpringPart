package kr.ac.ajou.springjpa.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;


@Configuration
@Import(DataConfig.class)
@ComponentScan("kr.ac.ajou.springjpa")
public class Config {

	// Components are autowired.
}
