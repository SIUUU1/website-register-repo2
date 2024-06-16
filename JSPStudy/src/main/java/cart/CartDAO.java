package cart;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import member.DBPoolUtil;
import oracle.jdbc.OracleTypes;

public class CartDAO {

	private static CartDAO instance = new CartDAO();

	private CartDAO() {
	}

	public static synchronized CartDAO getInstance() {
		return instance;
	}

	// 장바구니 저장함수
	public void setCartRegister(String userId, int performance_id, String[] p_seatArr) {
		// 좌석정보 String[]->String
		StringBuffer sb = new StringBuffer();
		for (String s : p_seatArr) {
			sb.append(s + " ");
		}

		Connection con = null;
		CallableStatement cstmt = null;
		int value = -1;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL CART_INSERT_PROC(?,?,?,?,?)}");
			cstmt.setString(1, userId);
			cstmt.setInt(2, performance_id);
			cstmt.setString(3, sb.toString());
			cstmt.setInt(4, p_seatArr.length);
			cstmt.registerOutParameter(5, Types.INTEGER);
			cstmt.executeUpdate();
			value = cstmt.getInt(5);
			value = value == 1 ? 1 : 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
	}

	// 장바구니목록리스트함수
	public ArrayList<CartVO> getCartTotalList(String userId) {
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL CART_PRINT_PROC3(?,?,?)}");
			cstmt.setString(1, userId);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs1 = (ResultSet) cstmt.getObject(2);
			rs2 = (ResultSet) cstmt.getObject(3);
			while (rs1.next() && rs2.next()) {
				CartVO cart = new CartVO();
				cart.setUserId(rs1.getString("customer_id"));
				cart.setPerformance_id(rs1.getInt("performance_id"));
				cart.setPerformance_name(rs1.getString("performance_name"));
				cart.setReservation_seats(rs1.getString("reservation_seats"));
				cart.setTotal_reservation_seats(rs1.getInt("total_reservation_seats"));
				cart.setTotal_payment_amount(rs1.getInt("total_payment_amount"));
				cartList.add(cart);
				System.out.printf(" %-4s  %-10s  %-10s  %-10s  %-4d  %-6d\n", rs1.getInt("performance_id"),
						rs1.getString("performance_name"), String.valueOf(rs2.getDate("performance_day")),
						rs1.getString("reservation_seats"), rs1.getInt("total_reservation_seats"),
						rs1.getInt("total_payment_amount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs2, rs1, cstmt, con);
		}
		return cartList;
	}

	// 장바구니 수 출력 함수
	public int getCart_Count(String userId) {
		Connection con = null;
		CallableStatement cstmt = null;
		int count = 0;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL CART_COUNT_PROC(?,?)}");
			cstmt.setString(1, userId);
			cstmt.registerOutParameter(2, Types.INTEGER);
			cstmt.executeUpdate();
			count = cstmt.getInt(2);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
		return count;
	}

	// 장바구니 비우기 함수
	public void setCartDelete(String customer_id) {
		Connection con = null;
		CallableStatement cstmt = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL CART_CLEAR_PROC(?,?)}");
			cstmt.setString(1, customer_id);
			cstmt.registerOutParameter(2, Types.INTEGER);
			cstmt.executeUpdate();
			int value = cstmt.getInt(2);
			if (value == 0) {
				System.out.println(customer_id + " 장바구니 비우기 성공");
			} else {
				System.out.println(customer_id + " 장바구니 비우기 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
	}

	// 장바구니 항목 지우기 함수
	public void setCartDeletItem(String customer_id, int p_id) {
		Connection con = null;
		CallableStatement cstmt = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL CART_DELETE_PROC(?,?,?)}");
			cstmt.setString(1, customer_id);
			cstmt.setInt(2, p_id);
			cstmt.registerOutParameter(3, Types.INTEGER);
			cstmt.executeUpdate();
			int value = cstmt.getInt(3);
			if (value == 0) {
				System.out.println(p_id + "번 공연 예매 삭제 성공");
			} else {
				System.out.println(p_id + "번 공연 예매 삭제 성공");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
	}

}
