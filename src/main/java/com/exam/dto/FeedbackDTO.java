package com.exam.dto;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("FeedbackDTO")


public class FeedbackDTO {
	String userid;
	String gCode;
	String gContext;
    LocalDate feedbackdate;
    
	public FeedbackDTO() {
		// TODO Auto-generated constructor stub
	}

	public FeedbackDTO(String userid, String gCode, String gContext, LocalDate feedbackdate) {
		this.userid = userid;
		this.gCode = gCode;
		this.gContext = gContext;
		this.feedbackdate = feedbackdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getgCode() {
		return gCode;
	}

	public void setgCode(String gCode) {
		this.gCode = gCode;
	}

	public String getgContext() {
		return gContext;
	}

	public void setgContext(String gContext) {
		this.gContext = gContext;
	}

	public LocalDate getFeedbackdate() {
		return feedbackdate;
	}

	public void setFeedbackdate(LocalDate feedbackdate) {
		this.feedbackdate = feedbackdate;
	}

	@Override
	public String toString() {
		return "FeedbackDTO [userid=" + userid + ", gCode=" + gCode + ", gContext=" + gContext + ", feedbackdate="
				+ feedbackdate + "]";
	}

	

    
}