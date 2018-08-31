package cn.com.hd.domain.company;

import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;

public class MemberBillFlow {

	private Integer id;

	private int companyMemberId;
	
	private int companyId;
	
	private int userId;
	
	private int commodityId;
	
	private int promotionId;
	
	private double billCash;
	
	private double payCash;
	
	private String isDelete;
	
	private String flowType;
	
	private int consumeNumber;
	
	private int recorderId;
	
	private String billModel;
	
	private String creatTime;

	private User user;

	private UserInfo userInfo;

	private CompanyInfo companyInfo;

	private CompanyCommodity companyCommodity;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getCompanyMemberId() {
		return companyMemberId;
	}

	public void setCompanyMemberId(int companyMemberId) {
		this.companyMemberId = companyMemberId;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(int commodityId) {
		this.commodityId = commodityId;
	}

	public int getPromotionId() {
		return promotionId;
	}

	public void setPromotionId(int promotionId) {
		this.promotionId = promotionId;
	}

	public double getBillCash() {
		return billCash;
	}

	public void setBillCash(double billCash) {
		this.billCash = billCash;
	}

	public double getPayCash() {
		return payCash;
	}

	public void setPayCash(double payCash) {
		this.payCash = payCash;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public String getFlowType() {
		return flowType;
	}

	public void setFlowType(String flowType) {
		this.flowType = flowType;
	}

	public int getConsumeNumber() {
		return consumeNumber;
	}

	public void setConsumeNumber(int consumeNumber) {
		this.consumeNumber = consumeNumber;
	}

	public int getRecorderId() {
		return recorderId;
	}

	public void setRecorderId(int recorderId) {
		this.recorderId = recorderId;
	}

	public String getBillModel() {
		return billModel;
	}

	public void setBillModel(String billModel) {
		this.billModel = billModel;
	}

	public String getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
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

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}

	public CompanyCommodity getCompanyCommodity() {
		return companyCommodity;
	}

	public void setCompanyCommodity(CompanyCommodity companyCommodity) {
		this.companyCommodity = companyCommodity;
	}

}
