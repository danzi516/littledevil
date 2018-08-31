package cn.com.hd.domain.company;

import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;

public class MemberRecharge {

	 private Integer id;

	    private int companyMemberId;

	    private int companyId;

	    private double rechargeCash;

	    private double payCash;

	    private String isDelete;

	    private int userId;

	    private String rechargeTime;
	    
	    private int recorderId;
	    
	    private String balanceTime;
	    
	    private String balanceState;

	    private User user;	
	    
	    private UserInfo userInfo;
	    
	    private CompanyInfo companyInfo;

	    
	    
	    
	    
	    
		public int getRecorderId() {
			return recorderId;
		}

		public void setRecorderId(int recorderId) {
			this.recorderId = recorderId;
		}

		public String getBalanceTime() {
			return balanceTime;
		}

		public void setBalanceTime(String balanceTime) {
			this.balanceTime = balanceTime;
		}

		public String getBalanceState() {
			return balanceState;
		}

		public void setBalanceState(String balanceState) {
			this.balanceState = balanceState;
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

		public double getRechargeCash() {
			return rechargeCash;
		}

		public void setRechargeCash(double rechargeCash) {
			this.rechargeCash = rechargeCash;
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

		public int getUserId() {
			return userId;
		}

		public void setUserId(int userId) {
			this.userId = userId;
		}

		public String getRechargeTime() {
			return rechargeTime;
		}

		public void setRechargeTime(String rechargeTime) {
			this.rechargeTime = rechargeTime;
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
