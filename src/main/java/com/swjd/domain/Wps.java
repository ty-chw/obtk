package com.swjd.domain;

//应用题题目实体类
public class Wps {
    Integer wpsId;
    String tet;
    String wpsName;
    String answer;

    public Integer getWpsId() {
        return wpsId;
    }

    public void setWpsId(Integer wpsId) {
        this.wpsId = wpsId;
    }

    public String getTet() {
        return tet;
    }

    public void setTet(String tet) {
        this.tet = tet;
    }

    public String getWpsName() {
        return wpsName;
    }

    public void setWpsName(String wpsName) {
        this.wpsName = wpsName;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "Wps{" +
                "wpsId=" + wpsId +
                ", tet='" + tet + '\'' +
                ", wpsName='" + wpsName + '\'' +
                ", answer='" + answer + '\'' +
                '}';
    }
}
