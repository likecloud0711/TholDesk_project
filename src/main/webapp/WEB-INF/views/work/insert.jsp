<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!Doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>work</title>
</head>
 <body>
 <jsp:include page="../top.jsp" flush='false' />
<strong>출근시간 : </strong><span class='start'>00:00</span><br>
<strong>퇴근시간 : </strong><span class='end'>00:00</span><br>
<span class='timer'>00:00:00</span>
<form name='frm' method='POST' action='/createWork' class="form-horizontal">
<input type="hidden" name="empno" id="empno" value="${sessionScope.empno }">
<button class='timer_st' type="submit">시작</button>
</form>
<form name='frm' method='POST' action='/updateWork' class="form-horizontal">
<input type="hidden" name="empno" id="empno" value="${sessionScope.empno }">
<button class='timer_ed' type="submit">종료</button>

</form>
 </body>
 <style>
 .hide {
 	display: none;
 }
 </style>
 <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
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

	return hh+":"+mm
}

var time=0;
var cn;
$('.timer_st').on('click', function() {
	send();
	var strt = getTime();
	$('.start').text(strt);
	console.log(strt);
	updateTimer();
	//stopBtn();
	cn = setInterval(updateTimer, 1000);
	//$('.timer').addClass('hide');
});

$('.timer_ed').on('click', function() {
	var ed = getTime();
	$('.end').text(ed);
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

function send() {
    $.ajax({
      url: '/createWork',
      type: 'post',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      success: function(rdata) { // 응답이 온경우
      },
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    });
  
 }
  
</script> 
</html>