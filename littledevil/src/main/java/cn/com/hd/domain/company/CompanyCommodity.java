package cn.com.hd.domain.company;

public class CompanyCommodity {
    private Integer id;

    private Integer companyId;

    private String commodityName;

    private double commodityPrice;

    private String commodityLogo;

    private String state;

    private String commodityNote;
    private String creatTime;
    private double realPrice;
    
    public String getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
	}

	public double getRealPrice() {
		return realPrice;
	}

	public void setRealPrice(double realPrice) {
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

    public String getCommodityName() {
        return commodityName;
    }

    public void setCommodityName(String commodityName) {
        this.commodityName = commodityName;
    }

    public double getCommodityPrice() {
        return commodityPrice;
    }

    public void setCommodityPrice(double commodityPrice) {
        this.commodityPrice = commodityPrice;
    }

    public String getCommodityLogo() {
        return commodityLogo;
    }

    public void setCommodityLogo(String commodityLogo) {
        this.commodityLogo = commodityLogo;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCommodityNote() {
        return commodityNote;
    }

    public void setCommodityNote(String commodityNote) {
        this.commodityNote = commodityNote;
    }
}