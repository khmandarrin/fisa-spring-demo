package com.fisa.demo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api")
@RequiredArgsConstructor
public class GreetingController {

    private final GreetingService greetingService;

    @GetMapping("/sample")
    public String getSample() {
        return greetingService.sayGreeting();
    }

}

