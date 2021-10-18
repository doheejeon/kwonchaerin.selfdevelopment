package kwonchaerin.selfdevelopment.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kwonchaerin.selfdevelopment.domain.Coupon;
import kwonchaerin.selfdevelopment.service.CouponService;

@RestController
@RequestMapping
public class CouponController {
	@Autowired private CouponService couponService;
	
	// 쿠폰 사용처리
	@Transactional
	@PutMapping("/coupon/update")
	public boolean updateCoupon(@RequestBody Coupon coupon) {
		return couponService.updateCoupon(coupon);
	}
}