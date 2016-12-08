package cn.com.hd.domain.company;

import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;

public class MemberRecharge {

	 private Integer id;

	    private String companyMemberId;

	    private String companyId;

	    private String rechargeCash;

	    private String payCash;

	    private String isDelete;

	    private String userId;

	    private String rechargeTime;

	    private User user;	
	    
	    private UserInfo userInfo;
	    
	    private CompanyInfo companyInfo;
	    
		public String getRechargeCash() {
			return rechargeCash;
		}

		public void setRechargeCash(String rechargeCash) {
			this.rechargeCash = rechargeCash;
		}

		public String getRechargeTime() {
			return rechargeTime;
		}

		public void setRechargeTime(String rechargeTime) {
			this.rechargeTime = rechargeTime;
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


		public String getPayCash() {
			return payCash;
		}

		public void setPayCash(String payCash) {
			this.payCash = payCash;
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
