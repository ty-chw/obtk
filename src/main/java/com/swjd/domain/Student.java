package com.swjd.domain;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Student {
    private Integer studentId;
    private String studentClass;
    private String studentName;
    private String username;
    private String password;
    private List<Result> results;

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Result> getResult() {
        return results;
    }

    public void setResult(List<Result> result) {
        this.results = result;
    }

    public String getStudentClass() {
        return studentClass;
    }

    public void setStudentClass(String studentClass) {
        this.studentClass = studentClass;
    }

    public List<Result> getResults() {
        return results;
    }

    public void setResults(List<Result> results) {
        this.results = results;
    }

    @Override
    public String toString() {
        return "Student{" +
                "studentId=" + studentId +
                ", studentClass='" + studentClass + '\'' +
                ", studentName='" + studentName + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", results=" + results +
                '}';
    }
}
