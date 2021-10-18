package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kwonchaerin.selfdevelopment.dao.map.ClassMap;
import kwonchaerin.selfdevelopment.domain.Class;

@Repository
public class ClassDaoImpl implements ClassDao {
	@Autowired private ClassMap classMap;
	
	@Override
	public List<Class> selectClasses() {
		return classMap.selectClasses();
	}
	
	@Override
	public Class selectClass(String clsId) {
		return classMap.selectClass(clsId);
	}
	
	@Override
	public int insertClass(Class cls) {
		return classMap.insertClass(cls);
	}
	
	@Override
	public int updateClass(Class cls) {
		return classMap.updateClass(cls);
	}
	
	@Override
	public int deleteClass(int clsId) {
		return classMap.deleteClass(clsId);
	}
}

