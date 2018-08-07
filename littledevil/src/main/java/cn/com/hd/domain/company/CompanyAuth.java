package cn.com.hd.domain.company;

import java.sql.Timestamp;

import cn.com.hd.domain.uc.SaleMan;
import cn.com.hd.domain.uc.User;

public class CompanyAuth {
    private Integer id;

    private Integer salemanId;

    private Integer companyId;
    
    private String invitationCode;
    
    private String state;
    
    private String creatTime;
    
    private String updateTime;
    
    private String validityTime;
    
    private SaleMan saleman;
    
    private CompanyInfo company;

  
    
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

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
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

	public String getValidityTime() {
		return validityTime;
	}

	public void setValidityTime(String validityTime) {
		this.validityTime = validityTime;
	}

	public SaleMan getSaleman() {
		return saleman;
	}

	public void setSaleman(SaleMan saleman) {
		this.saleman = saleman;
	}

	public CompanyInfo getCompany() {
		return company;
	}

	public void setCompany(CompanyInfo company) {
		this.company = company;
	}

	public String getInvitationCode() {
		return invitationCode;
	}

	public void setInvitationCode(String invitationCode) {
		this.invitationCode = invitationCode;
	}
    
    
    

}