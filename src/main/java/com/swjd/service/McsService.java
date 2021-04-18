package com.swjd.service;

import com.swjd.domain.Mcs;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface McsService {
    //获取所有题目类型方法
    List<String> selectMcsTet();
    //获取所有选择题题目方法
    List<Mcs> selectMcs();
    //获取科目选择题题目方法
    List<Mcs> selectTetMcs(String tet);
    //添加选择题题目
    int addMcs(Mcs mcs);
    //修改单选题
    int alterMcs(Mcs mcs);
    //删除单选题
    int deleteMcs(String mcsId);
}
