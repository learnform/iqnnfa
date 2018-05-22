package cn.iqnnfa.model;

public class Person {
	//签约的个人用户uid
	private Integer userId;
	//安心签个人用户名
	private String personName;
	//证件类型编码
	private Integer identTypeCode;
	//证件号码
	private Integer identNo;
	//用户的邮箱
	private String email;
	//用户的手机号
	private String mobilePhone;
	//用户的地址
	private String address;
	//认证方式
	private Integer authenticationMode;
	//安心签用户邮箱
	private String anXinSignEmail;
	//安心签用户手机号
	private String anXinSignMobilePhone;
	
	public String getAnXinSignEmail() {
		return anXinSignEmail;
	}
	public void setAnXinSignEmail(String anXinSignEmail) {
		this.anXinSignEmail = anXinSignEmail;
	}
	public String getAnXinSignMobilePhone() {
		return anXinSignMobilePhone;
	}
	public void setAnXinSignMobilePhone(String anXinSignMobilePhone) {
		this.anXinSignMobilePhone = anXinSignMobilePhone;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public Integer getIdentTypeCode() {
		return identTypeCode;
	}
	public void setIdentTypeCode(Integer identTypeCode) {
		this.identTypeCode = identTypeCode;
	}
	public Integer getIdentNo() {
		return identNo;
	}
	public void setIdentNo(Integer identNo) {
		this.identNo = identNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getAuthenticationMode() {
		return authenticationMode;
	}
	public void setAuthenticationMode(Integer authenticationMode) {
		this.authenticationMode = authenticationMode;
	}

}