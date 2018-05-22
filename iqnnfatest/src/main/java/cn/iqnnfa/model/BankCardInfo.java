package cn.iqnnfa.model;

public class BankCardInfo {
	//银行卡账号
	private String panNo;
	//办卡时的手机号
	private String mobilePhone;
	//银行卡类型 借记卡：10；信用卡：20
	private String cardType;
	//信用卡背面末3位数字
	private Integer cvn2;
	//信用卡有效期
	private Integer validDate;
	public String getPanNo() {
		return panNo;
	}
	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public Integer getCvn2() {
		return cvn2;
	}
	public void setCvn2(Integer cvn2) {
		this.cvn2 = cvn2;
	}
	public Integer getValidDate() {
		return validDate;
	}
	public void setValidDate(Integer validDate) {
		this.validDate = validDate;
	}
	
}
