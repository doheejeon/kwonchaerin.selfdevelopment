package kwonchaerin.selfdevelopment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kwonchaerin.selfdevelopment.dao.CommentDao;
import kwonchaerin.selfdevelopment.domain.Comment;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired private CommentDao commentDao;

	@Override
	public List<Comment> getComments(int pstId) {
		return commentDao.selectComments(pstId);
	}
	
	@Override
	public Comment getComment(int cmtId) {
		return commentDao.selectComment(cmtId);
	}
	
	@Override
	public boolean addComment(Comment cmt) {
		return commentDao.insertComment(cmt) > 0;
	}
	
	@Override
	public boolean fixComment(Comment cmt) {
		return commentDao.updateComment(cmt) > 0;
	}
	
	@Override
	public boolean delComment(int cmtId) {
		return commentDao.deleteComment(cmtId) > 0;
	}
}