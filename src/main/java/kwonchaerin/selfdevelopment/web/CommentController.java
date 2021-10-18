package kwonchaerin.selfdevelopment.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kwonchaerin.selfdevelopment.domain.Comment;
import kwonchaerin.selfdevelopment.service.CommentService;

@RestController
@RequestMapping
public class CommentController {
	@Autowired private CommentService commentService;
	
	/* 게시글 댓글 보기 */
	@GetMapping("/comment/list")
	public List<Comment> getComments(int pstId) {
		return commentService.getComments(pstId);
	}
	/* 댓글 추가 */
	@Transactional
	@PostMapping("/comment/add")
	public boolean addComment(@RequestBody Comment cmt) {
		return commentService.addComment(cmt);
	}
	
	/* 댓글 수정 */
	@Transactional
	@PutMapping("/comment/fix")
	public boolean fixComment(@RequestBody Comment cmt) {
		return commentService.fixComment(cmt);
	}
	
	/*댓글 삭제 */
	@Transactional
	@DeleteMapping("/comment/del/{cmtId}")
	public boolean delComment(@RequestBody int cmtId) {
		return commentService.delComment(cmtId);
	}
}