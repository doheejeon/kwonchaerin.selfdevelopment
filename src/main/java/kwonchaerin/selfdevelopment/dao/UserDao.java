package kwonchaerin.selfdevelopment.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kwonchaerin.selfdevelopment.domain.User;

public interface UserDao {
	List<User> selectUsers();
	List<User> selectRankers();
	User selectUser(String usrId);
	
	int insertUser(User user);
	int updateUser(User user);
	int patchUser(User user);
	int deleteUser(int usrCode);
	
	User loginCheck(Map<String, String> loginMap);
	void logout(HttpSession session);
}