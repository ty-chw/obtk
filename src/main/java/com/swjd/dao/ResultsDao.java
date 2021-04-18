package com.swjd.dao;

import com.swjd.domain.Result;

import java.util.List;

public interface ResultsDao {
     int insertResult(Result result);

     int selectResultId();

     int updateResult(Result result);
//      查询学生所有成绩科目
     List<String> selectStudentResultsTets(String studentId);
     //查询学生科目所有成绩
     List<Result> selectStudentTetResults(Result result);
     //修改学生成绩
     int updateStudentResult(Result result);
     //删除学生成绩
     int deleteStudentResult(String resultId);
}
