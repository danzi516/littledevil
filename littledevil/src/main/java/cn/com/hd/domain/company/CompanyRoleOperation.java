package cn.com.hd.domain.company;

import java.util.List;

import cn.com.hd.domain.sys.AppInfo;
import cn.com.hd.domain.sys.AppOperation;

public class CompanyRoleOperation {
    private Integer id;

    private Integer roleId;

    private Integer appId;

    private Integer operationId;
    
    private CompanyRole role;
    
    private AppInfo appInfo;
    
    private AppOperation operation;

    private String operationIdArry;
    
    public String getOperationIdArry() {
		return operationIdArry;
	}

	public void setOperationIdArry(String operationIdArry) {
		this.operationIdArry = operationIdArry;
	}

	public CompanyRole getRole() {
		return role;
	}

	public void setRole(CompanyRole role) {
		this.role = role;
	}

	public AppInfo getAppInfo() {
		return appInfo;
	}

	public void setAppInfo(AppInfo appInfo) {
		this.appInfo = appInfo;
	}

	public AppOperation getOperation() {
		return operation;
	}

	public void setOperation(AppOperation operation) {
		this.operation = operation;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getAppId() {
        return appId;
    }

    public void setAppId(Integer appId) {
        this.appId = appId;
    }

    public Integer getOperationId() {
        return operationId;
    }

    public void setOperationId(Integer operationId) {
        this.operationId = operationId;
    }
}