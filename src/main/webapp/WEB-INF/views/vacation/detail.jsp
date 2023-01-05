<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!Doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<title>vacation</title>
</head>
 <body>
 <jsp:include page="../top.jsp" flush='false' />
<div class="form-group">
      <label for="empno" class="col-md-2 control-label" style='font-size: 0.9em;'>신청자</label>    
      <div class="col-md-10">
       <input disabled type="text" value="${vacDto.empnm}" />
      </div>
    </div>   
         
    
    <div class="form-group">
      <label for="signer1" class="col-md-2 control-label" style='font-size: 0.9em;'>결재자1</label>    
      <div class="col-md-10">
       <input disabled type="text" value="${vacDto.signer1name}" />
      </div>
    </div>   
 <div class="form-group">
      <label for="signer2" class="col-md-2 control-label" style='font-size: 0.9em;'>결재자2</label>    
      <div class="col-md-10">
       <input disabled type="text" value="${vacDto.signer2name}" />
      </div>
    </div> 
    
    
   <div class="form-group">
      <label for="vacstart" class="col-md-2 control-label" style='font-size: 0.9em;'>휴가시작일</label>    
      <div class="col-md-10">
       <input disabled type="text" value="${vacDto.vacstart}" />
      </div>
    </div>  
    <div class="form-group">
      <label for="vacend" class="col-md-2 control-label" style='font-size: 0.9em;'>휴가종료일</label>    
      <div class="col-md-10">
        <input disabled type="text" value="${vacDto.vacend}" />
      </div>
    </div> 
      <div class="form-group">
      <label for="vacdate" class="col-md-2 control-label" style='font-size: 0.9em;'>휴가일수</label>    
      <div class="col-md-10">
        <input disabled type="text" value="${vacDto.vacdate}" />
      </div>
    </div> 
        <div class="form-group">
      <label for="vacstatus" class="col-md-2 control-label" style='font-size: 0.9em;'>휴가신청상태</label>    
      <div class="col-md-10">
       <c:if test="${vacDto.vacstatus eq 1}">
        	<c:out value="대기"></c:out>
        </c:if>
        <c:if test="${vacDto.vacstatus eq 2}">
        	<c:out value="반려"></c:out>
        </c:if>
        <c:if test="${vacDto.vacstatus eq 3}">
        	<c:out value="승인"></c:out>
        </c:if>
      </div>
    </div> 
    <form name='form' method='POST' action='/injectVac?vacno=${vacDto.vacno}' class="form-horizontal">
     <button type='submit' class='btn'>반려</button>
    </form>
    <form name='form' method='POST' action='/approveVac?vacno=${vacDto.vacno}' class="form-horizontal">
     <button type='submit' class='btn'>승인</button>
    </form>
   
    

 </body>
</html>