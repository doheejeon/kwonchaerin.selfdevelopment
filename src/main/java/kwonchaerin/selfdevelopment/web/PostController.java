package kwonchaerin.selfdevelopment.web;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kwonchaerin.selfdevelopment.domain.Post;
import kwonchaerin.selfdevelopment.service.PostService;

@RestController
@RequestMapping
public class PostController {
	@Autowired private PostService pstService;
	
	//@GetMapping("/post/{usrCode}") //path variable 필요
	@GetMapping("/getPostAddCmt")
	public ModelAndView getPostAddCmt(ModelAndView mv) {
		mv.setViewName("community/getPostAddCmt");
		return mv;
	}

	//@PatchMapping("/post") //mapper문서에서 조건문 usrCode가 일치하는 post갖고 와서 리턴
	@GetMapping("/fixPost")
	public ModelAndView fixPost(ModelAndView mv) {
		mv.setViewName("community/fixPost");
		return mv;
	}
	///////////////////////////////////////////
	
	@GetMapping("post/list") //게시판 목록 조회
	public List<Post> getPosts() {
		return pstService.getPosts();
	}
	
	@GetMapping("post/list/{postId}") //게시글 조회
	public Post getPost(@RequestBody int postId) {
		return pstService.getPost(postId);
	}
	

	@GetMapping("post/list/head") //헤더별 게시판 조회
	public Post getHead(String pstHead) {
		return pstService.getHead(pstHead);
	}
	
	
	@PostMapping("post/add") //게시글 추가
	public boolean addPost(@RequestBody Post post, 
			@DateTimeFormat(pattern="yyyy-MM-dd HH:MM:ss") LocalDate pstWriteDate) {
		return pstService.addPost(post);
	}
	
	@PutMapping("post/fix") //게시글 수정 
	public boolean fixPost(@RequestBody Post post) {
		return pstService.fixPost(post);
	}
	
	@DeleteMapping("post/del/{postId}") //게시글 삭제
	public boolean delPost(@RequestBody int postId) {
		return pstService.delPost(postId);
	}
	
}