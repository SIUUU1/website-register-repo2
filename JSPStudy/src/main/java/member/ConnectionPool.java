package member;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public final class ConnectionPool {
	// 정적 블럭 영역
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 사용하지 않는 커넥션 즉, 초기 커넥션을 저장하는 변수
	private ArrayList<Connection> free;
	private ArrayList<Connection> used; // 사용중인 커넥션을 저장하는 변수
	private String url;
	private String user;
	private String password;
	private int initialCons; // 초기 Connection 수
	private int maxCons; // 최대 Connection 수
	private int numCons; // 총 Connection 수
	private static ConnectionPool cp;

	public static ConnectionPool getInstance() {
		if (cp == null) {
			synchronized (ConnectionPool.class) {
				cp = new ConnectionPool();
			}
		}
		return cp;
	}

	private ConnectionPool() {
		String filePath = "/Users/ansiu/myProject/myjsp/JSPStudy/src/main/java/member/db.properties";
		try {
			Properties properties = new Properties();
			properties.load(new FileReader(filePath));
			url = properties.getProperty("url");
			user = properties.getProperty("user");
			password = properties.getProperty("password");
			initialCons = Integer.parseInt(properties.getProperty("initialCons"));
			maxCons = Integer.parseInt(properties.getProperty("maxCons"));
			
			free = new ArrayList<Connection>(initialCons);
			used = new ArrayList<Connection>(initialCons);
			while (numCons < maxCons) {
				addConnection();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.out.println("DB.PROPERTIES 연결실패");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("DB.PROPERTIES 연결실패");
		}
	}

	private void addConnection() {
		free.add(getNewConnection());
	}

	// 새로운 커넥션 객체를 생성
	private Connection getNewConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("About to connect to " + con);
		++numCons; // 커넥션 생성될 때 마다 숫자 증가
		return con;
	}

	// free에 있는 커넥션을 used로 옮기는 작업=>free--->used
	public synchronized Connection getConnection() {
		// free에 Connection이 없으면 maxCons만큼 Connection을 더 생성한다.
		if (free.isEmpty()) {
			while (numCons < maxCons) {
				addConnection();
			}
		}
		Connection _con = null;
		_con = free.get(free.size() - 1);
		free.remove(_con);
		used.add(_con);
		return _con;
	}

	// used에 있는 커넥션을 free로 반납
	public synchronized void releaseConnection(Connection _con) throws SQLException {
		boolean flag = false;
		if (used.contains(_con)) {
			used.remove(_con);
			numCons--;
			flag = true;
		} else {
			throw new SQLException("ConnectionPool" + "에 있지않네요!!");
		}
		if (flag) {
			free.add(_con);
			numCons++;
		} else {
			try {
				_con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 모든 Connection 자원을 반납
	public void closeAll() {
		// used에 있는 커넥션을 모두 삭제한다.
		for (int i = 0; i < used.size(); i++) {
			Connection _con = used.get(i);
			used.remove(i--);
			try {
				_con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// free에 있는 커넥션을 모두 삭제한다.
		for (int i = 0; i < free.size(); i++) {
			Connection _con = free.get(i);
			free.remove(i--);
			try {
				_con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		numCons = 0;
	}

	public int getMaxCons() {
		return maxCons;
	}

	public int getNumCons() {
		return numCons;
	}

}
