package com.papergen.domain;


public class ErrorQuestion {
	private String id;
	private Question question;
	private int type;
	private String myOption;
	private boolean myJudge;
	private String myFilling;
	private String myEssay;
	private Student student;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getMyOption() {
		return myOption;
	}
	public void setMyOption(String myOption) {
		this.myOption = myOption;
	}
	public boolean isMyJudge() {
		return myJudge;
	}
	public void setMyJudge(boolean myJudge) {
		this.myJudge = myJudge;
	}
	public String getMyFilling() {
		return myFilling;
	}
	public void setMyFilling(String myFilling) {
		this.myFilling = myFilling;
	}
	public String getMyEssay() {
		return myEssay;
	}
	public void setMyEssay(String myEssay) {
		this.myEssay = myEssay;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	@Override
	public String toString() {
		return "ErrorQuestion [id=" + id + ", question=" + question + ", type=" + type + ", myOption=" + myOption
				+ ", myJudge=" + myJudge + ", myFilling=" + myFilling + ", myEssay=" + myEssay + ", student=" + student
				+ "]";
	}
	
	
}
