package com.swjd.controller;

import com.swjd.domain.Pwps;
import com.swjd.service.PwpsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/pwps")
public class PwpsController {
  @Autowired
    private PwpsService pwpsService;

    @ResponseBody
    @RequestMapping("/insertPwps")
    public Integer insertPwps(Pwps pwps){
        return pwpsService.insertPwps(pwps);
    }
    @ResponseBody
    @RequestMapping("/selectTetPwpss")
    public List<Pwps> selectTetPwpss(String tet){
    return pwpsService.selectTetPwpss(tet);
  }

    @ResponseBody
    @RequestMapping("/selectPwpsTet")
    public List<String> selectPwpsTet(){
    return pwpsService.selectPwpsTet();
  }
       @ResponseBody
       @RequestMapping("/alterPwpsTf")
       public Integer alterPwpsTf(String pwpsId){
         return pwpsService.updatePwpsTf(pwpsId);
       }
}
