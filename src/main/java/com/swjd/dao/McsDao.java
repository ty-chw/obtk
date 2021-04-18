package com.swjd.dao;

import com.swjd.domain.Mcs;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface McsDao {
    //获取所有选择题题目
    List<String> selectMcsTet();
    //查询所有选择题题目
    List<Mcs> selectMcs();
    //修改单选题题目
    int updateMcs(Mcs mcs);
    //添加选择题题目
    int addMcs(Mcs mcs);
    //查询科目选择题总题数
    int selectMcsCount(String tet);
    //获取考试单选题
    List<Mcs> selectExamMcs(String tet);
    //删除单选题
    int deleteMcs(String mcsId);
}
