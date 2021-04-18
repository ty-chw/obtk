package com.swjd.controller;

import com.swjd.domain.Student;
import com.swjd.domain.Teacher;
import com.swjd.service.TeachersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("/teachers")
public class TeachersController {
    @Autowired
    private TeachersService teachersService;

    @ResponseBody
    @RequestMapping("/addTeacher")
    public Integer addStudent(Teacher teacher){
        return teachersService.addTeacher(teacher);
    }

    @ResponseBody
    @RequestMapping("/verifyTeacher")
    public Integer verifyTeacher(Teacher teacher){
        return teachersService.verifyTeacher(teacher);
    }

    @RequestMapping("/teachers_interface")
    public String teachers_interface(HttpServletRequest request, Teacher teacher){
        teacher.setUsername(request.getParameter("usernameID"));
        teacher.setPassword(request.getParameter("passwordID"));
        request.setAttribute("teacher",teacher);
        return "teachers_interface";
    }

    @ResponseBody
    @RequestMapping("/selectTeacherInformation")
    public Teacher selectTeacherInformation(String username){
        return teachersService.selectTeacherInformation(username);
    }

    @ResponseBody
    @RequestMapping("/selectTeachersInformation")
    public List<Teacher> selectTeachersInformation(){
        return teachersService.selectTeachersInformation();
    }

    @ResponseBody
    @RequestMapping("/alterTeacherInformation")
    public Integer alterTeacherInformation(Teacher teacher){
        return teachersService.alterTeacherInformation(teacher);
    }

    @ResponseBody
    @RequestMapping("/deleteTeacher")
    public Integer deleteTeacher(String teacherId){
        return teachersService.deleteTeacher(teacherId);
    }
}
