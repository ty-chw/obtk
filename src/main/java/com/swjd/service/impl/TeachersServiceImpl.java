package com.swjd.service.impl;

import com.swjd.dao.TeachersDao;
import com.swjd.domain.Student;
import com.swjd.domain.Teacher;
import com.swjd.service.TeachersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeachersServiceImpl implements TeachersService {
    @Autowired
    private TeachersDao teachersDao;
    @Override
    public int addTeacher(Teacher teacher) {
        for (Teacher list: teachersDao.selectTeachers()) {
            if(list.getUsername().equals(teacher.getUsername())){
                return 0;
            }
        }
        return teachersDao.insertTeacher(teacher);
    }

    @Override
    public int verifyTeacher(Teacher teacher) {
        for (Teacher list: teachersDao.selectTeachers()) {
            if(list.getUsername().equals(teacher.getUsername())&&list.getPassword().equals(teacher.getPassword())){
                return 1;
            }
        }
        return 0;
    }

    @Override
    public Teacher selectTeacherInformation(String username) {
        for (Teacher teacher:teachersDao.selectTeachers()){
            if(username.equals(teacher.getUsername())){
                return teacher;
            }
        }
        return null;
    }

    @Override
    public int alterTeacherInformation(Teacher teacher) {
        return teachersDao.updateTeacher(teacher);
    }

    @Override
    public List<Teacher> selectTeachersInformation() {
        return teachersDao.selectTeachers();
    }

    @Override
    public int deleteTeacher(String teacherId) {
        return teachersDao.deleteTeacher(teacherId);
    }
}
