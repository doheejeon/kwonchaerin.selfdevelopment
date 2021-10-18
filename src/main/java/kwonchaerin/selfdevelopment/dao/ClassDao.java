package kwonchaerin.selfdevelopment.dao;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Class;

public interface ClassDao {
	List<Class> selectClasses();
	Class selectClass(String clsId);
	
	int insertClass(Class cls);
	int updateClass(Class cls);
	int deleteClass(int clsId);
}