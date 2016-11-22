package cn.com.hd.common.client;

import java.util.List;

public class Student {

	 private String starcId;//学生starcId 学生用户主键
		
	 private String name;//名称
	 
	 private String clazzStarcId;//班级主键
	 
     private String genderStr;// 性别  性别 true为男
	 
	 private Boolean gender;// 性别  性别 true为男
	 
	 private List<Guardian> guardianList;

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

	public String getClazzStarcId() {
		return clazzStarcId;
	}

	public void setClazzStarcId(String clazzStarcId) {
		this.clazzStarcId = clazzStarcId;
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

	public List<Guardian> getGuardianList() {
		return guardianList;
	}

	public void setGuardianList(List<Guardian> guardianList) {
		this.guardianList = guardianList;
	}
	 
	 
	 
}
