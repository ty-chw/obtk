package com.swjd.service;


import com.swjd.domain.Student;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface StudentsService {
    //添加学生
    int addStudent(Student student);
    //判断用户信息
    int verifyStudent(Student student);
    //查询学生账号信息
    Student selectStudentInformation(String username);
    //修改学生账号信息
    int alterStudentInformation(Student student);
    //查询所有学生信息
    List<Student> selectStudentsInformation();
    //按班级所有学生信息
    List<Student> selectClassStudentsInformation(String studentClass);
    //查询所有班级
    List<String> selectStudentsClass();
    //删除学生账号
    int deleteStudent(String studentId);
}
