package kwonchaerin.selfdevelopment.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kwonchaerin.selfdevelopment.dao.UserDao;
import kwonchaerin.selfdevelopment.domain.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;
	
	@Override
	public List<User> getUsers() {
		return userDao.selectUsers();
	}
	
	@Override
	public List<User> getRankers() {
		return userDao.selectRankers();
	}
	
	@Override
	public User getUser(String usrId) {
		return userDao.selectUser(usrId);
	}
	
	@Override
	public boolean addUser(User user) {
		return userDao.insertUser(user) > 0;
	}
	
	@Override
	public boolean fixUser(User user) {
		return userDao.updateUser(user) > 0;
	}
	
	@Override
	public boolean patchUser(User user) {
		return userDao.patchUser(user) > 0;
	}
	
	@Override
	public boolean delUser(int usrCode) {
		return userDao.deleteUser(usrCode) > 0;
	}
	
	@Override
	public User loginCheck(Map<String, String> loginMap) {
		return userDao.loginCheck(loginMap);
	}
	
	@Override
	public void logout(HttpSession session) {
		 userDao.logout(session);
	}
}
