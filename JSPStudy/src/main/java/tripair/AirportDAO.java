package tripair;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Properties;
import java.util.Vector;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import member.DBPoolUtil;
import oracle.jdbc.OracleTypes;

public class AirportDAO {
	private static AirportDAO instance = null;

	private AirportDAO() {
	}

	public static synchronized AirportDAO getInstance() {
		if (instance == null) {
			instance = new AirportDAO();
		}
		return instance;
	}

	// 항공권 정보 저장하기
	public int setAirportRegister(Vector<AirportVO> list) {
		Connection con = null;
		CallableStatement cstmt = null;
		int result = -1;
		try {
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL AIRPORTS_INSERT_PROC(?,?,?,?,?,?,?,?,?)}");

			for (AirportVO avo : list) {
				cstmt.setString(1, avo.getVihicle_id());
				cstmt.setString(2, avo.getAirline_name());
				cstmt.setString(3, avo.getDepAirport_name());
				cstmt.setString(4, avo.getArrAirport_name());
				cstmt.setString(5, avo.getDep_plandtime());
				cstmt.setString(6, avo.getArr_plandtime());
				cstmt.setInt(7, avo.getEconomy_charge());
				cstmt.setInt(8, avo.getPrestige_charge());
				cstmt.registerOutParameter(9, Types.INTEGER);
				cstmt.executeUpdate();
				result = cstmt.getInt(9);
				if (result == 0) {
					System.out.println("항공편 등록 성공");
				}
				if (result == 1) {
					System.out.println("항공편 정보가 중복되어 등록하지 않았습니다.");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(cstmt, con);
		}
		return result;
	}

	// 항공권 목록 가져오기
	public Vector<AirportVO> getAirportList(String depAirportId, String arrAirportId, String depPlandTime,
			String arrPlandtime) {
		Vector<AirportVO> airportDataList = new Vector<>();
		Connection con = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			//출발
			con = DBPoolUtil.makeConnection();
			cstmt = con.prepareCall("{CALL AIRPORTS_PRINT_PROC(?,?,?,?)}");
			cstmt.setString(1, depAirportId);
			cstmt.setString(2, arrAirportId);
			cstmt.setString(3, depPlandTime);
			cstmt.registerOutParameter(4, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(4);
			while (rs.next()) {
				AirportVO avo = new AirportVO();
				avo.setAirports_id(rs.getInt("airports_id"));
				avo.setVihicle_id(rs.getString("vihicle_id"));
				avo.setAirline_name(rs.getString("airline_name"));
				avo.setDepAirport_name(rs.getString("depAirport_name"));
				avo.setArrAirport_name(rs.getString("arrAirport_name"));
				avo.setDep_plandtime(rs.getString("dep_plandtime"));
				avo.setArr_plandtime(rs.getString("arr_plandtime"));
				avo.setEconomy_charge(rs.getInt("economy_charge"));
				avo.setPrestige_charge(rs.getInt("prestige_charge"));
				airportDataList.addElement(avo);
			}
			//도착
			cstmt = con.prepareCall("{CALL AIRPORTS_PRINT_PROC(?,?,?,?)}");
			cstmt.setString(2, depAirportId);
			cstmt.setString(1, arrAirportId);
			cstmt.setString(3, arrPlandtime);
			cstmt.registerOutParameter(4, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(4);
			while (rs.next()) {
				AirportVO avo = new AirportVO();
				avo.setAirports_id(rs.getInt("airports_id"));
				avo.setVihicle_id(rs.getString("vihicle_id"));
				avo.setAirline_name(rs.getString("airline_name"));
				avo.setDepAirport_name(rs.getString("depAirport_name"));
				avo.setArrAirport_name(rs.getString("arrAirport_name"));
				avo.setDep_plandtime(rs.getString("dep_plandtime"));
				avo.setArr_plandtime(rs.getString("arr_plandtime"));
				avo.setEconomy_charge(rs.getInt("economy_charge"));
				avo.setPrestige_charge(rs.getInt("prestige_charge"));
				airportDataList.addElement(avo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBPoolUtil.dbRelease(rs, cstmt, con);
		}
		return airportDataList;
	}

	// 항공권 검색하기
	public Vector<AirportVO> selectAirport(String depAirportId, String arrAirportId, String depPlandTime) {
		Vector<AirportVO> list = new Vector<AirportVO>();
		// properties 가져오기
		String filePath = "/Users/ansiu/website-register-repo2/JSPStudy/src/main/java/member/db.properties";
		String serviceKey = null;
		String requestURL = null;

		try {
			Properties properties = new Properties();
			properties.load(new FileReader(filePath));
			serviceKey = properties.getProperty("serviceKey");
			requestURL = properties.getProperty("requestURL");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 1.요청 url 생성
		StringBuilder urlBuilder = new StringBuilder(requestURL); /* URL */
		try {
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ serviceKey);
			urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "="
					+ URLEncoder.encode("xml", "UTF-8")); /* 데이터 타입(xml, json) */
			urlBuilder.append("&" + URLEncoder.encode("depAirportId", "UTF-8") + "="
					+ URLEncoder.encode(depAirportId, "UTF-8")); /* 출발공항ID */
			urlBuilder.append("&" + URLEncoder.encode("arrAirportId", "UTF-8") + "="
					+ URLEncoder.encode(arrAirportId, "UTF-8")); /* 도착공항ID */
			urlBuilder.append("&" + URLEncoder.encode("depPlandTime", "UTF-8") + "="
					+ URLEncoder.encode(depPlandTime, "UTF-8")); /* 출발일(YYYYMMDD) */
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 2.connection 객체 생성
		URL url = null;
		HttpURLConnection conn = null;
		try {
			url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			//System.out.println("Response code: " + conn.getResponseCode());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 3.요청전송 및 응답 처리
		BufferedReader br = null;
		try {
			int statusCode = conn.getResponseCode();
			//System.out.println(statusCode);
			if (statusCode >= 200 && statusCode <= 300) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			Document doc = parseXML(conn.getInputStream());
			NodeList descNodes = doc.getElementsByTagName("item");
			for (int i = 0; i < descNodes.getLength(); i++) {
				Node item = descNodes.item(i);
				AirportVO data = new AirportVO();
				for (Node node = item.getFirstChild(); node != null; node = node.getNextSibling()) {
					switch (node.getNodeName()) {
					case "vihicleId":
						data.setVihicle_id(node.getTextContent());
						break;
					case "airlineNm":
						data.setAirline_name(node.getTextContent());
						break;
					case "depAirportNm":
						data.setDepAirport_name(node.getTextContent());
						break;
					case "arrAirportNm":
						data.setArrAirport_name(node.getTextContent());
						break;
					case "depPlandTime":
						data.setDep_plandtime(node.getTextContent());
						break;
					case "arrPlandTime":
						data.setArr_plandtime(node.getTextContent());
						break;
					case "economyCharge":
						data.setEconomy_charge(Integer.parseInt(node.getTextContent()));
						break;
					case "prestigeCharge":
						data.setPrestige_charge(Integer.parseInt(node.getTextContent()));
						break;
					}
				}
				list.addElement(data);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// 4.자원반환
		conn.disconnect();
		return list;
	}

	public static Document parseXML(InputStream inputStream) {
		DocumentBuilderFactory objdcBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder objdcBuilder = null;
		Document doc = null;
		try {
			objdcBuilder = objdcBuilderFactory.newDocumentBuilder();
			doc = objdcBuilder.parse(inputStream);
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return doc;
	}
}
