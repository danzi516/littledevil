package cn.com.hd.domain.company;

public class CompanyPayType {
    private Integer id;

    private String payType;

    private Integer companyId;

    private String payTypePictrue;

    private String state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getPayTypePictrue() {
        return payTypePictrue;
    }

    public void setPayTypePictrue(String payTypePictrue) {
        this.payTypePictrue = payTypePictrue;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}