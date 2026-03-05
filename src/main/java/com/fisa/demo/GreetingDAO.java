package com.fisa.demo;

import org.springframework.stereotype.Repository;

@Repository
public class GreetingDAO {
    public String getGreeting() {
        return "greeting";
    }
}
