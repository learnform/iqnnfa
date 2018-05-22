package cn.iqnnfa.service;

import cn.iqnnfa.model.DrMember;

public interface IndexService {
	DrMember findMemberByUid(Integer id);
	
	void addDocument() throws Exception;

	void queryDocument() throws Exception;
	
	void insertMember(Integer id);

	void executortask(Integer i);
	
	public void excutortaskAgain(Integer i);
}
