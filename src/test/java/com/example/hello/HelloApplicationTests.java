package com.example.hello;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

@SpringBootTest
@TestPropertySource(properties = "app.environment=TESTING")
class HelloApplicationTests {

    @Test
    void contextLoads() {
    }
}
