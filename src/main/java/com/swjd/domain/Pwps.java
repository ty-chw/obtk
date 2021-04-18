package com.swjd.domain;

import java.util.List;

//老师待审核应用题题目实体类
public class Pwps {
  private Integer pwpsId;
  private Integer resultsId;
  private Integer wpsId;
  private String answers;
  private boolean tf;
  private Wps wps;


    public Integer getPwpsId() {
        return pwpsId;
    }

    public void setPwpsId(Integer pwpsId) {
        this.pwpsId = pwpsId;
    }

    public Integer getResultsId() {
        return resultsId;
    }

    public void setResultsId(Integer resultsId) {
        this.resultsId = resultsId;
    }

    public Integer getWpsId() {
        return wpsId;
    }

    public void setWpsId(Integer wpsId) {
        this.wpsId = wpsId;
    }

    public String getAnswers() {
        return answers;
    }

    public void setAnswers(String answers) {
        this.answers = answers;
    }

    public boolean getTf() {
        return tf;
    }

    public void setTf(boolean tf) {
        this.tf = tf;
    }

    public Wps getWps() {
        return wps;
    }

    public void setWps(Wps wps) {
        this.wps = wps;
    }

    @Override
    public String toString() {
        return "Pwps{" +
                "pwpsId=" + pwpsId +
                ", resultsId=" + resultsId +
                ", wpsId=" + wpsId +
                ", answers='" + answers + '\'' +
                ", tf='" + tf + '\'' +
                ", wps=" + wps +
                '}';
    }
}
