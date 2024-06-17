package performance;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Vector;

import member.DBPoolUtil;
import oracle.jdbc.OracleTypes;

public class PerformanceDAO {
	public static final int COLUMN_NUM = 20; // 행
	public static final int P_SEAT = 0; // 선택 가능한 좌석
	public static final int S_SEAT = 1; // 선택된 좌석
	public static final int N_SEAT = 9; // 선택할 수 없는 좌석
	private static PerformanceDAO instance = new PerformanceDAO();

	private PerformanceDAO() {
	}

	public static synchronized PerformanceDAO getInstance() {
		return instance;
	}

	// 공연목록리스트함수
	public Vector<PerformanceVO> getPerformanceTotalList() {
		Vector<PerformanceVO> performanceList = new Vector<PerformanceVO>();
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL PERFORMANCES_PRINT_PROC(?)}");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(1);
			while (rs.next()) {
				PerformanceVO pvo = new PerformanceVO();
				pvo.setPerformance_id(rs.getInt("performance_id"));
				pvo.setPerformance_name(rs.getString("performance_name"));
				pvo.setPerformance_genre(rs.getString("performance_genre"));
				pvo.setPerformance_day(String.valueOf(rs.getDate("performance_day")));
				pvo.setPerformance_venue(rs.getString("performance_venue"));
				pvo.setPerformance_limit_age(rs.getInt("performance_limit_age"));
				pvo.setPerformance_total_seats(rs.getInt("performance_total_seats"));
				pvo.setPerformance_sold_seats(rs.getInt("performance_sold_seats"));
				pvo.setPerformance_seatsInfo(rs.getString("performance_seatsInfo"));
				pvo.setPerformance_ticket_price(rs.getInt("performance_ticket_price"));
				performanceList.addElement(pvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, cstmt, con);
		}
		return performanceList;
	}

	// 공연정보가져오기
	public PerformanceVO getPerformance(int performance_id) {
		PerformanceVO pvo = null;
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL GET_PERFORMANCE_PROC(?,?)}");
			cstmt.setInt(1, performance_id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(2);
			while (rs.next()) {
				pvo = new PerformanceVO();
				pvo.setPerformance_id(rs.getInt("performance_id"));
				pvo.setPerformance_name(rs.getString("performance_name"));
				pvo.setPerformance_genre(rs.getString("performance_genre"));
				pvo.setPerformance_day(String.valueOf(rs.getDate("performance_day")));
				pvo.setPerformance_venue(rs.getString("performance_venue"));
				pvo.setPerformance_limit_age(rs.getInt("performance_limit_age"));
				pvo.setPerformance_total_seats(rs.getInt("performance_total_seats"));
				pvo.setPerformance_sold_seats(rs.getInt("performance_sold_seats"));
				pvo.setPerformance_seatsInfo(rs.getString("performance_seatsInfo"));
				pvo.setPerformance_ticket_price(rs.getInt("performance_ticket_price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, cstmt, con);
		}
		return pvo;
	}

	// 공연 수 출력 함수
	public int getPerformance_Count() {
		Connection con = null;
		CallableStatement cstmt = null;
		int count = 0;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL PERFORMANCE_COUNT_PROC(?)}");
			cstmt.registerOutParameter(1, Types.INTEGER);
			cstmt.executeUpdate();
			count = cstmt.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
		return count;
	}

	// 공연정보입력함수
	public int setPerformanceRegister(PerformanceVO pvo) {
		// 총좌석수를 문자열로 변환
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < pvo.getPerformance_total_seats(); i++) {
			sb.append("0");
		}
		CallableStatement cstmt = null;
		Connection con = null;
		int value = -1;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL PER_INSERT_PROC(?,?,?,?,?,?,?,?,?)}");
			cstmt.setString(1, pvo.getPerformance_name());
			cstmt.setString(2, pvo.getPerformance_genre());
			cstmt.setString(3, pvo.getPerformance_day());
			cstmt.setString(4, pvo.getPerformance_venue());
			cstmt.setInt(5, pvo.getPerformance_limit_age());
			cstmt.setInt(6, pvo.getPerformance_total_seats());
			cstmt.setString(7, sb.toString());
			cstmt.setInt(8, pvo.getPerformance_ticket_price());
			cstmt.registerOutParameter(9, Types.INTEGER);
			cstmt.executeUpdate();
			value = cstmt.getInt(9);
			value = (value == 1) ? 1 : 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
		return value;
	}

	// 공연정보수정함수
	public int setPerformanceUpdate(PerformanceVO pvo) {
		// 총좌석수를 문자열로 변환
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < pvo.getPerformance_total_seats(); i++) {
			sb.append("0");
		}
		Connection con = null;
		CallableStatement cstmt = null;
		int value = -1;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL PER_UPDATE_PROC(?,?,?,?,?,?,?,?,?,?,?)}");
			cstmt.setString(1, pvo.getPerformance_name());
			cstmt.setString(2, pvo.getPerformance_genre());
			cstmt.setString(3, pvo.getPerformance_day());
			cstmt.setString(4, pvo.getPerformance_venue());
			cstmt.setInt(5, pvo.getPerformance_limit_age());
			cstmt.setInt(6, pvo.getPerformance_total_seats());
			cstmt.setInt(7, pvo.getPerformance_sold_seats());
			cstmt.setString(8, sb.toString());
			cstmt.setInt(9, pvo.getPerformance_ticket_price());
			cstmt.setInt(10, pvo.getPerformance_id());
			cstmt.registerOutParameter(11, Types.INTEGER);
			cstmt.executeUpdate();
			value = cstmt.getInt(11);
			value = value == 1 ? 1 : 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
		return value;
	}

	// 공연정보삭제함수
	public int setPerformanceDelete(int p_id) {
		Connection con = null;
		CallableStatement cstmt = null;
		int value = -1;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL PER_DELTE_PROC(?,?)}");
			cstmt.setInt(1, p_id);
			cstmt.registerOutParameter(2, Types.INTEGER);
			cstmt.executeUpdate();
			value = cstmt.getInt(2);
			value = value == 1 ? 1 : 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
		return value;
	}

	// 공연 좌석정보 가져오기
	public int[][] getPerformanceSeats(int performance_id) {
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		int performance_total_seats = 0; // 총좌석수
		String performance_seatsInfo = null; // 좌석정보
		int[][] seat = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL SEATSINFO_PROC(?,?)}");
			cstmt.setInt(1, performance_id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(2);
			if (rs.next()) {
				performance_total_seats = rs.getInt("performance_total_seats");
				performance_seatsInfo = rs.getString("performance_seatsInfo");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}

		// 좌석배열만들기
		int rowNum = performance_total_seats / COLUMN_NUM;
		int remain = performance_total_seats % COLUMN_NUM;

		String[] seatArr = performance_seatsInfo.split("");

		if (remain != 0) {
			// 남은 좌석 있을 때
			seat = new int[rowNum + 1][COLUMN_NUM];
			for (int i = 0; i < seat.length; i++) {
				if (i == rowNum) {
					for (int j = 0; j < COLUMN_NUM - remain; j++) {
						seat[rowNum][COLUMN_NUM - 1 - j] = N_SEAT;
					}
				} else {
					for (int j = 0; j < seat[i].length; j++) {
						seat[i][j] = Integer.parseInt(seatArr[(i * COLUMN_NUM) + j]);
					}
				}
			}
		} else {
			// 남은 좌석 없을 때
			seat = new int[rowNum][COLUMN_NUM];
			for (int i = 0; i < seat.length; i++) {
				for (int j = 0; j < seat[i].length; j++) {
					seat[i][j] = Integer.parseInt(seatArr[(i * COLUMN_NUM) + j]);
				}
			}
		}
		return seat;
	}

	// 예매 후 공연 정보 수정함수
	public int seatsInfoUpdate(String[] p_seatArr, int sold_seats, int[][] seat, int performance_id) {
		// 좌석정보수정 반영
		int x = 0, y = 0;// 좌석 배열 인덱스
		for (String s : p_seatArr) {
			x = s.charAt(0) - 65;
			y = Integer.parseInt(s.substring(1)) - 1;
			seat[x][y] = S_SEAT;
		}
		// 좌석정보 int[][] -> String으로 변환하기
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < seat.length; i++) {
			for (int j = 0; j < seat[i].length; j++) {
				if (seat[i][j] != N_SEAT) {
					sb.append(String.valueOf(seat[i][j]));
				}
			}
		}
		// 공연 정보 수정
		Connection con = null;
		CallableStatement cstmt = null;
		int value = -1;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL SEATSINFO_UPDATE_PROC(?,?,?,?)}");
			cstmt.setInt(1, sold_seats);
			cstmt.setString(2, sb.toString());
			cstmt.setInt(3, performance_id);
			cstmt.registerOutParameter(4, Types.INTEGER);
			cstmt.executeUpdate();
			value = cstmt.getInt(4);
			value = value == 1 ? 1 : 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
		return value;
	}

}
