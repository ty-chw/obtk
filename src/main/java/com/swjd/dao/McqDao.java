package com.swjd.dao;

import com.swjd.domain.Mcq;
import com.swjd.domain.Mcs;

import java.util.List;

public interface McqDao {
    //获取所有选择题题目
    List<String> selectMcqTet();
    //查询所有选择题题目
    List<Mcq> selectMcq();
    //获取考试多选题题目
    List<Mcq> selectExamMcq(String tet);
    //添加选择题题目
    int addMcq(Mcq mcq);
    //修改多选题题目
    int updateMcq(Mcq mcq);
    //查询科目多选题总题数
    int selectMcqCount(String tet);
    //删除多选题
    int deleteMcq(String mcqId);
}
