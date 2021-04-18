package com.swjd.service.impl;

import com.swjd.dao.McqDao;
import com.swjd.dao.McsDao;
import com.swjd.domain.Mcq;
import com.swjd.domain.Mcs;
import com.swjd.service.McqService;
import com.swjd.service.McsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class McqServiceImpl implements McqService {
    @Autowired
    private McqDao mcqDao;
    @Override
    public List<String> selectMcqTet() {
        return mcqDao.selectMcqTet();
    }

    @Override
    public List<Mcq> selectMcq() {
        return mcqDao.selectMcq();
    }

    @Override
    public List<Mcq> selectTetMcq(String tet) {
            List<Mcq> list=new ArrayList<>();
            for (Mcq mcq:mcqDao.selectMcq()){
                if(mcq.getTet().equals(tet)){
                    list.add(mcq);
                }
            }
            return list;
    }

    @Override
    public int addMcq(Mcq mcq) {
        for (Mcq mcqs:mcqDao.selectMcq()) {
           if(mcqs.getTet().equals(mcq.getTet())&&mcqs.getMcqName().equals(mcq.getMcqName())){
            return 0;
        }
        }
        return mcqDao.addMcq(mcq);
    }

    @Override
    public int alterMcq(Mcq mcq) {
        for (Mcq mcq1:mcqDao.selectMcq()){
                if(mcq1.getMcqName().equals(mcq.getMcqName())&&!mcq1.getMcqId().equals(mcq.getMcqId())&&mcq1.getTet().equals(mcq.getTet())){
                    return 0;
                }
        }
        return mcqDao.updateMcq(mcq);
    }

    @Override
    public int deleteMcq(String mcqId) {
        return mcqDao.deleteMcq(mcqId);
    }
}
