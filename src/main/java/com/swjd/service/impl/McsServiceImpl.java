package com.swjd.service.impl;

import com.swjd.dao.McqDao;
import com.swjd.dao.McsDao;
import com.swjd.dao.WpsDao;
import com.swjd.domain.Mcs;
import com.swjd.service.McsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class McsServiceImpl implements McsService {
    @Autowired
    private McsDao mcsDao;
    @Override
    public List<String> selectMcsTet() {
        return mcsDao.selectMcsTet();
    }

    @Override
    public List<Mcs> selectMcs() {
        return mcsDao.selectMcs();
    }

    @Override
    public List<Mcs> selectTetMcs(String tet) {
            List<Mcs> list=new ArrayList<>();
            for (Mcs mcs:mcsDao.selectMcs()){
                if(mcs.getTet().equals(tet)){
                    list.add(mcs);
                }
            }
            return list;
    }

    @Override
    public int addMcs(Mcs mcs) {
        for (Mcs mcss:mcsDao.selectMcs()) {
           if(mcss.getTet().equals(mcs.getTet())&&mcss.getMcsName().equals(mcs.getMcsName())){
            return 0;
        }
        }
        return mcsDao.addMcs(mcs);
    }

    @Override
    public int alterMcs(Mcs mcs) {
       for (Mcs mcs1:mcsDao.selectMcs()){
           if(mcs1.getMcsName().equals(mcs.getMcsName())&&!mcs1.getMcsId().equals(mcs.getMcsId())&&mcs1.getTet().equals(mcs.getTet())) {
               return 0;
           }
       }
        return mcsDao.updateMcs(mcs);
    }

    @Override
    public int deleteMcs(String mcsId) {
        return mcsDao.deleteMcs(mcsId);
    }


}
