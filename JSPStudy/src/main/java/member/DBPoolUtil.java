package member;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBPoolUtil {
	public static Connection makeConnection() {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		return con;
	}

	public static void dbRelease(ResultSet rs, Statement stmt, Connection conn) {
		ConnectionPool pool = ConnectionPool.getInstance();
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (conn != null) {
				pool.releaseConnection(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void dbRelease(ResultSet rs,ResultSet rs1, Statement stmt, Connection conn) {
		ConnectionPool pool = ConnectionPool.getInstance();
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (rs1 != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (conn != null) {
				pool.releaseConnection(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void dbRelease(Statement stmt, Connection conn) {
		ConnectionPool pool = ConnectionPool.getInstance();
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			if (conn != null) {
				pool.releaseConnection(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
