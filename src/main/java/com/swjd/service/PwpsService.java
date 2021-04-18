package com.swjd.service;

import com.swjd.domain.Pwps;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PwpsService {
    int insertPwps(Pwps pwps);
    //查询对应题目类型考试应用题
    List<Pwps> selectTetPwpss(String tet);
    //查询待阅卷考试题目类型
    List<String> selectPwpsTet();
    //修改阅卷状态
    int updatePwpsTf(String pwpsId);
    //删除阅卷题目
    int deletePwps(String resultId);
}
