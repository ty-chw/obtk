package com.swjd.controller;

import com.swjd.domain.Student;
import com.swjd.service.PwpsService;
import com.swjd.service.ResultsService;
import com.swjd.service.StudentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentsController {
    @Autowired
    private StudentsService studentsService;
    @Autowired
    private ResultsService resultsService;
    @Autowired
    private PwpsService pwpsService;
    @ResponseBody
    @RequestMapping("/addStudent")
    public Integer addStudent(Student student){
        return studentsService.addStudent(student);
    }

    @ResponseBody
    @RequestMapping("/verifyStudent")
    public Integer verifyStudent(Student student){

        return studentsService.verifyStudent(student);
    }

    @RequestMapping("/students_interface")
    public String students_interface(HttpServletRequest request,Student student){
        student.setUsername(request.getParameter("usernameID"));
        student.setPassword(request.getParameter("passwordID"));
        request.setAttribute("student",student);
        return "students_interface";
    }

    @ResponseBody
    @RequestMapping("/selectStudentInformation")
    public Student selectStudentInformation(String username){
        return studentsService.selectStudentInformation(username);
    }

    @ResponseBody
    @RequestMapping("/alterStudentInformation")
    public Integer alterStudentInformation(Student student){
        return studentsService.alterStudentInformation(student);
    }

    @ResponseBody
    @RequestMapping("/selectStudentsInformation")
    public List<Student> selectStudentsInformation(){
        return studentsService.selectStudentsInformation();
    }

    @ResponseBody
    @RequestMapping("/selectClassStudentsInformation")
    public List<Student> selectClassStudentsInformation(String studentClass){
        if(studentClass.equals("all")){
            return studentsService.selectStudentsInformation();
        }else {
        return studentsService.selectClassStudentsInformation(studentClass);
        }
    }

    @ResponseBody
    @RequestMapping("/selectStudentClass")
    public List<String> selectStudentClass(){
        return studentsService.selectStudentsClass();
    }

    @ResponseBody
    @RequestMapping("/deleteStudent")
    public Integer deleteStudent(String studentId){
        return studentsService.deleteStudent(studentId);
    }

}
