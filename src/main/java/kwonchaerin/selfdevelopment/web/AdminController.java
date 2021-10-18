package kwonchaerin.selfdevelopment.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kwonchaerin.selfdevelopment.domain.User;
import kwonchaerin.selfdevelopment.service.UserService;

@RestController
@RequestMapping("/admin")
public class AdminController {
	@Autowired private UserService usrService;
	
	@GetMapping("/list")
	public List<User> getUsers() {
		return usrService.getUsers();
	}
}