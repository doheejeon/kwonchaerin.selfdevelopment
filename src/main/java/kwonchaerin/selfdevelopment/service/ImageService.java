package kwonchaerin.selfdevelopment.service;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Image;

public interface ImageService {
	List<Image> getImages();
	Image getImage(int imageId);
	
	boolean addImage(Image image);
	boolean fixClass(Image image);
	boolean delClass(int imageId);

}
