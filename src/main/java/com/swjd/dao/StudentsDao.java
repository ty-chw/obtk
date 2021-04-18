package com.swjd.dao;

import com.swjd.domain.Student;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentsDao {
    //添加学生
    Integer insertStudent(Student student);
    //查询所有学生
    List<Student> selectStudents();
    //修改学生账号信息
    Integer updateStudent(Student student);
    //查询所有班级
    List<String> selectStudentsClass();
    //删除学生账号
    int deleteStudent(String studentId);
}
