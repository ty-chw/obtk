package com.swjd.service.impl;

import com.swjd.dao.WpsDao;
import com.swjd.domain.Mcs;
import com.swjd.domain.Wps;
import com.swjd.service.WpsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class WpsServiceImpl implements WpsService {
    @Autowired
    private WpsDao wpsDao;
    @Override
    public List<Wps> selectWps() {
        return wpsDao.selectWps();
    }

    @Override
    public List<Wps> selectTetWps(String tet) {
        List<Wps> list=new ArrayList<>();
        for (Wps wps:wpsDao.selectWps()){
            if(wps.getTet().equals(tet)){
                list.add(wps);
            }
        }
        return list;
    }

    @Override
    public int addWps(Wps wps) {
        for (Wps wpss:wpsDao.selectWps()) {
            if(wpss.getTet().equals(wps.getTet())&&wpss.getWpsName().equals(wps.getWpsName())){
                return 0;
            }
        }
        return wpsDao.addWps(wps);
    }

    @Override
    public int alterWps(Wps wps) {
        for (Wps wps1:wpsDao.selectWps()){
                if(wps1.getWpsName().equals(wps.getWpsName())&&!wps1.getWpsId().equals(wps.getWpsId())&&wps1.getTet().equals(wps.getTet())){
                    return 0;
                }
        }
        return wpsDao.updateWps(wps);
    }

    @Override
    public int deleteWps(String wpsId) {
        return wpsDao.deleteWps(wpsId);
    }
}
