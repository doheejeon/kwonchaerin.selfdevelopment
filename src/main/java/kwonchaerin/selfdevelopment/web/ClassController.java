package kwonchaerin.selfdevelopment.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kwonchaerin.selfdevelopment.domain.Class;
import kwonchaerin.selfdevelopment.service.ClassService;

@RestController
@RequestMapping
public class ClassController {
	@Autowired private ClassService classService;

	// 클래스 추가
	@Transactional
	@PostMapping("/class/add")
	public boolean addClass(@RequestBody Class cls) {
		return classService.addClass(cls);
	}
	
	//클래스 수정
	@Transactional
	@PutMapping("/class/fix")
	public boolean fixClass(@RequestBody Class cls) {
		return classService.fixClass(cls);
	}
	
	// 클래스 삭제
	@Transactional
	@DeleteMapping("/class/del/{clsId}")
	public boolean delClass(@RequestBody int clsId) {
		return classService.delClass(clsId);
	}	
}