package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Image;

public interface ImageDao {
	List<Image> selectImages();
	Image selectImage(int imageId);
	
	int insertImage(Image image);
	int updateImage(Image image);	
	int deleteImage(int imageId);
}