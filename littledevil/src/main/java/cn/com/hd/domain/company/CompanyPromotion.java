package cn.com.hd.domain.company;

public class CompanyPromotion {
    private Integer id;

    private Integer companyId;

    private String promotionName;

    private Double promotionPrice;

    private String promotionLogo;

    private String state;

    private String promotionNote;

    private String creatTime;
    
    private String activeTime;
    
    private Double realPrice;
    
	public String getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
	}


	public String getActiveTime() {
		return activeTime;
	}

	public void setActiveTime(String activeTime) {
		this.activeTime = activeTime;
	}

	public Double getRealPrice() {
		return realPrice;
	}

	public void setRealPrice(Double realPrice) {
		this.realPrice = realPrice;
	}

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

	public String getPromotionName() {
		return promotionName;
	}

	public void setPromotionName(String promotionName) {
		this.promotionName = promotionName;
	}

	public Double getPromotionPrice() {
		return promotionPrice;
	}

	public void setPromotionPrice(Double promotionPrice) {
		this.promotionPrice = promotionPrice;
	}

	public String getPromotionLogo() {
		return promotionLogo;
	}

	public void setPromotionLogo(String promotionLogo) {
		this.promotionLogo = promotionLogo;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPromotionNote() {
		return promotionNote;
	}

	public void setPromotionNote(String promotionNote) {
		this.promotionNote = promotionNote;
	}

   
}