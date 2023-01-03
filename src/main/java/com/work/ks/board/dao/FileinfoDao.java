package com.work.ks.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.work.ks.board.dto.FileinfoDto;



@Mapper// 삭제해도 될듯
public interface FileinfoDao { 
	
	
	@Insert("insert into fileinfo (name, path, filesize, description ) values (#{name}, #{path}, #{filesize},#{description})")
	int insertFile(FileinfoDto file);
	
	@Select("select * from fileinfo")
	List<FileinfoDto>  fileList();
	
	@Select("select * from fileinfo where fileid = #{fileid}")
	FileinfoDto fileOne(int fileid);


}
