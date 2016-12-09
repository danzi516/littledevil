package cn.com.hd.domain.uc;

import java.util.Date;

public class UserInfo {
    private Integer id;

    private String ucName;

    private String sex;

    private String logo;

    private String sign;

    private Date birthday;

    private String weixin;

    private String registerTime;
    
    private User user;
    
    private String sexCode;
    
    private Integer roleId;

    public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUcName() {
        return ucName;
    }

    public void setUcName(String ucName) {
        this.ucName = ucName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin;
    }

    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime;
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getSexCode() {
		if(sex!=null&&sex.equals("0")){
			sexCode="男";
		}else if(sex!=null&&sex.equals("1")){
			sexCode="女";
		}else{
			sexCode="保密";
		}
		return sexCode;
	}

	public void setSexCode(String sexCode) {
		this.sexCode = sexCode;
	}
}