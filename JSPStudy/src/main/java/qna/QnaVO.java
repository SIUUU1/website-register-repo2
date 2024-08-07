package qna;

import java.sql.Timestamp;

public class QnaVO {
	private int qna_id;// qna글번호
	private String subject;// 제목
	private String category;// 카테고리
	private String qna_writer;// qna작성자
	private String qna_content;// qna내용
	private int group_id;// qna그룹아이디
	private int qora;// qora==1 qna, qora==2 답변
	private int reply;// 답변여부
	private Timestamp reg_date;// qna작성일

	public int getQna_id() {
		return qna_id;
	}

	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getQna_writer() {
		return qna_writer;
	}

	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public int getGroup_id() {
		return group_id;
	}

	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}

	public int getQora() {
		return qora;
	}

	public void setQora(int qora) {
		this.qora = qora;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

}
