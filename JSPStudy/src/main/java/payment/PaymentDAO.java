package payment;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Vector;

import member.DBPoolUtil;
import oracle.jdbc.OracleTypes;

public class PaymentDAO {
	private static PaymentDAO instance = new PaymentDAO();

	private PaymentDAO() {
	}

	public static PaymentDAO getInstance() {
		return instance;
	}

	// 결제내역 저장기능구현
	public int setPaymentRegister(String userId, String userName, String userPhoneNum, String postCode,
			String recipient_address, String[] cart_id) {
		Connection con = null;
		CallableStatement cstmt = null;
		int value = -1;
		try {
			con = DBPoolUtil.makeConnection();
			for (String data : cart_id) {
				cstmt = con.prepareCall("{CALL PAY_INSERT_PROC(?,?,?,?,?,?,?)}");
				cstmt.setString(1, userId);
				cstmt.setInt(2, Integer.parseInt(data));
				cstmt.setString(3, userName);
				cstmt.setString(4, userPhoneNum);
				cstmt.setString(5, postCode);
				cstmt.setString(6, recipient_address);
				cstmt.registerOutParameter(7, Types.INTEGER);
				cstmt.executeUpdate();
				value = cstmt.getInt(7);
				value = value == 1 ? 1 : 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
		return value;
	}

	// 결제내역출력함수
	public Vector<PaymentVO> getPaymentList(String cus_id) {
		Vector<PaymentVO> paymentTotalList = new Vector<PaymentVO>();
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL PAYMENT_PRINT_PROC(?,?)}");
			cstmt.setString(1, cus_id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(2);
			while (rs.next()) {
				PaymentVO payvo = new PaymentVO();
				payvo.setPayment_id(rs.getInt("payment_id"));
				payvo.setUserId(rs.getString("userId"));
				payvo.setPerformance_id(rs.getInt("performance_id"));
				payvo.setReservation_date(String.valueOf(rs.getDate("reservation_date")));
				payvo.setRecipient_name(rs.getString("recipient_name"));
				payvo.setRecipient_phone(rs.getString("recipient_phone"));
				payvo.setRecipient_address(rs.getString("recipient_address"));
				payvo.setReservation_seats(rs.getString("reservation_seats"));
				payvo.setTotal_reservation_seats(rs.getInt("total_reservation_seats"));
				payvo.setTotal_payment_amount(rs.getInt("total_payment_amount"));

				paymentTotalList.addElement(payvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, cstmt, con);
		}
		return paymentTotalList;
	}

	// 결제내역 수 출력 함수
	public int getPayment_Count(String userId) {
		Connection con = null;
		CallableStatement cstmt = null;
		int count = 0;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL PAYMENT_COUNT_PROC(?,?)}");
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

	// 현재 결제 내역 출력
	public Vector<PaymentVO> getPayment(String userId) {
		Vector<PaymentVO> paymentList = new Vector<PaymentVO>();
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL CPAY_PRINT_PROC(?,?)}");
			cstmt.setString(1, userId);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(2);
			while (rs.next()) {
				PaymentVO pvo = new PaymentVO();
				pvo.setPayment_id(rs.getInt("payment_id"));
				pvo.setUserId(rs.getString("userId"));
				pvo.setPerformance_id(rs.getInt("performance_id"));
				pvo.setPerformance_name(rs.getString("performance_name"));
				pvo.setReservation_date(String.valueOf(rs.getDate("reservation_date")));
				pvo.setRecipient_name(rs.getString("recipient_name"));
				pvo.setRecipient_phone(rs.getString("recipient_phone"));
				pvo.setRecipient_address(rs.getString("recipient_address"));
				pvo.setReservation_seats(rs.getString("reservation_seats"));
				pvo.setTotal_reservation_seats(rs.getInt("total_reservation_seats"));
				pvo.setTotal_payment_amount(rs.getInt("total_payment_amount"));
				paymentList.addElement(pvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, cstmt, con);
		}
		return paymentList;
	}
}
