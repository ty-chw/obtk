package com.swjd.domain;

import org.springframework.stereotype.Component;


@Component
public class Result {
    private Integer resultId;
    private Integer studentId;
    private String tet;
    private Integer mcs;
    private Integer mcq;
    private Integer wps;
    private Integer tg;
    private Integer pwps;
    private String testTime;

    public String getTestTime() {
        return testTime;
    }

    public void setTestTime(String testTime) {
        this.testTime = testTime;
    }

    public Integer getResultId() {
        return resultId;
    }

    public void setResultId(Integer resultId) {
        this.resultId = resultId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getMcs() {
        return mcs;
    }

    public void setMcs(Integer mcs) {
        this.mcs = mcs;
    }

    public Integer getWps() {
        return wps;
    }

    public void setWps(Integer wps) {
        this.wps = wps;
    }

    public Integer getTg() {
        return tg;
    }

    public void setTg(Integer tg) {
        this.tg = tg;
    }

    public String getTet() {
        return tet;
    }

    public void setTet(String tet) {
        this.tet = tet;
    }

    public Integer getMcq() {
        return mcq;
    }

    public void setMcq(Integer mcq) {
        this.mcq = mcq;
    }

    public Integer getPwps() {
        return pwps;
    }

    public void setPwps(Integer pwps) {
        this.pwps = pwps;
    }

    @Override
    public String toString() {
        return "Result{" +
                "resultId=" + resultId +
                ", studentId=" + studentId +
                ", tet='" + tet + '\'' +
                ", mcs='" + mcs + '\'' +
                ", mcq='" + mcq + '\'' +
                ", wps='" + wps + '\'' +
                ", tg='" + tg + '\'' +
                ", pwps=" + pwps +
                ", testTime=" + testTime +
                '}';
    }
}
