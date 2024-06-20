package cart;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.Vector;

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
	public Vector<String[]> getCartTotalList(String userId) {
		Vector<String[]> cartList = new Vector<String[]>();
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs1 = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL CARTLIST_PRINT_PROC(?,?)}");
			cstmt.setString(1, userId);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs1 = (ResultSet) cstmt.getObject(2);
			while (rs1.next()) {
				// HashMap<String, String> cart = new HashMap<String, String>();

				String[] cart = new String[] { String.valueOf(rs1.getInt("performance_id")),
						rs1.getString("performance_name"), String.valueOf(rs1.getDate("performance_day")),
						rs1.getString("reservation_seats"), String.valueOf(rs1.getInt("total_reservation_seats")),
						String.valueOf(rs1.getInt("total_payment_amount")), String.valueOf(rs1.getInt("cart_id")) };
				cartList.addElement(cart);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs1, cstmt, con);
		}
		return cartList;
	}

	// 장바구니 선택한 항목리스트함수
	public Vector<String[]> getCartTotalList(String[] cart_id) {
		Vector<String[]> cartList = new Vector<String[]>();
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs1 = null;
		try {
			con = DBPoolUtil.makeConnection();
			for (String data : cart_id) {
				cstmt = con.prepareCall("{CALL CARTLIST_SELECT_PROC(?,?)}");
				cstmt.setInt(1, Integer.parseInt(data));
				cstmt.registerOutParameter(2, OracleTypes.CURSOR);
				cstmt.executeQuery();
				rs1 = (ResultSet) cstmt.getObject(2);
				
				if (rs1.next()) {
					String[] cart = new String[] { String.valueOf(rs1.getInt("performance_id")),
							rs1.getString("performance_name"), String.valueOf(rs1.getDate("performance_day")),
							rs1.getString("reservation_seats"), String.valueOf(rs1.getInt("total_reservation_seats")),
							String.valueOf(rs1.getInt("total_payment_amount")), String.valueOf(rs1.getInt("cart_id")) };
					cartList.addElement(cart);
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs1, cstmt, con);
		}
		return cartList;
	}

	// 장바구니 항목 가져오기
	public String[] getCart(int cart_id) {
		String[] cart = null;
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs1 = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL CARTITEM_PRINT_PROC(?,?)}");
			cstmt.setInt(1, cart_id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs1 = (ResultSet) cstmt.getObject(2);
			if (rs1.next()) {

				cart = new String[] { String.valueOf(rs1.getInt("performance_id")), rs1.getString("performance_name"),
						String.valueOf(rs1.getDate("performance_day")), rs1.getString("reservation_seats"),
						String.valueOf(rs1.getInt("total_reservation_seats")),
						String.valueOf(rs1.getInt("total_payment_amount")), String.valueOf(rs1.getInt("cart_id")) };

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs1, cstmt, con);
		}
		return cart;
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
	public int setCartDelete(String customer_id) {
		Connection con = null;
		CallableStatement cstmt = null;
		int value = -1;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL CART_CLEAR_PROC(?,?)}");
			cstmt.setString(1, customer_id);
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

	// 장바구니 항목 지우기 함수
	public int setCartDeletItem(String customer_id, int cart_id) {
		Connection con = null;
		CallableStatement cstmt = null;
		int value = -1;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL CART_DELETE_PROC(?,?,?)}");
			cstmt.setString(1, customer_id);
			cstmt.setInt(2, cart_id);
			cstmt.registerOutParameter(3, Types.INTEGER);
			cstmt.executeUpdate();
			value = cstmt.getInt(3);
			value = value == 1 ? 1 : 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
		return value;
	}

}
