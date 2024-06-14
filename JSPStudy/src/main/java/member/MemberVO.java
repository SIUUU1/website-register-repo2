package member;

import java.util.Objects;

public class MemberVO {
	// memberVariable
	public static final int VIP_ACCUMULPAYMENT = 100_000; // VIP등급최소누적금액
	private String userId; // 고객 ID
	private String userPw; // 고객 PW
	private String userName; // 고객 이름
	private String userNickName; // 고객 닉네임
	private String userEmail; // 고객 이메일
	private String subscriptionPath; // 가입경로
	private String userTel;// 집전화번호
	private String userPhoneNum; // 폰번호
	private String userBirthday; // 고객 생일
	private String postCode; // 우편번호
	private String defaultAddress; // 기본 주소
	private String detailedAddress; // 상세 주소
	private String extraAddress; // 기타 주소
	private String kakaoService; // 카카오서비스 수신여부
	private String emailService;// 이메일 수신여부
	private String snsService;// sns 수신여부
	private String disclosureInfo;// 정보 이용 동의
	private String userGrade; // 고객 등급
	private int userAccumulatedPayment; // 고객 누적결제금액
	private int userPoints; // 고객 포인트
	private double userPointRatio; // 고객 포인트 적립률
	private double userSaleRatio; // 고객 구매 할인율

	// constructor
	// memberFunction
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

	public String getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	public int getUserAccumulatedPayment() {
		return userAccumulatedPayment;
	}

	public void setUserAccumulatedPayment(int userAccumulatedPayment) {
		this.userAccumulatedPayment = userAccumulatedPayment;
	}

	public int getUserPoints() {
		return userPoints;
	}

	public void setUserPoints(int userPoints) {
		this.userPoints = userPoints;
	}

	public double getUserPointRatio() {
		return userPointRatio;
	}

	public void setUserPointRatio(double userPointRatio) {
		this.userPointRatio = userPointRatio;
	}

	public double getUserSaleRatio() {
		return userSaleRatio;
	}

	public void setUserSaleRatio(double userSaleRatio) {
		this.userSaleRatio = userSaleRatio;
	}

	// 등급업데이트
	public void updateCustomer_grade() {
		if (userAccumulatedPayment >= VIP_ACCUMULPAYMENT) {
			userGrade = "VIP";
			userPointRatio = 0.05;
			userSaleRatio = 0.1;
		}
	}

	// Overriding
	@Override
	public int hashCode() {
		return Objects.hash(userId);
	}

	@Override
	public boolean equals(Object obj) {
		MemberVO member = null;
		if (obj instanceof MemberVO) {
			member = (MemberVO) obj;
			return userId.equals(member.userId);
		}
		return false;
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
