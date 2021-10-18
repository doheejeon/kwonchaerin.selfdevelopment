package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Post;

public interface PostDao {
	List<Post> selectPosts(); //게시판 목록 조회
	Post selectPost(int postId); //게시글 조회 
	Post selectHead(String pstHead); //헤더 조회
	
	int insertPost(Post post); //추가
	int updatePost(Post post); //수정 
	int deleteUser(int postId); //삭제
}