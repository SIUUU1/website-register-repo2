package cart;

import java.util.Objects;

public class CartVO {
	// memberVariable
	private int cart_id; // 장바구니 ID
	private String userId; // 고객 ID
	private int performance_id; // 공연 ID
	private String performance_name; // 공연이름
	private String reservation_seats; // 예매좌석
	private int total_reservation_seats; // 총예매수
	private int total_payment_amount; // 총결제금액
	// constructor

	public CartVO() {
		super();
	}

	public CartVO(String userId, int performance_id, String reservation_seats) {
		super();
		this.userId = userId;
		this.performance_id = performance_id;
		this.reservation_seats = reservation_seats;
	}

	public CartVO(String userId, int performance_id, String reservation_seats, int total_reservation_seats,
			int total_payment_amount) {
		super();
		this.userId = userId;
		this.performance_id = performance_id;
		this.reservation_seats = reservation_seats;
		this.total_reservation_seats = total_reservation_seats;
		this.total_payment_amount = total_payment_amount;
	}

	public CartVO(int cart_id, String userId, int performance_id, String reservation_seats,
			int total_reservation_seats, int total_payment_amount) {
		super();
		this.cart_id = cart_id;
		this.userId = userId;
		this.performance_id = performance_id;
		this.reservation_seats = reservation_seats;
		this.total_reservation_seats = total_reservation_seats;
		this.total_payment_amount = total_payment_amount;
	}

	// memberFunction
	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
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
		return Objects.hash(cart_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartVO other = (CartVO) obj;
		return cart_id == other.cart_id;
	}

	@Override
	public String toString() {
		return " " + cart_id + " | " + userId + " | " + performance_id + " | " + performance_name + " | "
				+ reservation_seats + " | " + total_reservation_seats + "";
	}

}
