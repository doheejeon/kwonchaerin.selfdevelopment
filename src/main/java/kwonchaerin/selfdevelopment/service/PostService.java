package kwonchaerin.selfdevelopment.service;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Post;

public interface PostService {
	List<Post> getPosts();

	Post getPost(int postId);
	
	Post getHead(String pstHead);

	boolean addPost(Post post);

	boolean fixPost(Post post);

	boolean delPost(int postId);
}
