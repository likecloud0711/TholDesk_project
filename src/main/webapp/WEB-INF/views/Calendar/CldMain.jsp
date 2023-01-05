<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
button {width: 100px;}
#teamSch {width: 100px;}

</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.js"></script>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 페이징 기능 꾸미기 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<!-- 게시글 작성버튼 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>캘린더 메인</title>
</head>
<body>
<div id='calendar'></div>
<button class="add-button" type="button" onclick="click_add();">일정추가</button>
<a href="/logout"><button id="teamSch">로그아웃</button></a>

<input type=button id="teamSch" value="부서일정" onclick="location.href='/Calendar/TeamSch/${teamno}'">
<a href="/Calendar/CldMain"><button id="teamSch">전체일정</button></a>
<div>로그인부서 : ${teamno }</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		expandRows : true,
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		headerToolbar : { // 헤더에 표시할 툴 바
			start : 'prev next today',
			center : 'title',
			end : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		titleFormat : function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},
		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		navLinks : true, //날짜 선택시 Day캘린더나 week 캘린더로 링크 
		selectable : true, // 달력 일자 드래그 설정가능
		droppable : true,
		editable : true,
		events : [
			<c:if test="${dto != null}">
            <c:forEach items="${dto}" var ="vo">
            {
               title : '${vo.calname}',
                start : '${vo.stdt}',
                end : '${vo.eddt}',
                color : '#' + Math.round(Math.random() * 0xffffff).toString(16),
                groupId : '${vo.teamno}',
                id : '${vo.calno}'
             },
   			</c:forEach>
		</c:if>
		],
		eventClick : function(info){ //삭제나 만들어부리자 
			
			function leftPad(value) {
			    if (value >= 10) {
			        return value;
			    }
			    return '0' + value;
			}
			
			function toStringByFormatting(source, delimiter = '-') {
			    const year = source.getFullYear();
			    const month = leftPad(source.getMonth() + 1);
			    const day = leftPad(source.getDate());    

			    return [year, month, day].join(delimiter);
			}   
			
			if(info.event.groupId == ${teamno}){
				
			if(confirm(info.event.title +' - 삭제 하시겠습니까?')){
				$.ajax({
					type:"delete",
					url: "/Calendar/CalDelte",
					data: {
						'calname' : info.event.title,
						'stdt' : toStringByFormatting(info.event.start)
					},
					success: function(response){
						window.location.reload()
					}
				})
			}
			}else{alert("삭제 권한이 없습니다.")}
		}
		, nowIndicator: true, // 현재 시간 마크
		locale: 'ko' // 한국어 설정
		, eventDrop : function(info){
			
			function leftPad(value) {
			    if (value >= 10) {
			        return value;
			    }
			    return '0' + value;
			}
			
			function toStringByFormatting(source, delimiter = '-') {
			    const year = source.getFullYear();
			    const month = leftPad(source.getMonth() + 1);
			    const day = leftPad(source.getDate());    

			    return [year, month, day].join(delimiter);
			}   
			
			
			console.log(info.event.end)
			if(confirm("수정하시겠습니까?")){ 
				$.ajax({
					type: "post",
					url:"/Calendar/updateSch/",
					data: {
						'calno' : info.event.id,
						'stdt' : toStringByFormatting(info.event.start),
						'eddt' : toStringByFormatting(info.event.end)
					}
				}).done(function(response){
				window.location.reload()
				})
			}else{
				info.revert();
			}
		},
		/* eventResize : function(info){
			if(confirm("수정하시겠습니까?")){
				var mag = updateFunc(info);
				alert(msg);
			}else{
				info.revert();
			}
		} */
	});
	calendar.render();
});

	function click_add(){
		var url = "CalPopup";
		var name = "CalPopup";
		var option = "width = 600, height = 600, left = 100, top = 50, location=no";
		window.open(url, name, option)
	};
</script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>