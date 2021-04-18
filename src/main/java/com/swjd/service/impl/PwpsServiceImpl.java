package com.swjd.service.impl;

import com.swjd.dao.PwpsDao;
import com.swjd.domain.Pwps;
import com.swjd.domain.Wps;
import com.swjd.service.PwpsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PwpsServiceImpl implements PwpsService {

    @Autowired
    private PwpsDao pwpsDao;

    @Override
    public int insertPwps(Pwps pwps) {
        return pwpsDao.insertPwps(pwps);
    }

    @Override
    public List<Pwps> selectTetPwpss(String tet) {
        List<Pwps> list=new ArrayList<>();
            for (Pwps pwps : pwpsDao.selectPwpss()) {
                if (!pwps.getTf()) {
                    if(tet.equals("all")){
                        list.add(pwps);
                    }else {
                     if (pwps.getWps().getTet().equals(tet)) {
                         list.add(pwps);
                        }
                    }
                }
            }
        return list;
    }

    @Override
    public List<String> selectPwpsTet() {
        List<String> list=new ArrayList<>();
        a:for (Pwps pwps:pwpsDao.selectPwpss()){
            if(!pwps.getTf()){
                for (String tet:list) {
                    if(tet.equals(pwps.getWps().getTet())){
                        continue a;
                    }
                }
                list.add(pwps.getWps().getTet());
            }
        }
        return list;
    }

    @Override
    public int deletePwps(String resultId) {
        return pwpsDao.deletePwps(resultId);
    }

    @Override
    public int updatePwpsTf(String pwpsId) {
        return pwpsDao.updatePwpsTf(pwpsId);
    }
}
