package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kwonchaerin.selfdevelopment.dao.map.ImageMap;
import kwonchaerin.selfdevelopment.domain.Image;

@Repository
public class ImageDaoImpl implements ImageDao {
	@Autowired private ImageMap imageMap;

	@Override
	public List<Image> selectImages() {
		return imageMap.selectImages();
	}

	@Override
	public Image selectImage(int imageId) {
		return imageMap.selectImage(imageId);
	}

	@Override
	public int insertImage(Image image) {
		return imageMap.insertImage(image);
	}

	@Override
	public int updateImage(Image image) {
		return imageMap.updateImage(image);
	}

	@Override
	public int deleteImage(int imageId) {
		return imageMap.deleteImage(imageId);
	}

}