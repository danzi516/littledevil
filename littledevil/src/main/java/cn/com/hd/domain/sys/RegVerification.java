package cn.com.hd.domain.sys;

import java.util.List;

public class RegVerification {
	private Integer id;

	private Integer salemanId;

	private String invitationCode;

	private String state;
	
	private String creatTime;
	
	private String updateTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSalemanId() {
		return salemanId;
	}

	public void setSalemanId(Integer salemanId) {
		this.salemanId = salemanId;
	}

	public String getInvitationCode() {
		return invitationCode;
	}

	public void setInvitationCode(String invitationCode) {
		this.invitationCode = invitationCode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
	
	

}