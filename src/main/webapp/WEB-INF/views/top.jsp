<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top_img'>
    <DIV class='top_menu_label'>GroupWare</DIV>
    <NAV class='top_menu'>
      
      <c:choose>
        <c:when test="${sessionScope.empno != null}"> <%-- 로그인 한 경우 --%>
           ${sessionScope.empno } <A class='menu_link'  href='/logout' >Logout</A><span class='top_menu_sep'> </span>
        </c:when>
        <c:otherwise>
          <A class='menu_link'  href='/loginView' >Login</A><span class='top_menu_sep'> </span>
        </c:otherwise>
      </c:choose>    
      
      <A class='menu_link'  href='/insert'>직원 등록</A><span class='top_menu_sep'> </span>
          
          <A href="./Calendar/CldMain">cal</A>
          <a href="./Eapp/eapproval">전자결재</a>
    </NAV>
  </DIV>
  