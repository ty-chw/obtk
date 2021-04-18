package com.swjd.controller;

import com.swjd.domain.Mcs;
import com.swjd.domain.Wps;
import com.swjd.service.WpsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/wps")
public class WpsController {
    @Autowired
    private WpsService wpsService;


    @ResponseBody
    @RequestMapping("/selectTetWps")
    public List<Wps> selectTetWps(String tet){
        return wpsService.selectTetWps(tet);
    }

    @ResponseBody
    @RequestMapping("/addWps")
    public Integer addMcs(Wps wps){
        return wpsService.addWps(wps);
    }
    @ResponseBody
    @RequestMapping("/alterWps")
    public Integer alterWps(Wps wps){
        return wpsService.alterWps(wps);
    }

    @ResponseBody
    @RequestMapping("/deleteWps")
    public Integer deleteWps(String wpsId){
        return wpsService.deleteWps(wpsId);
    }
}
