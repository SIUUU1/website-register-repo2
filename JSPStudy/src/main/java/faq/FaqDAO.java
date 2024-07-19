package faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import member.DBPoolUtil;

public class FaqDAO {
	// 싱글톤
	private static FaqDAO instance = null;

	private FaqDAO() {

	}

	public static FaqDAO getInstance() {
		if (instance == null) {
			synchronized (FaqDAO.class) {
				instance = new FaqDAO();
			}
		}
		return instance;
	}

	// 1. 전체 faq 호출
	public ArrayList<FaqVO> getFaqList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FaqVO faq = null;
		String sql = "";
		ArrayList<FaqVO> faqList = null;

		try {
			conn = DBPoolUtil.makeConnection();
			sql = "SELECT * FROM FAQ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			faqList = new ArrayList<FaqVO>();

			while (rs.next()) {
				faq = new FaqVO();
				faq.setFaq_no(rs.getInt("faq_no"));
				faq.setFaq_category(rs.getInt("faq_category"));
				faq.setFaq_title(rs.getString("faq_title"));
				faq.setFaq_content(rs.getString("faq_content"));
				faqList.add(faq);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return faqList;
	}

	// 2. faq 추가
	public int insertFaq(FaqVO faq) {
		int flag = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			conn = DBPoolUtil.makeConnection();
			sql = "INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faq.getFaq_category());
			pstmt.setString(2, faq.getFaq_title());
			pstmt.setString(3, faq.getFaq_content());

			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(pstmt, conn);
		}
		return flag;
	}
}
