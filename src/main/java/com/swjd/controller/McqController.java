package com.swjd.controller;

import com.swjd.domain.Mcq;
import com.swjd.domain.Mcs;
import com.swjd.service.McqService;
import com.swjd.service.McsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/mcq")
public class McqController {
    @Autowired
    private McqService mcqService;

    @ResponseBody
    @RequestMapping("/selectMcqTet")
    public List<String> selectMcqTet(){
        return mcqService.selectMcqTet();
    }

//    @ResponseBody
//    @RequestMapping("/selectMcq")
//    public List<Mcq> selectMcq(){
//        return mcqService.selectMcq();
//    }
    @ResponseBody
    @RequestMapping("/selectTetMcq")
    public List<Mcq> selectTetMcq(String tet){
        return mcqService.selectTetMcq(tet);
    }

    @ResponseBody
    @RequestMapping("/addMcq")
    public Integer addMcq(Mcq mcq){
        return mcqService.addMcq(mcq);
    }

    @ResponseBody
    @RequestMapping("/alterMcq")
    public Integer alterMcq(Mcq mcq){
        return mcqService.alterMcq(mcq);
    }
    @ResponseBody
    @RequestMapping("/deleteMcq")
    public Integer deleteMcq(String mcqId){
        return mcqService.deleteMcq(mcqId);
    }
}
