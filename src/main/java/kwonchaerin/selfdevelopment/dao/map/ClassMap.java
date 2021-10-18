package kwonchaerin.selfdevelopment.dao.map;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Class;

public interface ClassMap {
	List<Class> selectClasses();
	Class selectClass(String clsId);
	
	int insertClass(Class cls);
	int updateClass(Class cls);
	int deleteClass(int clsId);
}