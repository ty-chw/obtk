package com.swjd.service.impl;

import com.swjd.dao.McqDao;
import com.swjd.dao.McsDao;
import com.swjd.dao.WpsDao;
import com.swjd.domain.Mcq;
import com.swjd.domain.Mcs;
import com.swjd.domain.Wps;
import com.swjd.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ExamServiceImpl implements ExamService {
    @Autowired
    private McsDao mcsDao;
    @Autowired
    private McqDao mcqDao;
    @Autowired
    private WpsDao wpsDao;
    @Override
    public List<String> selectSubject() {
        List<String> list=new ArrayList<>();
        for (String tet:mcsDao.selectMcsTet()) {
            if(mcsDao.selectMcsCount(tet)>=10&&mcqDao.selectMcqCount(tet)>=5&&wpsDao.selectWpsCount(tet)>=2){
                list.add(tet);
            }
        }
        return list;
    }

    @Override
    public List<Object> examination(String tet) {
        List<Object> list=new ArrayList<>();
        for (Mcs mcs:mcsDao.selectExamMcs(tet)) {
             list.add(mcs);
        }
        for (Mcq mcq:mcqDao.selectExamMcq(tet)) {
            list.add(mcq);
        }
        for (Wps wps:wpsDao.selectExamWps(tet)) {
            list.add(wps);
        }
        return list;
    }
}
