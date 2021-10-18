package kwonchaerin.selfdevelopment.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kwonchaerin.selfdevelopment.domain.User;

public interface UserService {
	List<User> getUsers();
	List<User> getRankers();
	User getUser(String usrId);
	
	boolean addUser(User user);
	boolean fixUser(User user);
	boolean patchUser(User user);
	boolean delUser(int usrCode);
	
	User loginCheck(Map<String, String> loginMap);
	void logout(HttpSession session);
}