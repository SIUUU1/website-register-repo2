package payment;

import java.util.Objects;

public class PaymentVO {
	// memberVariable
	private int payment_id; // 결제내역 ID
	private String userId; // 고객 ID
	private int performance_id; // 공연 ID
	private String performance_name; // 공연이름
	private String reservation_date; // 예매날짜
	private String recipient_name; // 수령인 이름
	private String recipient_phone; // 수령인 전화번호
	private String recipient_address; // 수령인 주소
	private String reservation_seats; // 예매좌석
	private int total_reservation_seats; // 총예매수
	private int total_payment_amount; // 총결제금액
	// constructor

	public PaymentVO() {
		super();
	}

	public PaymentVO(String userId, int performance_id, String recipient_name, String recipient_phone,
			String recipient_address, String reservation_seats, int total_reservation_seats, int total_payment_amount) {
		super();
		this.userId = userId;
		this.performance_id = performance_id;
		this.recipient_name = recipient_name;
		this.recipient_phone = recipient_phone;
		this.recipient_address = recipient_address;
		this.reservation_seats = reservation_seats;
		this.total_reservation_seats = total_reservation_seats;
		this.total_payment_amount = total_payment_amount;
	}

	public PaymentVO(String userId, int performance_id, String performance_name, String recipient_name,
			String recipient_phone, String recipient_address, String reservation_seats, int total_reservation_seats,
			int total_payment_amount) {
		super();
		this.userId = userId;
		this.performance_id = performance_id;
		this.performance_name = performance_name;
		this.recipient_name = recipient_name;
		this.recipient_phone = recipient_phone;
		this.recipient_address = recipient_address;
		this.reservation_seats = reservation_seats;
		this.total_reservation_seats = total_reservation_seats;
		this.total_payment_amount = total_payment_amount;
	}

	public PaymentVO(int payment_id, String userId, int performance_id, String performance_name,
			String reservation_date, String recipient_name, String recipient_phone, String recipient_address,
			String reservation_seats, int total_reservation_seats, int total_payment_amount) {
		super();
		this.payment_id = payment_id;
		this.userId = userId;
		this.performance_id = performance_id;
		this.performance_name = performance_name;
		this.reservation_date = reservation_date;
		this.recipient_name = recipient_name;
		this.recipient_phone = recipient_phone;
		this.recipient_address = recipient_address;
		this.reservation_seats = reservation_seats;
		this.total_reservation_seats = total_reservation_seats;
		this.total_payment_amount = total_payment_amount;
	}

	// memberFunction
	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPerformance_id() {
		return performance_id;
	}

	public void setPerformance_id(int performance_id) {
		this.performance_id = performance_id;
	}

	public String getPerformance_name() {
		return performance_name;
	}

	public void setPerformance_name(String performance_name) {
		this.performance_name = performance_name;
	}

	public String getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}

	public String getRecipient_name() {
		return recipient_name;
	}

	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}

	public String getRecipient_phone() {
		return recipient_phone;
	}

	public void setRecipient_phone(String recipient_phone) {
		this.recipient_phone = recipient_phone;
	}

	public String getRecipient_address() {
		return recipient_address;
	}

	public void setRecipient_address(String recipient_address) {
		this.recipient_address = recipient_address;
	}

	public String getReservation_seats() {
		return reservation_seats;
	}

	public void setReservation_seats(String reservation_seats) {
		this.reservation_seats = reservation_seats;
	}

	public int getTotal_reservation_seats() {
		return total_reservation_seats;
	}

	public void setTotal_reservation_seats(int total_reservation_seats) {
		this.total_reservation_seats = total_reservation_seats;
	}

	public int getTotal_payment_amount() {
		return total_payment_amount;
	}

	public void setTotal_payment_amount(int total_payment_amount) {
		this.total_payment_amount = total_payment_amount;
	}

	// Overriding
	@Override
	public int hashCode() {
		return Objects.hash(payment_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PaymentVO other = (PaymentVO) obj;
		return payment_id == other.payment_id;
	}

}
