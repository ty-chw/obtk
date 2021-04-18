package com.swjd.domain;

//选择题题目实体类
public class Mcs {
    Integer mcsId;
    String tet;
    String mcsName;
    String options1;
    String options2;
    String options3;
    String options4;
    String answer;

    public Integer getMcsId() {
        return mcsId;
    }

    public void setMcsId(Integer mcsId) {
        this.mcsId = mcsId;
    }

    public String getTet() {
        return tet;
    }

    public void setTet(String tet) {
        this.tet = tet;
    }

    public String getMcsName() {
        return mcsName;
    }

    public void setMcsName(String mcsName) {
        this.mcsName = mcsName;
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
        return "Mcs{" +
                "mcsId=" + mcsId +
                ", tet='" + tet + '\'' +
                ", mcsName='" + mcsName + '\'' +
                ", options1='" + options1 + '\'' +
                ", options2='" + options2 + '\'' +
                ", options3='" + options3 + '\'' +
                ", options4='" + options4 + '\'' +
                ", answer='" + answer + '\'' +
                '}';
    }
}
