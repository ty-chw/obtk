package com.swjd.domain;

public class Mcq {
    Integer mcqId;
    String tet;
    String mcqName;
    String options1;
    String options2;
    String options3;
    String options4;
    String answer;

    public Integer getMcqId() {
        return mcqId;
    }

    public void setMcqId(Integer mcqId) {
        this.mcqId = mcqId;
    }

    public String getTet() {
        return tet;
    }

    public void setTet(String tet) {
        this.tet = tet;
    }

    public String getMcqName() {
        return mcqName;
    }

    public void setMcqName(String mcqName) {
        this.mcqName = mcqName;
    }

    public String getOptions1() {
        return options1;
    }

    public void setOptions1(String options1) {
        this.options1 = options1;
    }

    public String getOptions2() {
        return options2;
    }

    public void setOptions2(String options2) {
        this.options2 = options2;
    }

    public String getOptions3() {
        return options3;
    }

    public void setOptions3(String options3) {
        this.options3 = options3;
    }

    public String getOptions4() {
        return options4;
    }

    public void setOptions4(String options4) {
        this.options4 = options4;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "McqDao{" +
                "mcqId=" + mcqId +
                ", tet='" + tet + '\'' +
                ", mcqName='" + mcqName + '\'' +
                ", options1='" + options1 + '\'' +
                ", options2='" + options2 + '\'' +
                ", options3='" + options3 + '\'' +
                ", options4='" + options4 + '\'' +
                ", answer='" + answer + '\'' +
                '}';
    }
}
