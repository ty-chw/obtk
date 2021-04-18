package com.swjd.service;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ExamService {

    //获取符合要求的科目
    List<String> selectSubject();
    //获取题目
    List<Object> examination(String tet);
}
