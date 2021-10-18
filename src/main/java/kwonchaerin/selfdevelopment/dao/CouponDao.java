package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Coupon;

public interface CouponDao {
	List<Coupon> selectCoupons();
	Coupon selectCoupon(int cpnCode);
	
	int insertCoupon(Coupon coupon);
	int updateCoupon(Coupon coupon);
	int deleteCoupon(int cpnCode);
}