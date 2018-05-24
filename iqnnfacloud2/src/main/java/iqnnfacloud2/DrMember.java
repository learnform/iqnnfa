package iqnnfacloud2;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class DrMember implements Serializable{
	    /**
		 * 
		 */
		private static final long serialVersionUID = -7871563184436478819L;

		/**
	     * 主键、标识列自动增长 会员ID  
	     */
	    private Integer uid;

	    /**
	     * 手机号码
	     */
	    private String mobilephone;

	    /**
	     * 用户密码（32 位双层MD5 salt 加密）
	     */
	    private String passWord;

	    /**
	     * 交易密码（初始化为登录密码）  
	     */
	    private String tpassWord;

	    /**
	     * 头像  
	     */
	    private String photo;

	    /**
	     * 是否为黑名单 0否1是
	     */
	    private Integer isBlack;

	    /**
	     * 注册IP  
	     */
	    private String regIp;

	    /**
	     * 注册日期  
	     */
	    private Date regDate;

	    /**
	     * 最后登录IP  
	     */
	    private String lastLoginIp;

	    /**
	     * 最后登录日期
	     */
	    private Date lastLoginTime;

	    /**
	     * 账户类型  
	     */
	    private Integer type;

	    /**
	     * 账户状态（0 未激活1 正常2 冻结） 
	     */
	    private Integer status;

	    /**
	     * 注册来源  
	     */
	    private Integer regFrom;

	    /**
	     * 手机验证 0=未验证 1=已验证
	     */
	    private Integer mobileVerify;

	    /**
	     * 实名认证 1:已认证 0:未认证
	     */
	    private Integer realVerify;

	    /**
	     * 0 默认不验证,1登录手机验证,2更换ip手机验证,3密码错误3次手机验证--banby add 
	     */
	    private Integer loginVerify;

	    /**
	     * 邮箱验证0未认证1已认证 
	     */
	    private Integer emailVerify;

	    /**
	     * 推荐码-自己的推荐码
	     */
	    private String recommCodes;

	    /**
	     * 理财经济人级别
	     */
	    private Integer level;
	    
	    private Integer sex;
	    /**
	     * 来源.0:本站 1:新手标DSP 2:
	     */
	    private String toFrom;//渠道来源
		private String realName;//真实姓名
		private String idCards;//身份证
		private BigDecimal balance;//余额
		private BigDecimal freeze;//冻结金额
		private BigDecimal crushCount;//已充值金额
		private BigDecimal carryCount;//已提现金额
		private BigDecimal bidAmountCount;//已投资金额
		private Date firstInvest;//首投时间
		private Date lastInvest;//末投时间
		private Integer isParticipation;//是否参与推荐首投返利
		private String bankName;//认证银行
		private String bankNum;
		
		private String referrer;//推荐人
		
		private Integer age;//年龄
		
		private Integer onOff;//自投用户配置 0=关闭，1=打开
		
	    public DrMember(){}

		public DrMember(String mobilephone, String passWord, Integer type,Date regDate,
				Integer status, Integer mobileVerify, Integer realVerify,
				Integer loginVerify, Integer emailVerify,String recommCodes) {
			super();
			this.mobilephone = mobilephone;
			this.passWord = passWord;
			this.type = type;
			this.regDate = regDate;
			this.status = status;
			this.mobileVerify = mobileVerify;
			this.realVerify = realVerify;
			this.loginVerify = loginVerify;
			this.emailVerify = emailVerify;
			this.recommCodes = recommCodes;
		}

		public Integer getUid() {
			return uid;
		}

		public void setUid(Integer uid) {
			this.uid = uid;
		}

		public String getMobilephone() {
			return mobilephone;
		}

		public void setMobilephone(String mobilephone) {
			this.mobilephone = mobilephone;
		}

		public String getPassWord() {
			return passWord;
		}

		public void setPassWord(String passWord) {
			this.passWord = passWord;
		}

		public String getTpassWord() {
			return tpassWord;
		}

		public void setTpassWord(String tpassWord) {
			this.tpassWord = tpassWord;
		}

		public String getPhoto() {
			return photo;
		}

		public void setPhoto(String photo) {
			this.photo = photo;
		}

		public Integer getIsBlack() {
			return isBlack;
		}

		public void setIsBlack(Integer isBlack) {
			this.isBlack = isBlack;
		}

		public String getRegIp() {
			return regIp;
		}

		public void setRegIp(String regIp) {
			this.regIp = regIp;
		}

		public Date getRegDate() {
			return regDate;
		}

		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}

		public String getLastLoginIp() {
			return lastLoginIp;
		}

		public void setLastLoginIp(String lastLoginIp) {
			this.lastLoginIp = lastLoginIp;
		}

		public Date getLastLoginTime() {
			return lastLoginTime;
		}

		public void setLastLoginTime(Date lastLoginTime) {
			this.lastLoginTime = lastLoginTime;
		}

		public Integer getType() {
			return type;
		}

		public void setType(Integer type) {
			this.type = type;
		}

		public Integer getStatus() {
			return status;
		}

		public void setStatus(Integer status) {
			this.status = status;
		}

		public Integer getRegFrom() {
			return regFrom;
		}

		public void setRegFrom(Integer regFrom) {
			this.regFrom = regFrom;
		}

		public Integer getMobileVerify() {
			return mobileVerify;
		}

		public void setMobileVerify(Integer mobileVerify) {
			this.mobileVerify = mobileVerify;
		}

		public Integer getRealVerify() {
			return realVerify;
		}

		public void setRealVerify(Integer realVerify) {
			this.realVerify = realVerify;
		}

		public Integer getLoginVerify() {
			return loginVerify;
		}

		public void setLoginVerify(Integer loginVerify) {
			this.loginVerify = loginVerify;
		}

		public Integer getEmailVerify() {
			return emailVerify;
		}

		public void setEmailVerify(Integer emailVerify) {
			this.emailVerify = emailVerify;
		}

		public String getRecommCodes() {
			return recommCodes;
		}

		public void setRecommCodes(String recommCodes) {
			this.recommCodes = recommCodes;
		}

		public Integer getLevel() {
			return level;
		}

		public void setLevel(Integer level) {
			this.level = level;
		}
		public String getToFrom() {
			return toFrom;
		}

		public void setToFrom(String toFrom) {
			if(toFrom==null||toFrom.trim().length()==0){
				this.toFrom = "dr";
			}else{
				this.toFrom = toFrom;
			}
		}

		public String getRealName() {
			return realName;
		}

		public void setRealName(String realName) {
			this.realName = realName;
		}

		public String getIdCards() {
			return idCards;
		}

		public void setIdCards(String idCards) {
			this.idCards = idCards;
		}

		public BigDecimal getBalance() {
			return balance;
		}

		public void setBalance(BigDecimal balance) {
			this.balance = balance;
		}

		public BigDecimal getFreeze() {
			return freeze;
		}

		public void setFreeze(BigDecimal freeze) {
			this.freeze = freeze;
		}

		public BigDecimal getCrushCount() {
			return crushCount;
		}

		public void setCrushCount(BigDecimal crushCount) {
			this.crushCount = crushCount;
		}

		public BigDecimal getCarryCount() {
			return carryCount;
		}

		public void setCarryCount(BigDecimal carryCount) {
			this.carryCount = carryCount;
		}

		public BigDecimal getBidAmountCount() {
			return bidAmountCount;
		}

		public void setBidAmountCount(BigDecimal bidAmountCount) {
			this.bidAmountCount = bidAmountCount;
		}


		public Date getFirstInvest() {
			return firstInvest;
		}

		public void setFirstInvest(Date firstInvest) {
			this.firstInvest = firstInvest;
		}

		public Date getLastInvest() {
			return lastInvest;
		}

		public void setLastInvest(Date lastInvest) {
			this.lastInvest = lastInvest;
		}

		/**
		 * @return the referrer
		 */
		public String getReferrer() {
			return referrer;
		}

		/**
		 * @param referrer the referrer to set
		 */
		public void setReferrer(String referrer) {
			this.referrer = referrer;
		}

		/**
		 * @return the age
		 */
		public Integer getAge() {
			return age;
		}

		/**
		 * @param age the age to set
		 */
		public void setAge(Integer age) {
			this.age = age;
		}

		/**
		 * @return the isParticipation
		 */
		public Integer getIsParticipation() {
			return isParticipation;
		}

		/**
		 * @param isParticipation the isParticipation to set
		 */
		public void setIsParticipation(Integer isParticipation) {
			this.isParticipation = isParticipation;
		}

		/**
		 * @return the sex
		 */
		public Integer getSex() {
			return sex;
		}

		/**
		 * @param sex the sex to set
		 */
		public void setSex(Integer sex) {
			this.sex = sex;
		}

		/**
		 * @return the bankName
		 */
		public String getBankName() {
			return bankName;
		}

		/**
		 * @param bankName the bankName to set
		 */
		public void setBankName(String bankName) {
			this.bankName = bankName;
		}

		public Integer getOnOff() {
			return onOff;
		}

		public void setOnOff(Integer onOff) {
			this.onOff = onOff;
		}

		public String getBankNum() {
			return bankNum;
		}

		public void setBankNum(String bankNum) {
			this.bankNum = bankNum;
		}
	}

