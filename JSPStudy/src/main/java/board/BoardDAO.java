package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import member.DBPoolUtil;

public class BoardDAO {
	private static BoardDAO instance = null;

	private BoardDAO() {

	}

	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}

	// 입력(새로운 글 입력, 답변 글 입력)
	public boolean insertArticle(BoardVO article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = article.getNum();
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
		int number = 0;
		boolean flag = false;
		// 가장 최근 num 값을 가져온다. =>nvl(max(num),0)+1
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("select nvl(max(num), 0)+1 from board");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1);
			} else {
				number = 1;
			}
			// 답변 글인지, 새로운 글인지 구분
			if (num != 0) {// 답글
				pstmt = conn.prepareStatement("update board set step=step+1 where ref= ? and step> ?");
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				step += 1;
				depth += 1;
			} else { // 새글
				ref = number;
				step = 0;
				depth = 0;
			}
			// 글 저장
			String sql = "insert into board(num, writer, email, userpw, subject,"
					+ " regdate, ref, step, depth, content, ip) values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getUserPw());
			pstmt.setString(4, article.getSubject());
			pstmt.setTimestamp(5, article.getRegdate());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, step);
			pstmt.setInt(8, depth);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return flag;
	}

	// 전체글 갯수 가져오기
	public int getArticleCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return count;
	}

	// 전체 글 가져오기
	public Vector<BoardVO> getArticles(int start, int end) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<BoardVO> vecArticles = null;
		try {
			// 게시판 글을 ref기준으로 내림차순, step기준으로 오름차순 정렬 가상 테이블을 만든다.
			// 이런 순으로 rownum이 임의로 만들어, 페이지정렬할 수 있다.
			// 7페이지 == 61 ~ 70 == (page-1)*10+1 ~ page*10
			conn = DBPoolUtil.makeConnection();
			String sql = " select * from (select rownum rnum, num, writer, email, subject, userPw, "
					+ " regdate, readcount, ref, step, depth, content, ip from (select * from board"
					+ " order by ref desc, step asc)) where rnum>=? and rnum<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			vecArticles = new Vector<BoardVO>();
			while (rs.next()) {
				BoardVO article = new BoardVO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setUserPw(rs.getString("userpw"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setStep(rs.getInt("step"));
				article.setDepth(rs.getInt("depth"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
				vecArticles.addElement(article);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return vecArticles;
	}

	// 하나의 글 가져오기(readcount를 1 증가시킨다.)
	public BoardVO getArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO article = null;
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("update board set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardVO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setUserPw(rs.getString("userPw"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setStep(rs.getInt("step"));
				article.setDepth(rs.getInt("depth"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return article;
	}

	// 하나의 글 가져오기(readcount)를 증가시키지 않는다.
	public BoardVO updateGetArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO article = null;
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardVO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setUserPw(rs.getString("userPw"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setStep(rs.getInt("step"));
				article.setDepth(rs.getInt("depth"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return article;
	}

	// 글 수정하기
	public int updateArticle(BoardVO article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpass = "";
		int result = -1;// 데이터베이스 오류
		System.out.println(article.getNum());
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("select userPw from board where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpass = rs.getString("userpw");
				// 비밀번호 비교
				if (dbpass.equals(article.getUserPw())) {
					pstmt = conn.prepareStatement("update board set writer=?,email=?,subject=?,content=? where num=?");
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getContent());
					pstmt.setInt(5, article.getNum());
					pstmt.executeUpdate();
					result = 1; // 수정성공
				} else {
					result = 0; // 암호가 틀려서 수정실패
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return result;
	}

	// 글 삭제하기(원글을 삭제할 때 답변글 모두를 삭제해야 한다.)
	public int deleteArticle(int num, String userPw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpass = "";
		int result = -1;
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("select userPw from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpass = rs.getString("userPw");
				if (dbpass.equals(userPw)) {
					pstmt = conn.prepareStatement("delete from board where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					result = 1; // 글삭제 성공
				} else
					result = 0; // 비밀번호 틀림
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, pstmt, conn);
		}
		return result;
	}

	// 글 삭제하기(원글을 삭제할 때 답변글 모두를 삭제해야 한다.)
	public int deleteArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			conn = DBPoolUtil.makeConnection();
			pstmt = conn.prepareStatement("delete from board where num=?");
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(pstmt, conn);
		}
		return result;
	}

}
