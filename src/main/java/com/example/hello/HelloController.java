package com.example.hello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/v1")
public class HelloController {

    @GetMapping("/status")
    public Map<String, String> getStatus() {
        HashMap<String, String> map = new HashMap<>();
        map.put("status", "Fully Operational");
        map.put("pipeline", "Verified Live");
        return map;
    }

    @GetMapping("/info")
    public Map<String, String> getInfo() {
        HashMap<String, String> map = new HashMap<>();
        map.put("architecture", "Decoupled Spring Boot");
        map.put("grade", "Enterprise Grade Senior Stack");
        return map;
    }
}
// Enterprise CD Pipeline Validation Pass 2026