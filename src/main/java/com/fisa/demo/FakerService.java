package com.fisa.demo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FakerService {

    private final FakerDAO fakerDAO;

    public String getFakerImage() {
        return fakerDAO.getRandomFakerImage();
    }
}
