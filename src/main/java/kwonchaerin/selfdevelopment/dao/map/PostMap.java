package kwonchaerin.selfdevelopment.dao.map;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Post;

public interface PostMap {
	List<Post> selectPosts();
	Post selectPost(int postId);
	Post selectHead(String pstHead);
	
	int insertPost(Post post);
	int updatePost(Post post);
	int deleteUser(int postId);
}