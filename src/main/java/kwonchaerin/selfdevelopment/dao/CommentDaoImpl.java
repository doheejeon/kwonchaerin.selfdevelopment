package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kwonchaerin.selfdevelopment.dao.map.CommentMap;
import kwonchaerin.selfdevelopment.domain.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {
	@Autowired private CommentMap commentMap;
	
	@Override
	public List<Comment> selectComments(int pstId) {
		return commentMap.selectComments(pstId);
	}
	
	@Override
	public Comment selectComment(int cmtId) {
		return commentMap.selectComment(cmtId);
	}
	
	@Override
	public int insertComment(Comment cmt) {
		return commentMap.insertComment(cmt);
	}
	
	@Override
	public int updateComment(Comment cmt) {
		return commentMap.updateComment(cmt);
	}
	
	@Override
	public int deleteComment(int cmtId) {
		return commentMap.deleteComment(cmtId);
	}
}