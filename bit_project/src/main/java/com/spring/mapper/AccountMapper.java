package com.spring.mapper;

public interface AccountMapper {
	int getSubscribe_num(String email);
	int deleteProduct_state(int subscribe_num);
	int deleteSubscribe_payment(int subscribe_num);
	int deleteAlarm(String email);
	int deleteReservation(String email);
	int deleteBookmark(String email);
	int deleteWishlist(String email);
	int deleteDelivery_loc(String email);
	int deleteMember_account(String email);
	int deleteSubscribe(String email);
	int deleteMember_point(String email);
	int deleteMember(String email);
}
