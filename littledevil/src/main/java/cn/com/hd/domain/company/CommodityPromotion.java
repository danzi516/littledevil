package cn.com.hd.domain.company;

public class CommodityPromotion {
	private Integer id;
	private Integer companyId;
	private Integer commodityId;
	private Integer promotionId;
	private String creatTime;
	private CompanyInfo companyInfo;
	private CompanyCommodity companyCommodity;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public Integer getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}
	public Integer getPromotionId() {
		return promotionId;
	}
	public void setPromotionId(Integer promotionId) {
		this.promotionId = promotionId;
	}
	public String getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
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