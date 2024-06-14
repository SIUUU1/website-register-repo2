package tripair;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Vector;

import member.DBPoolUtil;
import oracle.jdbc.OracleTypes;

public class PaymentDAO {
	private static PaymentDAO instance = null;

	private PaymentDAO() {
	}

	public static synchronized PaymentDAO getInstance() {
		if (instance == null) {
			instance = new PaymentDAO();
		}
		return instance;
	}

	// 비즈니스석 운영 여부 확인
	public int checkPrestige(int airports_id) {
		Connection con = null;
		CallableStatement cstmt = null;
		int value = -1;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL check_prestige(?,?)}");
			cstmt.setInt(1, airports_id);
			cstmt.registerOutParameter(2, Types.INTEGER);
			cstmt.executeUpdate();
			value = cstmt.getInt(2);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
		return value;
	}

	// 결제 정보 저장
	public int setPaymentRegister(PaymentVO pvo) {
		Connection con = null;
		CallableStatement cstmt = null;
		int value = -1;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL PAY_INSERT_PROC(?,?,?,?,?,?,?)}");
			cstmt.setInt(1, pvo.getAirports_id());
			cstmt.setString(2, pvo.getCustomer_name());
			cstmt.setString(3, pvo.getCustomer_phone());
			cstmt.setString(4, pvo.getCustomer_email());
			cstmt.setInt(5, pvo.getEconomy_count());
			cstmt.setInt(6, pvo.getPrestige_count());
			cstmt.registerOutParameter(7, Types.INTEGER);
			cstmt.executeUpdate();
			value = cstmt.getInt(7);
			value = (value == 1) ? 1 : 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
		return value;
	}

	public String[] getPaymentList(String customer_phone, int airports_id) {
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		String[] paymentArr = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL PAYMENTS_PRINT_PROC1(?,?,?)}");
			cstmt.setInt(1, airports_id);
			cstmt.setString(2, customer_phone);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(3);
			if (rs.next()) {
				paymentArr = new String[] { rs.getString("vihicle_id"), String.valueOf(rs.getDate("payment_date")),
						rs.getString("customer_name"), rs.getString("depairport_name"), rs.getString("arrAirport_name"),
						rs.getString("dep_plandtime"), rs.getString("arr_plandtime"),
						String.valueOf(rs.getInt("economy_count")), String.valueOf(rs.getInt("prestige_count")),
						rs.getString("airline_name"), String.valueOf(rs.getInt("total_price")) };
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, cstmt, con);
		}
		return paymentArr;
	}

	public Vector<String[]> getPaymentList(String customer_name, String customer_phone) {
		Vector<String[]> paymentDataList = new Vector<String[]>();
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL PAYMENTS_PRINT_PROC2(?,?,?)}");
			cstmt.setString(1, customer_name);
			cstmt.setString(2, customer_phone);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(3);
			while (rs.next()) {
				String[] paymentArr = new String[] {rs.getString("vihicle_id"),
						String.valueOf(rs.getDate("payment_date")), rs.getString("customer_name"),
						rs.getString("depairport_name"), rs.getString("arrAirport_name"), rs.getString("dep_plandtime"),
						rs.getString("arr_plandtime"), String.valueOf(rs.getInt("economy_count")),
						String.valueOf(rs.getInt("prestige_count")), rs.getString("airline_name"),
						String.valueOf(rs.getInt("total_price")) };
				paymentDataList.addElement(paymentArr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, cstmt, con);
		}
		return paymentDataList;
	}
}
