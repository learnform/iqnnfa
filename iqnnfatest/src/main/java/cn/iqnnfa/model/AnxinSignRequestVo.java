package cn.iqnnfa.model;



public class AnxinSignRequestVo {
	//
	private Person person;
	//
	private BankCardInfo bankCardInfo;
	//
	private head head;
	//0：发送；1：不发送；默认为0，建议选择发送
	private Integer notSendPwd;
	//0：不校验；1：校验；默认为0
	private Integer isVerifyBankCard;
	//1：红色；2：蓝色；3：黑色；默认为1 
	private Integer sealColor;
	
	public head getHead() {
		return head;
	}
	public void setHead(head head) {
		this.head = head;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public BankCardInfo getBankCardInfo() {
		return bankCardInfo;
	}
	public void setBankCardInfo(BankCardInfo bankCardInfo) {
		this.bankCardInfo = bankCardInfo;
	}
	public Integer getNotSendPwd() {
		return notSendPwd;
	}
	public void setNotSendPwd(Integer notSendPwd) {
		this.notSendPwd = notSendPwd;
	}
	public Integer getIsVerifyBankCard() {
		return isVerifyBankCard;
	}
	public void setIsVerifyBankCard(Integer isVerifyBankCard) {
		this.isVerifyBankCard = isVerifyBankCard;
	}
	public Integer getSealColor() {
		return sealColor;
	}
	public void setSealColor(Integer sealColor) {
		this.sealColor = sealColor;
	}
	
}