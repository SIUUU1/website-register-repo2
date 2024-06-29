package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MemberDAO {
	private static MemberDAO instance;

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		if (instance == null) {
			synchronized (MemberDAO.class) {
				instance = new MemberDAO();
			}
		}
		return instance;
	}

	// 아이디 체크 기능
	public boolean idCheck(String userId) {
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("select * from members where userid = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				result = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return result;
	}

	// 회원가입 입력 기능
	public boolean memberInsert(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		String sql = "insert into members values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getUserPw());
			pstmt.setString(3, vo.getUserName());
			pstmt.setString(4, vo.getUserNickName());
			pstmt.setString(5, vo.getUserEmail());
			pstmt.setString(6, vo.getSubscriptionPath());
			pstmt.setString(7, vo.getUserTel());
			pstmt.setString(8, vo.getUserPhoneNum());
			pstmt.setString(9, vo.getUserBirthday());
			pstmt.setString(10, vo.getPostCode());
			pstmt.setString(11, vo.getDefaultAddress());
			pstmt.setString(12, vo.getDetailedAddress());
			pstmt.setString(13, vo.getExtraAddress());
			pstmt.setInt(14, Integer.parseInt(vo.getKakaoService()));
			pstmt.setInt(15, Integer.parseInt(vo.getEmailService()));
			pstmt.setInt(16, Integer.parseInt(vo.getSnsService()));
			pstmt.setInt(17, Integer.parseInt(vo.getDisclosureInfo()));
			pstmt.setString(18, "BASIC");
			pstmt.setInt(19, 0);
			pstmt.setInt(20, 0);
			pstmt.setDouble(21, 0.03);
			pstmt.setDouble(22, 0);
			int value = pstmt.executeUpdate();
			if (value > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(pstmt, conn);
		}
		return flag;
	}

	// 로그인 체크입력 기능 (세션등록 인증 기능)
	public int loginCheck(String userId, String userPw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		String sql = "select userPw from members where userId=?";
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString("userPw");
				check = (userPw.equals(dbPass)) ? 1 : 0;
				if (check == 1 && userId.equals("admin")) {
					check = 2; // admin
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return check;
	}

	// 회원정보 가져오기
	public MemberVO getMember(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		String sql = "select * from members where userId=?";
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new MemberVO();
				vo.setUserId(rs.getString("userId"));
				vo.setUserPw(rs.getString("userPw"));
				vo.setUserName(rs.getString("userName"));
				vo.setUserNickName(rs.getString("userNickName"));
				vo.setUserEmail(rs.getString("userEmail"));
				vo.setSubscriptionPath(rs.getString("subscriptionPath"));
				vo.setUserTel(rs.getString("userTel"));
				vo.setUserPhoneNum(rs.getString("userPhoneNum"));
				vo.setUserBirthday(String.valueOf(rs.getDate("userBirthday")));
				vo.setPostCode(rs.getString("postCode"));
				vo.setDefaultAddress(rs.getString("defaultAddress"));
				vo.setDetailedAddress(rs.getString("detailedAddress"));
				vo.setExtraAddress(rs.getString("extraAddress"));
				vo.setKakaoService(String.valueOf(rs.getInt("kakaoService")));
				vo.setEmailService(String.valueOf(rs.getInt("emailService")));
				vo.setSnsService(String.valueOf(rs.getInt("snsService")));
				vo.setDisclosureInfo(String.valueOf(rs.getInt("disclosureInfo")));
				vo.setUserGrade(rs.getString("userGrade"));
				vo.setUserAccumulatedPayment(rs.getInt("userAccumulatedPayment"));
				vo.setUserPoints(rs.getInt("userPoints"));
				vo.setUserPointRatio(rs.getDouble("userPointRatio"));
				vo.setUserSaleRatio(rs.getDouble("userSaleRatio"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return vo;
	}

	// 전체회원정보 가져오기
	public Vector<MemberVO> getMemberList() {
		Vector<MemberVO> mevList = new Vector<MemberVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from members where userId!='admin'";
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setUserId(rs.getString("userId"));
				vo.setUserPw(rs.getString("userPw"));
				vo.setUserName(rs.getString("userName"));
				vo.setUserNickName(rs.getString("userNickName"));
				vo.setUserEmail(rs.getString("userEmail"));
				vo.setSubscriptionPath(rs.getString("subscriptionPath"));
				vo.setUserTel(rs.getString("userTel"));
				vo.setUserPhoneNum(rs.getString("userPhoneNum"));
				vo.setUserBirthday(String.valueOf(rs.getDate("userBirthday")));
				vo.setPostCode(rs.getString("postCode"));
				vo.setDefaultAddress(rs.getString("defaultAddress"));
				vo.setDetailedAddress(rs.getString("detailedAddress"));
				vo.setExtraAddress(rs.getString("extraAddress"));
				vo.setKakaoService(String.valueOf(rs.getInt("kakaoService")));
				vo.setEmailService(String.valueOf(rs.getInt("emailService")));
				vo.setSnsService(String.valueOf(rs.getInt("snsService")));
				vo.setDisclosureInfo(String.valueOf(rs.getInt("disclosureInfo")));
				vo.setUserGrade(rs.getString("userGrade"));
				vo.setUserAccumulatedPayment(rs.getInt("userAccumulatedPayment"));
				vo.setUserPoints(rs.getInt("userPoints"));
				vo.setUserPointRatio(rs.getDouble("userPointRatio"));
				vo.setUserSaleRatio(rs.getDouble("userSaleRatio"));
				mevList.addElement(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return mevList;
	}

	// 회원정보 수정
	public int updateMember(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		String sql = "update members set userPw=?, userName=?, userNickName=?, userEmail=?, subscriptionPath=? , "
				+ "userTel=?, userPhoneNum=?, userBirthday=?, postCode=?, defaultAddress=?, detailedAddress=?, extraAddress=?, "
				+ "kakaoService=?, emailService=?, snsService=?, disclosureInfo=? where userId=?";
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserPw());
			pstmt.setString(2, vo.getUserName());
			pstmt.setString(3, vo.getUserNickName());
			pstmt.setString(4, vo.getUserEmail());
			pstmt.setString(5, vo.getSubscriptionPath());
			pstmt.setString(6, vo.getUserTel());
			pstmt.setString(7, vo.getUserPhoneNum());
			pstmt.setString(8, vo.getUserBirthday());
			pstmt.setString(9, vo.getPostCode());
			pstmt.setString(10, vo.getDefaultAddress());
			pstmt.setString(11, vo.getDetailedAddress());
			pstmt.setString(12, vo.getExtraAddress());
			pstmt.setInt(13, Integer.parseInt(vo.getKakaoService()));
			pstmt.setInt(14, Integer.parseInt(vo.getEmailService()));
			pstmt.setInt(15, Integer.parseInt(vo.getSnsService()));
			pstmt.setInt(16, Integer.parseInt(vo.getDisclosureInfo()));
			pstmt.setString(17, vo.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(pstmt, conn);
		}
		return result;
	}

	// 회원탈퇴 시 회원 정보 삭제
	public int deleteMember(String userId, String userPw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPass = ""; // 데이터베이스에 실제 저장된 패스워드
		int result = -1; // 결과지
		String sql = "select userPw from members where userId=?";
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPass = rs.getString("userPw");
				if (dbPass.equals(userPw)) {
					pstmt = conn.prepareStatement("delete from members where userid=?");
					pstmt.setString(1, userId);
					result = pstmt.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return result;
	}

	// 회원정보 삭제
	public int deleteMember(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0; // 결과지
		String sql = "delete from members where userid=?";
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(pstmt, conn);
		}
		return result;
	}
}
