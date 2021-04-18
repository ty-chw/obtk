package com.swjd.service;

import com.swjd.domain.Result;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ResultsService {
    //插入成绩
    int insertResult(Result result);
    //查询最后一个插入的数据
    int selectResultId();
    //通过id查询pwps状态
    int updateResult(Result result);
    //      查询学生所有成绩科目
    List<String> selectStudentResultsTets(String studentId);
    //查询学生科目所有成绩
    List<Result> selectStudentTetResults(Result result);
    //修改学生成绩方法
    int updateStudentResult(Result result);
    //删除学生成绩
    int deleteStudentResult(String resultId);
}
