package cn.com.hd.domain.company;

import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;

public class MemberConsume {

	 private Integer id;

	    private String companyMemberId;

	    private String companyId;

	    private String consumeCash;

	    private String payCash;

	    private String commodityId;

	    private String isDelete;

	    private String userId;

	    private String consumeTime;

	    private User user;	
	    
	    private UserInfo userInfo;
	    
	    private CompanyInfo companyInfo;
	    
	    private CompanyCommodity companyCommodity;

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

		public String getCompanyMemberId() {
			return companyMemberId;
		}

		public void setCompanyMemberId(String companyMemberId) {
			this.companyMemberId = companyMemberId;
		}

		public String getCompanyId() {
			return companyId;
		}

		public void setCompanyId(String companyId) {
			this.companyId = companyId;
		}

		public String getConsumeCash() {
			return consumeCash;
		}

		public void setConsumeCash(String consumeCash) {
			this.consumeCash = consumeCash;
		}

		public String getPayCash() {
			return payCash;
		}

		public void setPayCash(String payCash) {
			this.payCash = payCash;
		}

		public String getCommodityId() {
			return commodityId;
		}

		public void setCommodityId(String commodityId) {
			this.commodityId = commodityId;
		}

		public String getIsDelete() {
			return isDelete;
		}

		public void setIsDelete(String isDelete) {
			this.isDelete = isDelete;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
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
}
