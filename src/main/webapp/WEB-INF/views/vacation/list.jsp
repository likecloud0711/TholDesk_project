<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.work.vacation.VacationDto" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>vacation</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" user-scalable=no>
  <meta name="format-detection" content="telephone=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="../css/orgchart.css">
  <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<jsp:include page="../top.jsp" flush='false' />

  <TABLE class='table table-striped' style="border:1px solid black;margin-left:auto;margin-right:auto;">
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>  
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs" style='width: 10%;'>신청번호</TH>
      <TH class="th_bs" style='width: 10%;'>신청자</TH>
       <TH class="th_bs" style='width: 10%;'>휴가시작일</TH>
       <TH class="th_bs" style='width: 10%;'>휴가종료일</TH>
       <TH class="th_bs" style='width: 10%;'>휴가일수</TH>
       <TH class="th_bs" style='width: 10%;'>결재자1</TH>
       <TH class="th_bs" style='width: 10%;'>결재자2</TH>
       <TH class="th_bs" style='width: 10%;'>신청 상태</TH>
     <!--  <TH class="th_bs">휴가시작일</TH>
      <TH class="th_bs">출력 모드</TH>
      <TH class="th_bs">기타</TH> -->
    </TR>
    </thead>
    
    <tbody>
  <TR>
    <c:forEach var="VacationDto" items="${list}">
      <c:set var="vacationno" value="${VacationDto.vacno }" />
     
      <TD class="td_bs" style="text-align:center">${VacationDto.vacno }</TD>
      <TD class="td_bs" style="text-align:center">${VacationDto.empnm }</TD>
        <TD class="td_bs" style="text-align:center">${VacationDto.vacstart }</TD>
        <TD class="td_bs_left" style="text-align:center">${VacationDto.vacend }</TD>
        
        <TD class="td_bs_left" style="text-align:center">${VacationDto.vacdate } 일</TD>
        <TD class="td_bs_left" style="text-align:center">${VacationDto.signer1name }</TD>
        <TD class="td_bs_left" style="text-align:center">${VacationDto.signer2name }</TD>
          <TD class="td_bs_left" style="text-align:center">
        <c:if test="${VacationDto.vacstatus eq 1}">
        	<c:out value="대기"></c:out>
        </c:if>
        <c:if test="${VacationDto.vacstatus eq 2}">
        	<c:out value="반려"></c:out>
        </c:if>
        <c:if test="${VacationDto.vacstatus eq 3}">
        	<c:out value="승인"></c:out>
        </c:if>
        </TD>
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

</body>
</html>