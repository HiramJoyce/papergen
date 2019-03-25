package com.papergen.domain;

public class Question {
    private String id;
    private Integer chapter;    // 级别 小学1 初中2 高中3
    private Integer section;    // 年级 小学123456 初中123 高中123
    private Integer subject;    // 科目 语文1 数学2 英语3 政治4 历史5 地理6 物理7 化学8 生物9
    private Integer level;
    private String body;
    private Integer type;
    private Integer optionNum;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private String optionE;
    private String rightOption;
    private Boolean rightJudge;
    private String rightFilling;
    private String rightEssay;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getOptionNum() {
        return optionNum;
    }

    public void setOptionNum(Integer optionNum) {
        this.optionNum = optionNum;
    }

    public String getOptionA() {
        return optionA;
    }

    public void setOptionA(String optionA) {
        this.optionA = optionA;
    }

    public String getOptionB() {
        return optionB;
    }

    public void setOptionB(String optionB) {
        this.optionB = optionB;
    }

    public String getOptionC() {
        return optionC;
    }

    public void setOptionC(String optionC) {
        this.optionC = optionC;
    }

    public String getOptionD() {
        return optionD;
    }

    public void setOptionD(String optionD) {
        this.optionD = optionD;
    }

    public String getOptionE() {
        return optionE;
    }

    public void setOptionE(String optionE) {
        this.optionE = optionE;
    }

    public String getRightOption() {
        return rightOption;
    }

    public void setRightOption(String rightOption) {
        this.rightOption = rightOption;
    }

    public Boolean getRightJudge() {
        return rightJudge;
    }

    public void setRightJudge(Boolean rightJudge) {
        this.rightJudge = rightJudge;
    }

    public String getRightFilling() {
        return rightFilling;
    }

    public void setRightFilling(String rightFilling) {
        this.rightFilling = rightFilling;
    }

    public String getRightEssay() {
        return rightEssay;
    }

    public void setRightEssay(String rightEssay) {
        this.rightEssay = rightEssay;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id='" + id + '\'' +
                ", chapter=" + chapter +
                ", section=" + section +
                ", subject=" + subject +
                ", level=" + level +
                ", body='" + body + '\'' +
                ", type=" + type +
                ", optionNum=" + optionNum +
                ", optionA='" + optionA + '\'' +
                ", optionB='" + optionB + '\'' +
                ", optionC='" + optionC + '\'' +
                ", optionD='" + optionD + '\'' +
                ", optionE='" + optionE + '\'' +
                ", rightOption='" + rightOption + '\'' +
                ", rightJudge=" + rightJudge +
                ", rightFilling='" + rightFilling + '\'' +
                ", rightEssay='" + rightEssay + '\'' +
                '}';
    }
}
