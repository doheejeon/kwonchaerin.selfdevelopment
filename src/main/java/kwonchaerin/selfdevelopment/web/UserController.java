package kwonchaerin.selfdevelopment.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kwonchaerin.selfdevelopment.domain.User;
import kwonchaerin.selfdevelopment.service.UserService;

@RestController
@RequestMapping
public class UserController {
	@Autowired private UserService userService;
	
	 /* @CookieValue(required=false) Cookie rememberId rememberId.getValue()
	@ResponseBody
	@GetMapping("/login")
	public ModelAndView loginIn(ModelAndView mv, @CookieValue(required=false) Cookie rememberId) {
		if(rememberId != null)
			user.setUserId(rememberId.getValue());
		return "ch05/ex05/loginIn";
	} */
	
	/* 랭킹보드 */
	@GetMapping("/user/listRankers")
	public List<User> getRankers() {
		return userService.getRankers();
	}
	
	/* 로그인 */
	@PostMapping("/user/loginProc")
	public @ResponseBody int login(@RequestBody Map<String, String> loginMap, Model model, HttpSession session) throws Exception {
		int result = 0;
		
		try {
			User user = userService.loginCheck(loginMap);
			if(user != null) {
				session.setAttribute("user", user);
				if(user.getPosition().equals("NOOB") || user.getPosition().equals("PLAYER")) return 1;
				else if(user.getPosition().equals("GM")) return 2;
			} else return 0;
		} catch(Exception e) {
			return 0;
		}
		
		return result;
	}
	
	/* 로그아웃 */
	@GetMapping("/user/logout")
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		session.invalidate();
		mv.setViewName("main");
		
		return mv;
	}

	/* 메일인증 */
	@PostMapping("/user/sendCode")
	public String makeCode(HttpSession session, HttpServletResponse response) {
		User user = (User)(session.getAttribute("user"));
		String authCode = "";
		String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		
		if(user.getPosition().equals("NOOB")) {
			for(int i = 0; i < 5; i++)
				authCode += str.charAt((int)Math.floor(Math.random() * str.length()));
			
			Cookie cookie = new Cookie("verification", authCode);
			cookie.setMaxAge(86400);
			response.addCookie(cookie);
		}
		return authCode;
	}
	
	@Transactional
	@PatchMapping("/user/verifyProc")
	public boolean bePlayer(HttpSession session, String authCode) {
		boolean isVerified = false;
		User user = (User)(session.getAttribute("user"));
		
		if(authCode.equals(session.getAttribute("verification"))) {
			user.setPosition("PLAYER");
			session.removeAttribute("verification");
			
			isVerified = userService.patchUser(user);
		}
			
		return isVerified;
	}
	
	/* 회원페이지 */
	/* @RequestBody */
	@GetMapping("/user/player/{usrCode}")
	public ModelAndView getPlayer(ModelAndView mv, String usrId, int usrCode) {
		User user = userService.getUser(usrId);
		if(user != null && user.getUsrCode() == usrCode)
			mv.setViewName("/user/" + usrCode);
		
		return mv;
	}
	
	/* 레벨업 */ /* 퀘스트 보상 시스템 */
	@Transactional
	@PatchMapping("/quest/Proc")
	public boolean getReward(HttpSession session, int difficulty) {
		User user = (User)(session.getAttribute("user"));
		
		float totLv = user.getUsrLv();
		int level = (int) Math.floor(totLv);
		float getExp = difficulty * (5 / (4 * (level ^ 3)));
		
		int gold = user.getGold();
		int earn = difficulty^3 * (level^2 + 10) / (difficulty^2 * level);
		
		/* users_quests의 proc_step도 수정되게 */
		user.setUsrLv(totLv + getExp);
		user.setGold(gold + earn);
		
		return userService.patchUser(user);
	}
	
	/* 회원탈퇴진행 */
	@PostMapping("/user/quitIn")
	public ModelAndView quit(ModelAndView mv, HttpSession session, String usrPw) {
		mv.setViewName("user/delUserChk");
		User user = (User)(session.getAttribute("user"));
		if(user.getUsrPw().equals(usrPw)) mv.setViewName("user/delUserOut");
		
		return mv;
	}
	
	/* 회원탈퇴신청 */
	@Transactional
	@PatchMapping("/user/quitProc")
	public boolean holdQuit(HttpSession session) {
		User user = (User)(session.getAttribute("user"));
		user.setPosition("OUT");
		return userService.patchUser(user);
	}
	
	/* 조회 */
	@GetMapping("/user/list")
	public List<User> getUsers() {
		return userService.getUsers();
	}
	
	/* 추가, 가입 */
	@Transactional
	@PostMapping("/user/add")
	public boolean addUser(@RequestBody User user) {
		return userService.addUser(user);
	}
	
	/* 회원정보변경 및 관리자 직접 수정 */
	@Transactional
	@PutMapping("/user/fix")
	public boolean fixUser(@RequestBody User user) {
		return userService.fixUser(user);
	}
	
	/* 관리자 회원 삭제 */
	@Transactional
	@DeleteMapping("/user/del/{usrCode}")
	public boolean delUser(@RequestBody int usrCode) {
		return userService.delUser(usrCode);
	}
}