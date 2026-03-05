package com.fisa.demo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class GreetingService {

    private final GreetingDAO greetingDAO;

    public String sayGreeting() {
        String greeting = greetingDAO.getGreeting();
        return greeting;
    }
}
