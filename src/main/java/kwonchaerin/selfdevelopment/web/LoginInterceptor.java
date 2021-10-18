package kwonchaerin.selfdevelopment.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean isLogined = false;
		Object user = request.getSession().getAttribute("user");
		
		if(user != null) isLogined = true;
		else response.sendRedirect(request.getContextPath() + "/user/login");
		
		return isLogined;
	}
}