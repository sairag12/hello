package com.example.hello;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1") // Scopes all endpoints inside this class securely under /api/v1
public class HelloController {

    @Value("${app.environment:dev}")
    private String currentEnv;

    // Accessible at: ://onrender.com
    @GetMapping("/info")
    public String getHome() {
        return "Hello World from Spring Boot and GitHub Actions! Running environment profile: " + currentEnv;
    }

    // Accessible at: ://onrender.com
    @GetMapping("/status")
    public String getStatus() {
        return "Pipeline Check: Live and Verified on Profile: " + currentEnv;
    }
}
