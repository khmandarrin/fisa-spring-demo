package com.fisa.demo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class RandomPickerService {

    private final RandomPickerDAO randomPickerDAO;
    private final Random random = new Random();

    public String pick() {
        List<String> names = randomPickerDAO.getAllNames();

        if (names == null || names.isEmpty()) {
            return "등록된 이름이 없습니다.";
        }

        int randomIndex = random.nextInt(names.size());

        return names.get(randomIndex);
    }
}
