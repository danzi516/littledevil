package cn.com.hd.domain.sys;

import java.util.List;

public class AppInfo {
    private Integer id;

    private String appName;

    private String appCode;

    private String requestUrl;

    private String appLogo;

    private Integer appSort;

    private String isPay;

    private String state;
    
    private AppExtendInfo appExtendInfo;
    
    private List<AppOperation> appOperationList;

    public List<AppOperation> getAppOperationList() {
		return appOperationList;
	}

	public void setAppOperationList(List<AppOperation> appOperationList) {
		this.appOperationList = appOperationList;
	}

	public AppExtendInfo getAppExtendInfo() {
		return appExtendInfo;
	}

	public void setAppExtendInfo(AppExtendInfo appExtendInfo) {
		this.appExtendInfo = appExtendInfo;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getAppCode() {
        return appCode;
    }

    public void setAppCode(String appCode) {
        this.appCode = appCode;
    }

    public String getRequestUrl() {
        return requestUrl;
    }

    public void setRequestUrl(String requestUrl) {
        this.requestUrl = requestUrl;
    }

    public String getAppLogo() {
        return appLogo;
    }

    public void setAppLogo(String appLogo) {
        this.appLogo = appLogo;
    }

    public Integer getAppSort() {
        return appSort;
    }

    public void setAppSort(Integer appSort) {
        this.appSort = appSort;
    }

    public String getIsPay() {
        return isPay;
    }

    public void setIsPay(String isPay) {
        this.isPay = isPay;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}