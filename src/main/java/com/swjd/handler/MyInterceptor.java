package com.swjd.handler;

import com.swjd.domain.Student;
import com.swjd.domain.Teacher;
import com.swjd.service.StudentsService;
import com.swjd.service.TeachersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyInterceptor implements HandlerInterceptor {
    @Autowired
    private StudentsService studentsService;
    @Autowired
    private TeachersService teachersService;
    @Autowired
    private Student student;
    @Autowired
    private Teacher teacher;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        teacher.setUsername(request.getParameter("usernameID"));
        teacher.setPassword(request.getParameter("passwordID"));
        student.setUsername(request.getParameter("usernameID"));
        student.setPassword(request.getParameter("passwordID"));
        if(request.getServletPath().equals("/students/students_interface")){
          if (studentsService.verifyStudent(student)==0){
            response.sendRedirect(request.getContextPath()+"/error.jsp");
            return false;
          }
            return true;
        }else {
            if (teachersService.verifyTeacher(teacher)==0){
                response.sendRedirect(request.getContextPath()+"/error.jsp");
                return false;
            }
            return true;
        }
    }
}
