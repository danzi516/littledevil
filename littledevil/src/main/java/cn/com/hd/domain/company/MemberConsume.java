package cn.com.hd.domain.company;

import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;

public class MemberConsume {

	 private Integer id;

	    private int companyMemberId;

	    private int companyId;

	    private double consumeCash;

	    private double payCash;

	    private int commodityId;

	    private String isDelete;

	    private int userId;

	    private String consumeTime;
	    
	    int consumeNumber;
	    
	    int promotionId;
	    
	    private String consumeType;
	    
	    private User user;	
	    
	    private UserInfo userInfo;
	    
	    private CompanyInfo companyInfo;
	    
	    private CompanyCommodity companyCommodity;

	    
	    
		

		public String getConsumeType() {
			return consumeType;
		}

		public void setConsumeType(String consumeType) {
			this.consumeType = consumeType;
		}

		public int getPromotionId() {
			return promotionId;
		}

		public void setPromotionId(int promotionId) {
			this.promotionId = promotionId;
		}

		public CompanyCommodity getCompanyCommodity() {
			return companyCommodity;
		}

		public void setCompanyCommodity(CompanyCommodity companyCommodity) {
			this.companyCommodity = companyCommodity;
		}

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

		public double getConsumeCash() {
			return consumeCash;
		}

		public void setConsumeCash(double consumeCash) {
			this.consumeCash = consumeCash;
		}

		public double getPayCash() {
			return payCash;
		}

		public void setPayCash(double payCash) {
			this.payCash = payCash;
		}

		public int getCommodityId() {
			return commodityId;
		}

		public void setCommodityId(int commodityId) {
			this.commodityId = commodityId;
		}

		public String getIsDelete() {
			return isDelete;
		}

		public void setIsDelete(String isDelete) {
			this.isDelete = isDelete;
		}

		public int getUserId() {
			return userId;
		}

		public void setUserId(int userId) {
			this.userId = userId;
		}

		public String getConsumeTime() {
			return consumeTime;
		}

		public void setConsumeTime(String consumeTime) {
			this.consumeTime = consumeTime;
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

		public int getConsumeNumber() {
			return consumeNumber;
		}

		public void setConsumeNumber(int consumeNumber) {
			this.consumeNumber = consumeNumber;
		}

		
		
}
