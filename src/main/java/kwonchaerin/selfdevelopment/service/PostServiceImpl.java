package kwonchaerin.selfdevelopment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kwonchaerin.selfdevelopment.dao.PostDao;
import kwonchaerin.selfdevelopment.domain.Post;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	private PostDao postDao;

	@Override
	public List<Post> getPosts() {
		return postDao.selectPosts();
	}
	
	@Override
	public Post getPost(int postId) {
		return postDao.selectPost(postId);
	}

	@Override
	public Post getHead(String pstHead) {
		return postDao.selectHead(pstHead);
	}

	@Override
	public boolean addPost(Post post) {
		return postDao.insertPost(post) > 0;
	}

	@Override
	public boolean fixPost(Post post) {
		return postDao.updatePost(post) > 0;
	}

	@Override
	public boolean delPost(int postId) {
		return postDao.deleteUser(postId) > 0;
	}
}
