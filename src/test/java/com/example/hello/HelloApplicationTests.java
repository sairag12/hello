package com.example.hello;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest
@ActiveProfiles("test") // Tells Spring Boot to connect to the in-memory H2 test engine!
class HelloApplicationTests {

	@Test
	void contextLoads() {
	}

}
