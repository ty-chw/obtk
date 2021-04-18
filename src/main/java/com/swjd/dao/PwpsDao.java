package com.swjd.dao;

import com.swjd.domain.Pwps;

import java.util.List;

public interface PwpsDao {

    int insertPwps(Pwps pwps);
    //查询所有考试应用题
    List<Pwps> selectPwpss();
    //修改阅卷状态
    int updatePwpsTf(String pwpsId);
    //删除阅卷题目
    int deletePwps(String resultId);
}
