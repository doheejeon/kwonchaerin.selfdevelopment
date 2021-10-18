package kwonchaerin.selfdevelopment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kwonchaerin.selfdevelopment.dao.CouponDao;
import kwonchaerin.selfdevelopment.domain.Coupon;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired private CouponDao couponDao;
	
	@Override
	public List<Coupon> selectCoupons() {
		return couponDao.selectCoupons();
	}
	@Override
	public Coupon selectCoupon(int cpnCode) {
		return couponDao.selectCoupon(cpnCode);
	}
	
	@Override
	public boolean insertCoupon(Coupon coupon) {
		return couponDao.insertCoupon(coupon) > 0;
	}
	
	@Override
	public boolean updateCoupon(Coupon coupon) {
		return couponDao.updateCoupon(coupon) > 0;
	}
	
	@Override
	public boolean deleteCoupon(int cpnCode) {
		return couponDao.deleteCoupon(cpnCode) > 0;
	}
}
