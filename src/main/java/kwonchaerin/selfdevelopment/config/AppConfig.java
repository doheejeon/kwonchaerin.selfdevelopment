package kwonchaerin.selfdevelopment.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kwonchaerin.selfdevelopment.web.LoginInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan("kwonchaerin.selfdevelopment")
@ImportResource("classpath:kwonchaerin/selfdevelopment/config/app.xml")
public class AppConfig implements WebMvcConfigurer {
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/view/", ".jsp");
	}
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("main");
		
		registry.addViewController("/user/login").setViewName("user/login");
		
		registry.addViewController("/user/join/step1").setViewName("user/addUserChk");
		registry.addViewController("/user/join/step2").setViewName("user/addUserIn");
		registry.addViewController("/user/join/step3").setViewName("user/addUserOut");
		
		registry.addViewController("/user/account/step1").setViewName("user/getUserIdPwChk");
		registry.addViewController("/user/account/step2").setViewName("user/getUserIdPwOut");
		
		registry.addViewController("/user/mypage").setViewName("user/mypage");
		
		registry.addViewController("/user/verifiy").setViewName("user/verification");
		registry.addViewController("/user/modify/step1").setViewName("user/fixUserChk");
		registry.addViewController("/user/modify/step2").setViewName("user/fixUserIn");
		
		registry.addViewController("/user/quit/step1").setViewName("user/delUserChk");
		registry.addViewController("/user/quit/step2").setViewName("user/delUserOut");
		
		registry.addViewController("/admin").setViewName("admin/main");
		
		registry.addViewController("/admin/classes").setViewName("admin/class/crudClass");
		registry.addViewController("/admin/postsAndComments").setViewName("admin/community/crudPostComment");
		registry.addViewController("/admin/coupons").setViewName("admin/coupon/cruCoupon");
		registry.addViewController("/admin/guide").setViewName("admin/guide/fixTos");
		registry.addViewController("/admin/log").setViewName("admin/log/getLog");
		registry.addViewController("/admin/logos").setViewName("admin/logo/crudLogo");
		registry.addViewController("/admin/quests").setViewName("admin/quest/crudQuest");
		registry.addViewController("/admin/users").setViewName("admin/user/crudUser");
		registry.addViewController("/admin/users/mail").setViewName("admin/user/fixMail");
		
		registry.addViewController("/community/board").setViewName("community/getPosts");
		registry.addViewController("/community/post").setViewName("community/addPost");
		
		registry.addViewController("/coupon/shop").setViewName("coupon/getCoupon");
		
		registry.addViewController("/guide/aboutUs").setViewName("guide/aboutUs");
		registry.addViewController("/guide/tos").setViewName("guide/tos");
		
		registry.addViewController("/quest/board").setViewName("quest/getQuests");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor())
			.addPathPatterns("/**")
			.excludePathPatterns("/", "/user/login", "/user/loginProc", "/user/player/**",
								"/guide/**", "/coupon/shop", "/quest/board", "/community/board");
	}
	
	@Bean
	public LoginInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}
}
