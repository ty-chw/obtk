package com.swjd.dao;

import com.swjd.domain.Student;
import com.swjd.domain.Teacher;

import java.util.List;

public interface TeachersDao {
    //添加老师用户
    Integer insertTeacher(Teacher teacher);
    //查询所有老师
    List<Teacher> selectTeachers();
    //修改老师账号信息
    Integer updateTeacher(Teacher teacher);
    //删除教师账号
    int deleteTeacher(String teacherId);
}
