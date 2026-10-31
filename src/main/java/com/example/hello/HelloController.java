package com.example.hello;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Value("${app.environment:DEFAULT}")
    private String currentEnv;

    @GetMapping("/")
    public String getHome() {
        return "Hello World from Spring Boot and GitHub Actions! Running environment profile: " + currentEnv;
    }

    @GetMapping("/api/v1/status")
    public String getStatus() {
        return "Pipeline Check: Live and Verified on Profile: " + currentEnv;
    }
}
