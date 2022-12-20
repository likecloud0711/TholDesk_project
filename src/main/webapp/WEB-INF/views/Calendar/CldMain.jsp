<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/locales-all.js"></script>
<title>캘린더 메인</title>
</head>
<body>

<div id='calendar'></div>
<button class="add-button" type="button" onclick="click_add();">일정추가</button>

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
                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
             },
   			</c:forEach>
		</c:if>
		],
		nowIndicator: true, // 현재 시간 마크
		locale: 'ko' // 한국어 설정
	});
	calendar.render();
});

	function click_add(){
		var url = "CalPopup";
		var name = "CalPopup";
		var option = "width = 600, height = 600, left = 100, top = 50, location=no";
		window.open(url, name, option)
	};
	
	$(function(){
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			showOtherMonths : true,
			showMonthAfterYear : true,
			changeYear : true,
			changeMonth : true,
		yearSuffic : "년",
		monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin : ['일','월','화','수','목','금','토'],
		dayNames : ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
		});
		$("#startDate").datepicker();
		$("#endDate").datepicker();
		
		$("#startDate").datepicker('satDate','today');
		$("#endDate").datepicker('satDate','today');
		
	})
</script>
</body>
</html>