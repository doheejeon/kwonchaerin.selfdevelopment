package kwonchaerin.selfdevelopment.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kwonchaerin.selfdevelopment.dao.map.UserMap;
import kwonchaerin.selfdevelopment.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;
	
	@Override
	public List<User> selectUsers() {
		return userMap.selectUsers();
	}
	
	@Override
	public List<User> selectRankers() {
		return userMap.selectRankers();
	}
	
	@Override
	public User selectUser(String usrId) {
		return userMap.selectUser(usrId);
	}
	
	@Override
	public int insertUser(User user) {
		return userMap.insertUser(user);
	}
	
	@Override
	public int updateUser(User user) {
		return userMap.updateUser(user);
	}
	
	@Override
	public int patchUser(User user) {
		return userMap.patchUser(user);
	}
	
	@Override
	public int deleteUser(int usrCode) {
		return userMap.deleteUser(usrCode);
	}

	
	@Override
	public User loginCheck(Map<String, String> loginMap) {
		String usrId = loginMap.get("usrId");
		String usrPw = loginMap.get("usrPw");;
		
		User user = userMap.selectUser(usrId);
		
		if(user != null && user.getUsrPw().equals(usrPw)) return user;
		else return null;
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
}