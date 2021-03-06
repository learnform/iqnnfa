package cn.iqnnfa.dao;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.iqnnfa.model.DrMember;


@Mapper
public interface IndexDAO {
	@Select("select * from dr_member where uid =#{id}")
	public DrMember findMemberByUid(Integer id);
	
	@Insert("update dr_member set mobilephone = '1388888888' where uid=#{uid}")
	public void insertMember(Integer id);
}
