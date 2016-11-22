package cn.com.hd.common.client;

public class Guardian {

	private String starcId;//家长starcId 家长用户主键
	
	 private String name;//名称
	 
	 private String relation="家长";// 关系  ，偶然=家长
	 
	 private String phone;//手机号
	 
	 private String weixin;//微信号
	 
	 private String genderStr;// 性别  性别 true为男
	 
	 private Boolean gender;// 性别  性别 true为男

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

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
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

	public String getGenderStr() {
		return genderStr;
	}

	public void setGenderStr(String genderStr) {
		this.genderStr = genderStr;
	}

	public Boolean getGender() {
		if(getGenderStr()!=null&&!getGenderStr().equals("")){
			if(getGenderStr().equals("0")){
				return false;
			}else if(getGenderStr().equals("1")){
				return true;
			}
		}
		return true;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	} 
}
