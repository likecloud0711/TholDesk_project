<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top_img'>
    <DIV class='top_menu_label'><A href='/top'>GroupWare</A></DIV>
    <NAV class='top_menu'>
      
      <c:choose>
        <c:when test="${sessionScope.empno != null}"> <%-- 로그인 한 경우 --%>
           ${sessionScope.empnm}  
           <c:if test="${sessionScope.grade eq 100 }">사장</c:if>
           <c:if test="${sessionScope.grade eq 20 }">부장</c:if>
           <c:if test="${sessionScope.grade eq 30 }">과장</c:if>
           <c:if test="${sessionScope.grade eq 40 }">대리</c:if>
           <c:if test="${sessionScope.grade eq 50 }">사원</c:if>
           (<span>${sessionScope.empno }</span>)
           <A href='/logout' >Logout</A><span class='top_menu_sep'> </span>
      <c:if test="${sessionScope.admin eq 'Y' }">     
      	<A href='/emp/insertView'>직원 등록</A><span class='top_menu_sep'> </span>
      </c:if>
      <A href='/emp/orgChart'>조직도</A><span class='top_menu_sep'> </span>
      <A href='/vacation/insert'>휴가 신청</A><span class='top_menu_sep'> </span>
      <A href='/vacation/list'>휴가 목록</A><span class='top_menu_sep'> </span>
      <A href='/vacation/signer'>결재 목록</A><span class='top_menu_sep'> </span>
      <A href='/work/insertView'>근태</A><span class='top_menu_sep'> </span>
      <A href='/Calendar/CldMain'>캘린더</A><span class='top_menu_sep'> </span>
      <A href='/Eapp/eapproval'>전자결재</A><span class='top_menu_sep'> </span>
      <A href='/ks/board'>게시판</A><span class='top_menu_sep'> </span>
        </c:when>
        <c:otherwise>
          <A href='/loginView' >Login</A><span class='top_menu_sep'> </span>
        </c:otherwise>
      </c:choose>    
      
    </NAV>
  </DIV>