package com.fisa.demo;

import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class MyFavoriteDAO {

    public Map<String, String> getImagePaths() {
        return Map.of(
                "NC 다이노스 응원", "/images/3.jpeg",
                "콘서트",           "/images/2.jpeg",
                "작은 기다림",      "/images/1.png",
                "Rains in Heaven",  "/images/6.png",
                "응답하라 1994",    "/images/4.jpg",
                "궁",               "/images/5.webp"
        );
    }
}
