package com.fisa.demo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class MyFavoriteService {

    private final MyFavoriteDAO myFavoriteDAO;

    public Map<String, String> getImagePaths() {
        return myFavoriteDAO.getImagePaths();
    }
}
