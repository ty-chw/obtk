package com.swjd.service;

import com.swjd.domain.Student;
import com.swjd.domain.Teacher;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TeachersService {
     //添加老师用户
    int addTeacher(Teacher teacher);
    //判断用户信息
    int verifyTeacher(Teacher teacher);
    //查询老师账号信息
    Teacher selectTeacherInformation(String username);
    //修改老师账号信息
    int alterTeacherInformation(Teacher teacher);
    //查询所有老师账号信息
    List<Teacher> selectTeachersInformation();
    //删除教师账号
    int deleteTeacher(String teacherId);
}
