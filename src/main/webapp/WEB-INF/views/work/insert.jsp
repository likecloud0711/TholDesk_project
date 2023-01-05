<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>work</title>
</head>
 <body>
 <jsp:include page="../top.jsp" flush='false' />
 <c:set var="gowork" value="${workDto.gowork }"/>
  <c:set var="leavework" value="${workDto.leavework }"/>
  <c:choose>
 <c:when test="${workDto.gowork != null}">
 <strong>출근시간 </strong><span class='start'>${fn:substring(gowork, 11, 19)} </span><br>
 </c:when>
 <c:otherwise>
<strong>출근시간 </strong><span class='start'>00:00</span><br>
</c:otherwise>
</c:choose>
<c:choose>
 <c:when test="${workDto.leavework != null}">
<strong>퇴근시간 </strong><span class='end'>${fn:substring(leavework, 11, 19)}</span><br>
</c:when>
<c:otherwise>
<strong>퇴근시간 </strong><span class='end'>00:00</span><br>
</c:otherwise>
</c:choose>

<form name='frm' method='POST' action='/createWork' class="form-horizontal">
<input type="hidden" name="empno" id="empno" value="${sessionScope.empno }">
<button class='timer_st' type="submit">시작</button>
</form>
<form name='frm' method='POST' action='/updateWork' class="form-horizontal">
<input type="hidden" name="empno" id="empno" value="${sessionScope.empno }">
<button class='timer_ed' type="submit">종료</button>

</form>
<br><hr><br>
<TABLE class='table table-striped' style="border:1px solid black;margin-left:;margin-right:;">
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>  
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs" style='width: 10%;'>번호</TH>
       <TH class="th_bs" style='width: 10%;'>출근시간</TH>
       <TH class="th_bs" style='width: 10%;'>퇴근시간</TH>
       <TH class="th_bs" style='width: 10%;'>상태</TH>
       <TH class="th_bs" style='width: 10%;'>이름</TH>
     <!--  <TH class="th_bs">휴가시작일</TH>
      <TH class="th_bs">출력 모드</TH>
      <TH class="th_bs">기타</TH> -->
    </TR>
    </thead>
<tbody>
  <TR>
    <c:forEach var="WorkDto" items="${list}">
      <c:set var="workno" value="${WorkDto.workno}" />
      <TD class="td_bs" style="text-align:center">${WorkDto.workno}</TD>
      <TD class="td_bs_left" style="text-align:center">${WorkDto.gowork }</TD>
      <TD class="td_bs_left" style="text-align:center"><c:if test="${WorkDto.leavework != null }">${WorkDto.leavework }</c:if></TD>
        <TD class="td_bs_left" style="text-align:center">
        <c:if test="${WorkDto.status eq 2}">근무중</c:if>
        <c:if test="${WorkDto.status eq 3}">퇴근</c:if>
        </TD>
        <TD class="td_bs_left" style="text-align:center">${sessionScope.empnm }</TD>
	
	</TR>
	</c:forEach>
	</tbody>
	</TABLE>
 </body>
 <style>
 .hide {
 	display: none;
 }
 </style>
 <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
var time=0;

function getDate() {
	var date = new Date();
	var yy = date.getFullYear();
	var mm = ("0" + (1+date.getMonth())).slice(-2);
	var dd = ("0" + date.getDate()).slice(-2);

	return yy+mm+dd
}

function getTime() {
	var tm = new Date();
	var hh = ("0"+tm.getHours()).slice(-2);
	var mm = ("0"+tm.getMinutes()).slice(-2);
	var ss= ("0"+tm.getSeconds()).slice(-2);
	return hh+mm+ss
}


var cn;
$('.timer_st').on('click', function() {
	var strt = getTime();
	//$('.start').text(strt);
	updateTimer();
	//stopBtn();
	cn = setInterval(updateTimer, 1000);
	//$('.timer').addClass('hide');
});

$('.timer_ed').on('click', function() {
	var ed = getTime();
	//$('.end').text(ed);
	clearInterval(cn);
	//$('.timer').addClass('hide');
});

function updateTimer() {
	const hours = Math.floor(time/3600);
	const minute = Math.floor(time/60);
	const seconds = time% 60;
	const mm = minute % 60;
	var hh;
	var mmm;
	var ss;
	if(hours < 10) {
		hh='0'+hours;
	} else {
		hh=hours;
	}
	if(mm < 10) {
		mmm='0'+mm;
	}else {
		mmm=mm;
	}
	if(seconds < 10) {
		ss='0'+seconds;
	} else {
		ss=seconds;
	}
	
	var tt = hh+':'+mmm+':'+ss;
	$('.timer').text(tt);
	time++;
}

</script> 
</html>