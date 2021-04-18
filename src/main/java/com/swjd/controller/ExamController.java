package com.swjd.controller;


import com.swjd.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/exam")
public class ExamController {
   @Autowired
   private ExamService examService;
    @ResponseBody
    @RequestMapping("/selectSubject")
    public List<String> selectSubject(){
        return examService.selectSubject();
    }

    @ResponseBody
    @RequestMapping("/examination")
    public List<Object> examination(String tet){
        return examService.examination(tet);
    }
}
