package kwonchaerin.selfdevelopment.dao.map;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Comment;

public interface CommentMap {
	List<Comment> selectComments(int pstId);
	Comment selectComment(int cmtId);
	
	int insertComment(Comment cmt);
	int updateComment(Comment cmt);	
	int deleteComment(int cmtId);
}