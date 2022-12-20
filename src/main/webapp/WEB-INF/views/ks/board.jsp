<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<head>
  <title>title</title>
  <!-- Bootstrap cdn 설정 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"><!-- 페이징 기능 꾸미기 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"> <!-- 게시글 작성버튼 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Board</h1>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th class="text-center" width="150">글번호</th>
							<th class="text-center" >제목</th>
							<th class="text-center" width="200">작성자</th>
							<th class="text-center" width="250">작성일</th>
							<th class="text-center" width="150">조회수</th>
						</tr>
					</thead>
               <tbody>
               <c:forEach items="${blist}" var="dto">
                <!-- 저장할 dto라는 변수를 새로 만들어준거임 list는 하나하나 뽑아주는 역할. -->
                <!-- 뽑아주는 역할과, 저장하는 역할 -->
                                <tr>
                                    <td class="text-center hidden-sm hidden-xs">
                                    	<c:out value="${dto.boardno }" /></td>
                                   <td><a href="/ks/board/${dto.boardno}" >
                                   		<c:out value="${dto.boardtitle}" /></a></td>
                                    <td class="text-center">
                                    	<c:out value="${dto.empno }" /></td>
                                    <td class="text-center hidden-sm hidden-xs  ">
                                        <c:out value="${dto.boarddate }" /></td>
                                    <td class="text-center hidden-sm hidden-xs">
                                    	<c:out value="${dto.readcount}" /></td>
                                   
                                </tr>
                </c:forEach>                
                </tbody>
				</table>
			</div>
			
			<!-- 페이징 부분 -->
<ul class="pagination">
    <li>
    	<c:if test="${begin > pageNum }">
      <a href="board?p=${begin-1}" class="page prv"></a>
      </c:if>
      <span>«</span>
		</li>	
			<li>
				<c:forEach begin="${begin }" end="${end }" var="i">
					<a href="board?p=${i}">${i}</a>
				</c:forEach>
			<li>
  	<li>
  		<c:if test="${end < totalPages }">
	<a href="board?p=${end+1 }" class="page next"></a>
	</c:if>
	<span>»</span>
	</div>
	</li>
</ul>
		<!-- !페이징 부분 --> 
		
			<div align="right">
				<button
					style="margin-right: 0.5em; text-align: right; height: 40px;"
					class="btn mb-1 btn-warning btn-sm" type="button"
					onclick="location.href='/ks/write'">게시글 작성</button>
			</div>
		</div>
	</div>
</div>

<!-- /.container-fluid -->
