package member;

public class MemberVO {
	private String userId;
	private String userPw;
	private String userName;
	private String userNickName;
	private String userEmail;
	private String subscriptionPath;
	private String userTel;
	private String userPhoneNum;
	private String userBirthday;
	private String postCode;
	private String defaultAddress;
	private String detailedAddress;
	private String extraAddress;
	private String kakaoService;
	private String emailService;
	private String snsService;
	private String disclosureInfo;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getSubscriptionPath() {
		return subscriptionPath;
	}

	public void setSubscriptionPath(String subscriptionPath) {
		this.subscriptionPath = subscriptionPath;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserPhoneNum() {
		return userPhoneNum;
	}

	public void setUserPhoneNum(String userPhoneNum) {
		this.userPhoneNum = userPhoneNum;
	}

	public String getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getDefaultAddress() {
		return defaultAddress;
	}

	public void setDefaultAddress(String defaultAddress) {
		this.defaultAddress = defaultAddress;
	}

	public String getDetailedAddress() {
		return detailedAddress;
	}

	public void setDetailedAddress(String detailedAddress) {
		this.detailedAddress = detailedAddress;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public String getKakaoService() {
		return kakaoService;
	}

	public void setKakaoService(String kakaoService) {
		this.kakaoService = kakaoService;
	}

	public String getEmailService() {
		return emailService;
	}

	public void setEmailService(String emailService) {
		this.emailService = emailService;
	}

	public String getSnsService() {
		return snsService;
	}

	public void setSnsService(String snsService) {
		this.snsService = snsService;
	}

	public String getDisclosureInfo() {
		return disclosureInfo;
	}

	public void setDisclosureInfo(String disclosureInfo) {
		this.disclosureInfo = disclosureInfo;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userNickName="
				+ userNickName + ", userEmail=" + userEmail + ", subscriptionPath=" + subscriptionPath + ", userTel="
				+ userTel + ", userPhoneNum=" + userPhoneNum + ", userBirthday=" + userBirthday + ", postCode="
				+ postCode + ", defaultAddress=" + defaultAddress + ", detailedAddress=" + detailedAddress
				+ ", extraAddress=" + extraAddress + ", kakaoService=" + kakaoService + ", emailService=" + emailService
				+ ", snsService=" + snsService + ", disclosureInfo=" + disclosureInfo + "]";
	}

}
