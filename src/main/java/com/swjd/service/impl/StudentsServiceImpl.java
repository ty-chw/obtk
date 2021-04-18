package com.swjd.service.impl;

import com.swjd.dao.StudentsDao;
import com.swjd.domain.Student;
import com.swjd.service.StudentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class StudentsServiceImpl implements StudentsService {
    @Autowired
    private StudentsDao studentsDao;
    @Override
    public int addStudent(Student student) {
        for (Student list: studentsDao.selectStudents()) {
            if(list.getUsername().equals(student.getUsername())){
                return 0;
            }
        }
        return studentsDao.insertStudent(student);
    }

    @Override
    public int verifyStudent(Student student) {
        for (Student list: studentsDao.selectStudents()) {
            if(list.getUsername().equals(student.getUsername())&&list.getPassword().equals(student.getPassword())){
                return 1;
            }
        }
        return 0;
    }

    @Override
    public Student selectStudentInformation(String username) {
        for (Student student:studentsDao.selectStudents()){
            if(username.equals(student.getUsername())){
                return student;
            }
        }
        return null;
    }

    @Override
    public int alterStudentInformation(Student student) {
        return studentsDao.updateStudent(student);
    }

    @Override
    public List<Student> selectStudentsInformation() {
        return studentsDao.selectStudents();
    }

    @Override
    public List<Student> selectClassStudentsInformation(String studentClass) {
        List<Student> students=new ArrayList<>();
        for(Student student:studentsDao.selectStudents()){
            if(studentClass.equals(student.getStudentClass())){
               students.add(student);
            }
        }
        return students;
    }

    @Override
    public List<String> selectStudentsClass() {
        return studentsDao.selectStudentsClass();
    }

    @Override
    public int deleteStudent(String studentId) {
        return studentsDao.deleteStudent(studentId);
    }

}
