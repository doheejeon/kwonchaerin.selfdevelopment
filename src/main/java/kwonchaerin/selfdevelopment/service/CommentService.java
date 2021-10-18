package kwonchaerin.selfdevelopment.service;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Comment;

public interface CommentService {
	List<Comment> getComments(int pstId);
	Comment getComment(int cmtId);
	
	boolean addComment(Comment cmt);
	boolean fixComment(Comment cmt);
	boolean delComment(int cmtId);
}
