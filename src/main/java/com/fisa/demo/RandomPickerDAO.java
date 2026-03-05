package com.fisa.demo;

import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Repository
public class RandomPickerDAO {
    private List<String> nameList = new ArrayList<>(Arrays.asList(
            "고희연", "김가경", "김나영", "김동욱", "김시온",
            "김유정", "남민영", "남인서", "류경록", "박연주",
            "박재하", "박제영", "박주호", "박지우", "박지은",
            "박찬혁", "백민정", "선지원", "송민혁", "송준규",
            "오색빛", "유승준", "이강산", "이건희", "이수현",
            "이유림", "이채은", "이혜윤", "정가은", "정선우",
            "조우재", "조유진", "하은영", "유정호"));

    public List<String> getAllNames() {
        return nameList;
    }
}
