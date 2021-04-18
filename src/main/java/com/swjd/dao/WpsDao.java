package com.swjd.dao;

import com.swjd.domain.Mcs;
import com.swjd.domain.Wps;

import java.util.List;

public interface WpsDao {
    //查询所有应用题题目
    List<Wps> selectWps();
    //添加应用题题目
    int addWps(Wps wps);
    //修改应用题
    int updateWps(Wps wps);
    //查询科目应用题总题数
    int selectWpsCount(String tet);
    //获取考试应用题题目
    List<Wps> selectExamWps(String tet);
    //删除应用题
    int deleteWps(String wpsId);
}
