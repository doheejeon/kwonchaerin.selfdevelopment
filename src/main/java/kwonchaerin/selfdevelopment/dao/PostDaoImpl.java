package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kwonchaerin.selfdevelopment.dao.map.PostMap;
import kwonchaerin.selfdevelopment.domain.Post;

@Repository
public class PostDaoImpl implements PostDao {
	@Autowired private PostMap postMap;

	@Override
	public List<Post> selectPosts() {
		return postMap.selectPosts();
	}

	@Override
	public Post selectPost(int postId) {
		return postMap.selectPost(postId);
	}
	
	@Override
	public Post selectHead(String pstHead) { // 해더바 
		return postMap.selectHead(pstHead);
	}

	@Override
	public int insertPost(Post post) {
		return postMap.insertPost(post);
	}

	@Override
	public int updatePost(Post post) {
		return postMap.updatePost(post);
	}

	@Override
	public int deleteUser(int postId) {
		return postMap.deleteUser(postId);
	}
}