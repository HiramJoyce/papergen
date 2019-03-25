package com.papergen.domain;

import java.util.Date;

public class Paper {

    private String id;
    private String title;
    private String time;
    private Integer chapter;
    private Integer section;
    private Integer subject;
    private Integer level;
    private Integer radioNum;
    private String radioIds;
    private Integer multipleNum;
    private String multipleIds;
    private Integer judgeNum;
    private String judgeIds;
    private Integer fillingNum;
    private String fillingIds;
    private Integer essayNum;
    private String essayIds;
    private String state;
    private Date createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getChapter() {
        return chapter;
    }

    public void setChapter(Integer chapter) {
        this.chapter = chapter;
    }

    public Integer getSection() {
        return section;
    }

    public void setSection(Integer section) {
        this.section = section;
    }

    public Integer getSubject() {
        return subject;
    }

    public void setSubject(Integer subject) {
        this.subject = subject;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getRadioNum() {
        return radioNum;
    }

    public void setRadioNum(Integer radioNum) {
        this.radioNum = radioNum;
    }

    public String getRadioIds() {
        return radioIds;
    }

    public void setRadioIds(String radioIds) {
        this.radioIds = radioIds;
    }

    public Integer getMultipleNum() {
        return multipleNum;
    }

    public void setMultipleNum(Integer multipleNum) {
        this.multipleNum = multipleNum;
    }

    public String getMultipleIds() {
        return multipleIds;
    }

    public void setMultipleIds(String multipleIds) {
        this.multipleIds = multipleIds;
    }

    public Integer getJudgeNum() {
        return judgeNum;
    }

    public void setJudgeNum(Integer judgeNum) {
        this.judgeNum = judgeNum;
    }

    public String getJudgeIds() {
        return judgeIds;
    }

    public void setJudgeIds(String judgeIds) {
        this.judgeIds = judgeIds;
    }

    public Integer getFillingNum() {
        return fillingNum;
    }

    public void setFillingNum(Integer fillingNum) {
        this.fillingNum = fillingNum;
    }

    public String getFillingIds() {
        return fillingIds;
    }

    public void setFillingIds(String fillingIds) {
        this.fillingIds = fillingIds;
    }

    public Integer getEssayNum() {
        return essayNum;
    }

    public void setEssayNum(Integer essayNum) {
        this.essayNum = essayNum;
    }

    public String getEssayIds() {
        return essayIds;
    }

    public void setEssayIds(String essayIds) {
        this.essayIds = essayIds;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Paper{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", time='" + time + '\'' +
                ", chapter=" + chapter +
                ", section=" + section +
                ", subject=" + subject +
                ", level=" + level +
                ", radioNum=" + radioNum +
                ", radioIds='" + radioIds + '\'' +
                ", multipleNum=" + multipleNum +
                ", multipleIds='" + multipleIds + '\'' +
                ", judgeNum=" + judgeNum +
                ", judgeIds='" + judgeIds + '\'' +
                ", fillingNum=" + fillingNum +
                ", fillingIds='" + fillingIds + '\'' +
                ", essayNum=" + essayNum +
                ", essayIds='" + essayIds + '\'' +
                ", state='" + state + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
