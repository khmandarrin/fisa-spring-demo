package com.fisa.demo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api")
@RequiredArgsConstructor
public class GreetingController {

    private final GreetingService greetingService;
    private final FakerService fakerService;
    private final MyFavoriteService myFavoriteService;
    private final RandomPickerService randomPickerService;

    @GetMapping("/sample")
    public String getSample() {
        return greetingService.sayGreeting();
    }

    @GetMapping("/faker")
    public String getFaker(Model model) {
        String fakerImageUrl = fakerService.getFakerImage();
        model.addAttribute("imageUrl", fakerImageUrl);
        return "faker";
    }
  
    @GetMapping("/mandarrin")
    public String getMandarrin(Model model) {
        model.addAttribute("images", myFavoriteService.getImagePaths());
        return "mandarrin";
    }
  
    @GetMapping("/pick")
    public String getRandomNamePick(Model model) {
        String name = randomPickerService.pick();
        model.addAttribute("name", name);
        return "randomPick";
    }

    @GetMapping("/reroll")
    @ResponseBody
    public String getRandomNameReroll(Model model) {
        return randomPickerService.pick();
    }
}

