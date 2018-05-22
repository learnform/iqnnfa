package cn.iqnnfa.model;

import java.util.Date;

public class head {
	//交易时间：yyyyMMddHHmmss
	private Date txTime;
	//返回代码：
	private String retCode;
	//返回信息：OK
	private String retMessage;
	//语言，默认按照中文处理：zh_CN
	private String locale;
	//备注，预留字段，不做处理
	private String remark;
	public Date getTxTime() {
		return txTime;
	}
	public void setTxTime(Date txTime) {
		this.txTime = txTime;
	}
	public String getRetCode() {
		return retCode;
	}
	public void setRetCode(String retCode) {
		this.retCode = retCode;
	}
	public String getRetMessage() {
		return retMessage;
	}
	public void setRetMessage(String retMessage) {
		this.retMessage = retMessage;
	}
	public String getLocale() {
		return locale;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
