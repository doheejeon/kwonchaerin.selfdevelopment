package kwonchaerin.selfdevelopment.service;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Coupon;

public interface CouponService {
	List<Coupon> selectCoupons();
	Coupon selectCoupon(int cpnCode);
	
	boolean insertCoupon(Coupon coupon);
	boolean updateCoupon(Coupon coupon);
	boolean deleteCoupon(int cpnCode);
}