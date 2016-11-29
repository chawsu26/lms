package com.myproject.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="exam_result")
@IdClass(value=ExamResultPK.class)
public class ExamResult {
	//@Id
	//@GeneratedValue(strategy=GenerationType.AUTO)
	//public int id;
	
	@Id
	@ManyToOne
    @JoinColumn(name="subject_code", nullable=false)
	public Subject subject;
	
	@Column(name="mark")
	public String mark;
	
	@Id
	@Column(name="email")
	public String email;

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	

	
	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
