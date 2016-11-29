package com.myproject.bean;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="subjects")
public class Subject {
	@Id
	@Column(name="subject_code")
	public String subjectCode;
	@Column(name="subject_name")
	public String subjectName;
	
	@OneToMany(targetEntity=ExamResult.class,mappedBy="subject")
	public List<ExamResult> examResults;
	
	public List<ExamResult> getExamResults() {
		return examResults;
	}
	public void setExamResults(List<ExamResult> examResults) {
		this.examResults = examResults;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	
}
