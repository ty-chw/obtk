package com.swjd.controller;

import com.swjd.domain.Result;
import com.swjd.service.PwpsService;
import com.swjd.service.ResultsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;

@Controller
@RequestMapping("/result")
public class ResultsController {

    @Autowired
    private ResultsService resultsService;
    @Autowired
    private PwpsService pwpsService;

    @ResponseBody
    @RequestMapping("/insertResult")
    public Integer insertResult(Result result){
        return resultsService.insertResult(result);
    }
    @ResponseBody
    @RequestMapping("/selectResultId")
    public Integer selectResultId(){
        return resultsService.selectResultId();
    }

    @ResponseBody
    @RequestMapping("/alterResult")
    public Integer alterResult(Result result){
        return resultsService.updateResult(result);
    }

    @ResponseBody
    @RequestMapping("/selectStudentResultsTets")
    public List<String> selectStudentResultsTets(String studentId){
        return resultsService.selectStudentResultsTets(studentId);
    }

    @ResponseBody
    @RequestMapping("/selectStudentTetResults")
    public List<Result> selectStudentTetResults(Result result){
        return resultsService.selectStudentTetResults(result);
    }

    @ResponseBody
    @RequestMapping("/alterStudentResult")
    public Integer alterStudentResult(Result result){
        return resultsService.updateStudentResult(result);
    }

    @ResponseBody
    @RequestMapping("/deleteStudentResult")
    public Integer deleteStudentResult(String resultId){
        pwpsService.deletePwps(resultId);
        return resultsService.deleteStudentResult(resultId);
    }
}
