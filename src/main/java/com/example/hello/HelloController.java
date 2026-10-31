package com.example.hello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/api/v1/status")
    public String getStatus() {
        return "Spring Boot Application is Live and Verified by GitHub Actions!";
    }
}
