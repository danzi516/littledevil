package cn.com.hd.common.client;

public class Teacher {

    private String starcId;//教师starc主键 教师主键
	
	private String name;//名称
	
	private Boolean isAdmin;//是否是管理员
	
	private String phone;
	
	private String weixin;
	
	private Boolean gender;//  性别 true为男

	public String getStarcId() {
		return starcId;
	}

	public void setStarcId(String starcId) {
		this.starcId = starcId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getWeixin() {
		return weixin;
	}

	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}
	
	
}
