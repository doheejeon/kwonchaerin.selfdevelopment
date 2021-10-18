package kwonchaerin.selfdevelopment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kwonchaerin.selfdevelopment.dao.ImageDao;
import kwonchaerin.selfdevelopment.domain.Image;

@Service
public class ImageServiceImpl implements ImageService{
	@Autowired private ImageDao imageDao;

	@Override
	public List<Image> getImages() {
		return imageDao.selectImages();
	}

	@Override
	public Image getImage(int imageId) {
		return imageDao.selectImage(imageId);
	}

	@Override
	public boolean addImage(Image image) {
		return imageDao.insertImage(image) > 0;
	}

	@Override
	public boolean fixClass(Image image) {
		return imageDao.updateImage(image) > 0;
	}

	@Override
	public boolean delClass(int imageId) {
		return imageDao.deleteImage(imageId) > 0;
	}


}
