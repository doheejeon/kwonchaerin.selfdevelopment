package kwonchaerin.selfdevelopment.dao.map;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Coupon;

public interface CouponMap {
	List<Coupon> selectCoupons();
	Coupon selectCoupon(int cpnCode);
	int insertCoupon(Coupon coupon);
	int updateCoupon(Coupon coupon);
	int deleteCoupon(int cpnCode);
}