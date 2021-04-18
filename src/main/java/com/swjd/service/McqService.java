package com.swjd.service;

import com.swjd.domain.Mcq;
import com.swjd.domain.Mcs;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface McqService {
    //获取所有题目类型方法
    List<String> selectMcqTet();
    //获取所有选择题题目方法
    List<Mcq> selectMcq();
    //获取科目选择题题目方法
    List<Mcq> selectTetMcq(String tet);
    //添加选择题题目
    int addMcq(Mcq mcq);
    //修改多选题
    int alterMcq(Mcq mcq);
    //删除多选题
    int deleteMcq(String mcqId);
}
