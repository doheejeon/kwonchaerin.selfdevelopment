package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kwonchaerin.selfdevelopment.dao.map.CouponMap;
import kwonchaerin.selfdevelopment.domain.Coupon;

@Repository
public class CouponDaoImpl implements CouponDao {
	@Autowired private CouponMap couponMap;
	
	@Override
	public List<Coupon> selectCoupons() {
		return couponMap.selectCoupons();
	}
	
	@Override
	public Coupon selectCoupon(int cpnCode) {
		return couponMap.selectCoupon(cpnCode);
	}
	
	@Override
	public int insertCoupon(Coupon coupon) {
		return couponMap.insertCoupon(coupon);
	}
	
	@Override
	public int updateCoupon(Coupon coupon) {
		return couponMap.updateCoupon(coupon);
	}
	
	
	@Override
	public int deleteCoupon(int cpnCode) {
		return couponMap.deleteCoupon(cpnCode);
	}
}