package cn.com.hd.domain.company;

import java.sql.Timestamp;

import cn.com.hd.domain.uc.User;

public class CompanyRechargeLog {
    private Integer id;

    private String companyId;
    
    private String validityDate;
    
    private String creatTime;
    
    private CompanyInfo CompanyInfo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getValidityDate() {
		return validityDate;
	}

	public void setValidityDate(String validityDate) {
		this.validityDate = validityDate;
	}

	public String getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
	}

	public CompanyInfo getCompanyInfo() {
		return CompanyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		CompanyInfo = companyInfo;
	}
    
    

}