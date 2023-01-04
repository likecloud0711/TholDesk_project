package com.work.sr.eapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.work.sr.eapp.dto.EappDto;


@Mapper
public interface EappDao {
	@Insert("insert into approval (approvedt, draftdt, empno, formno, opcont,  opsign1, opsign2, opstatus, optitle) values(#{approvedt}, #{draftdt}, #{empno}, #{formno}, #{opcont}, #{opsign1}, #{opsign2}, 0, #{optitle})")
	int insert(EappDto dto); //작성페이지
	
	@Select("select empno,empnm from employee")
	List<Map<String, Object>> signer(); //필요한 레코드가 두개니까 dto나 map으로 받아와야함. 

	@Select("select empno, empnm from employee where empno != #{empno}")
	List<Map<String, Object>> signer2(int empno);
	
	@Select("select * from approval natural join employee natural join team order by opno desc limit #{start}, #{count}")
	List<EappDto> list(Map<String, Object> map);
	
	@Select("select count(*) from approval")
	int count();
	
	@Select("select * from approval natural join employee natural join team where opno = #{opno}")
	EappDto listOne(int opno);
	
	@Update("update approval set optitle=#{optitle}, opcont=#{opcont} where opno=#{opno}")
	int updateEapp(EappDto dto);
	
	@Delete("delete from approval where opno = #{opno}")
	int delete(int opno);

	@Select("select * from approval  natural join employee natural join team  where (opsign1 =#{empno} and opstatus = 0 ) or (opsign2 =#{empno} and opstatus = 1 )")
	List<EappDto> signlist(int empno); // 결재처리 하는 페이지
	
	@Select("select * from approval natural join employee natural join team where opstatus = 2")
	List<EappDto> permission(); //승인
	
	@Select("select * from approval natural join employee natural join team where opstatus = 1")
	List<EappDto> waiting(); //대기

	@Select("select * from approval natural join employee natural join team where opstatus = 3")
	List<EappDto> reject(); //반려
	
	@Update("update approval set opstatus = #{opstatus} where opno = #{opno}")
	int signdone(Map<String, Integer> map);
	
	@Update("update approval set opstatus = 3 where opno = #{opno}")
	int returnsign(int opno);
	
	@Insert("insert into approval (approvedt, draftdt, empno, formno, opcont,  opsign1, opsign2, opstatus, optitle) values(#{approvedt}, #{draftdt}, #{empno}, #{formno}, #{opcont}, #{opsign1}, #{opsign2}, 4, #{optitle})")
	int outbox(EappDto dto); //임시저장 버튼 기능 

	@Select("select * from approval natural join employee natural join team where opstatus = 4")
	List<EappDto> outboxpage(); //임시저장페이지
	
	List<EappDto> EappSearch(Map<String, Object> m);
	int countSearch(Map<String, Object> m); //검색 글 갯수
	
	@Update("update approval set reject = #{reject} where opno = #{opno}")
	int rejectcont(EappDto dto); //반려사유 기입 페이지
	
	@Select("select empnm from employee where empno = (select opsign1 from approval where opno = #{opno})")
	String opsign1(int opno); //결재자1 구하기
	
	@Select("select empnm from employee where empno = (select opsign2 from approval where opno = #{opno})")
	String opsign2(int opno); //결재자1 구하기
}
