package kwonchaerin.selfdevelopment.service;

import java.util.List;

import kwonchaerin.selfdevelopment.domain.Class;

public interface ClassService {
	List<Class> getClasses();
	Class getClass(String clsId);
	
	boolean addClass(Class cls);
	boolean fixClass(Class cls);
	boolean delClass(int clsId);
}