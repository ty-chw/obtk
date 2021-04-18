package com.swjd.controller;

import com.swjd.domain.Mcs;
import com.swjd.service.McsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/mcs")
public class McsController {
    @Autowired
    private McsService mcsService;

    @ResponseBody
    @RequestMapping("/selectMcsTet")
    public List<String> selectMcsTet(){
        return mcsService.selectMcsTet();
    }

//    @ResponseBody
//    @RequestMapping("/selectMcs")
//    public List<Mcs> selectMcs(){
//        return mcsService.selectMcs();
//    }
    @ResponseBody
    @RequestMapping("/selectTetMcs")
    public List<Mcs> selectTetMcs(String tet){
        return mcsService.selectTetMcs(tet);
    }

    @ResponseBody
    @RequestMapping("/addMcs")
    public Integer addMcs(Mcs mcs){
        return mcsService.addMcs(mcs);
    }

    @ResponseBody
    @RequestMapping("/alterMcs")
    public Integer alterMcs(Mcs mcs){
        return mcsService.alterMcs(mcs);
    }

    @ResponseBody
    @RequestMapping("/deleteMcs")
    public Integer deleteMcs(String mcsId){
        return mcsService.deleteMcs(mcsId);
    }
}
