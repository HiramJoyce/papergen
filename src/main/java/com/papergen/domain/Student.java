package com.papergen.domain;

public class Student {

    private String id;
    private String studentNum;
    private String userName;
    private String realName;
    private String chapter;
    private String section;
    private String password;

    public String getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum;
    }

    public String getChapter() {
        return chapter;
    }

    public void setChapter(String chapter) {
        this.chapter = chapter;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id='" + id + '\'' +
                ", studentNum='" + studentNum + '\'' +
                ", userName='" + userName + '\'' +
                ", realName='" + realName + '\'' +
                ", chapter='" + chapter + '\'' +
                ", section='" + section + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
