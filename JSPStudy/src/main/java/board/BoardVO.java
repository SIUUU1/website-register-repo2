package board;

import java.sql.Timestamp;

public class BoardVO {
	private int num; // 번호
	private String writer; // 작성자
	private String email; // 이메일
	private String userID; // 작성자 아이디
	private String category; // 카테고리
	private String subject; // 제목
	private Timestamp regdate; // 작성일
	private int readcount; // 조회수
	private int ref; // 참조글
	private int step; //
	private int depth; //
	private String content; // 내용
	private String ip; // 작성자 아이피주소

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "BoardVO [num=" + num + ", writer=" + writer + ", email=" + email + ", userID=" + userID + ", category="
				+ category + ", subject=" + subject + ", regdate=" + regdate + ", readcount=" + readcount + ", ref="
				+ ref + ", step=" + step + ", depth=" + depth + ", content=" + content + ", ip=" + ip + "]";
	}

}
