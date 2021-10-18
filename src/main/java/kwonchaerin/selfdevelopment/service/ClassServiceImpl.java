package kwonchaerin.selfdevelopment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kwonchaerin.selfdevelopment.dao.ClassDao;
import kwonchaerin.selfdevelopment.domain.Class;

@Service
public class ClassServiceImpl implements ClassService{
	@Autowired private ClassDao classDao;
	
	@Override
	public List<Class> getClasses() {
		return classDao.selectClasses();
	}
	
	@Override
	public Class getClass(String clsId) {
		return classDao.selectClass(clsId);
	}

	@Override
	public boolean addClass(Class cls) {
		return classDao.updateClass(cls) > 0;
	}
	
	@Override
	public boolean fixClass(Class cls) {
		return classDao.updateClass(cls) > 0;
	}
	
	@Override
	public boolean delClass(int clsId) {
		return classDao.deleteClass(clsId) > 0;
	}
}