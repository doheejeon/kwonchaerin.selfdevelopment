package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Comment;

public interface CommentDao {
	List<Comment> selectComments(int pstId);
	Comment selectComment(int cmtId);
	
	int insertComment(Comment cmt);
	int updateComment(Comment cmt);	
	int deleteComment(int cmtId);
}