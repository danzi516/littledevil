package cn.com.hd.domain.company;

import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;

public class CompanyStaff {
    private Integer id;

    private Integer userId;

    private Integer companyId;

    private Integer roleId;

    private String isDelete;
    
    private User user;
    
    private UserInfo userInfo;
    
    private CompanyRole role;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public CompanyRole getRole() {
		return role;
	}

	public void setRole(CompanyRole role) {
		this.role = role;
	}
}