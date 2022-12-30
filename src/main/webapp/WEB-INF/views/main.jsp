<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/mainheader.css"/>
<meta charset="UTF-8">
<title>hello TDworks</title>

</head>
<body>
  <div align="right"><jsp:include page="./top.jsp" flush='false' /></div>
        <nav id="topmenu">
                <ul>
                        <li class="topmenuLi">
                        	<a class="menuLink" href="">게시판</a>
                        	<ul class="sub">
                        		<li><a class="submenu" href="">공지사항</a></li>
                        		<li><a class="submenu" href="">부서게시판</a></li>
                        		<li><a class="submenu" href="">자유게시판</a></li>
                        	</ul>	
                        </li>
                        <li class="topmenuLi">
                        	<a class="menuLink" href="/Eapp/eapproval">전자결재</a>
                        	<ul class="sub">
                        		<li><a class="submenu" href="/Eapp/signlist">결재처리목록</a></li>
                        		<li><a class="submenu" href="/Eapp/permission">승인문서</a></li>
                        		<li><a class="submenu" href="/Eapp/waiting">대기문서</a></li>
                        		<li><a class="submenu" href="/Eapp/reject">반려문서</a></li>
                        		<li><a class="submenu" href="/Eapp/outbox">임시보관함</a></li>
                        	</ul>
                        </li>
                        <li class="topmenuLi">
                        	<a class="menuLink" href="/Calendar/CldMain">캘린더</a>
                        </li>
                        <li class="topmenuLi">
                        	<a class="menuLink" href="">쪽지함</a>
                        </li>
                        <li class="topmenuLi">
                        	<a class="menuLink" href="">인사</a>
                        </li>   
                </ul>
        </nav>
      <hr>
     <div class="eapp" align="center">   
     <h4>전자결재</h4>
	<table>
			<tr>
				<th>문서번호</th>
				<th>양식명</th>
				<th>제목</th>
				<th>기안자</th>
				<th>기안부서</th>
				<th>기안일자</th>
				<th>상태</th>
			</tr>
		<c:forEach items="${list}" var="appo">
			
			<tr>
				<td><a href="content/${appo.opno}">${appo.opno}</a></td>

				<c:if test="${appo.formno == 1 }">
				<td>품의서</td>
				</c:if>
				<c:if test="${appo.formno == 2 }">
				<td>연차신청서</td>
				</c:if>
				<c:if test="${appo.formno == 3 }">
				<td>재택근무신청서</td>
				</c:if>
				<td><a href="content/${appo.opno}">${appo.optitle }</a></td>
				<td>${appo.empnm } ${appo.grade }</td>
				<td>${appo.teamnm }</td>
				<td>${appo.draftdt }</td>
				<c:if test="${appo.opstatus == 0}">
				<td>제출</td>
				</c:if>
				<c:if test="${appo.opstatus == 1}">
				<td>대기</td>
				</c:if>
				<c:if test="${appo.opstatus == 2}">
				<td>승인</td>
				</c:if>
				<c:if test="${appo.opstatus == 3}">
				<td>반려</td>
				</c:if>
				<c:if test="${appo.opstatus == 4}">
				<td>임시저장</td>
				</c:if>
			
			</tr>
		</c:forEach>
	</table>
		<div id="page">
			<c:if test="${begin > pageNum }">
			<a href="eapproval?p=${begin-1 }">[이전]</a>
			</c:if>
			<c:forEach begin="${begin }" end="${end }" var="i">
				<a href="eapproval?p=${i }">${i }</a>
			</c:forEach>
			<c:if test="${end < totalPages }">
			<a href="eapproval?p=${end+1 }">[다음]</a>
			</c:if>
			
	</div>
	<button type="button" onclick="location.href='/Eapp/eapproval'">더보기</button>
	<hr>
	</div>
	<div  style="border: 1px solid gold; float: right; width: 33%;" id='calendar'></div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
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

</body>
</html>
</body>
</html>