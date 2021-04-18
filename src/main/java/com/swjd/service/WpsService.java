package com.swjd.service;

import com.swjd.domain.Mcs;
import com.swjd.domain.Wps;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface WpsService {
    //获取所有应用题题目方法
    List<Wps> selectWps();
    //获取科目应用题题目方法
    List<Wps> selectTetWps(String tet);
    //添加应用题题目
    int addWps(Wps wps);
    //修改应用题
    int alterWps(Wps wps);
    //删除应用题
    int deleteWps(String wpsId);
}
