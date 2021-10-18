package kwonchaerin.selfdevelopment.dao.map;

import java.util.List;
import kwonchaerin.selfdevelopment.domain.User;

public interface UserMap {
	List<User> selectUsers();
	List<User> selectRankers();
	User selectUser(String usrId);
	
	int insertUser(User user);
	int updateUser(User user);
	int patchUser(User user);
	int deleteUser(int usrCode);
}