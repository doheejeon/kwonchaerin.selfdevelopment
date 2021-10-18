package kwonchaerin.selfdevelopment.dao.map;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Image;

public interface ImageMap {
	List<Image> selectImages();
	Image selectImage(int imageId);
	
	int insertImage(Image image);
	int updateImage(Image image);	
	int deleteImage(int imageId);
}