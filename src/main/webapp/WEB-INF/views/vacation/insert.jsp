<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!Doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<title>vacation</title>
</head>
<style>
input:read-only {
    color: #808080;
}
</style>
 <body>
 <jsp:include page="../top.jsp" flush='false' />
 <form name='frm' method='POST' action='/vacCreate' class="form-horizontal">
<div >
      <label for="empno" class="col-md-2 control-label" style='font-size: 0.9em;'>사번</label>    
      <div class="col-md-10">
        <input readonly type='text' class="form-control" name='empno' id='empno' value='${sessionScope.empno }' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
        <SPAN id='id_span'></SPAN>
      </div>
    </div>   
         
    
    <div >
    <label for="signer1" class="col-md-2 control-label" style='font-size: 0.9em;'>결재자1</label> 
      <select name="signer1">
      	<option value="">결재자1</option>
      	<c:forEach var="empDto" items="${list}">
        <c:set var="empno" value="${empDto.empno }" />
      	<option value="${empDto.empno }">${empDto.empnm }</option>
      	</c:forEach>
      </select>    
     
    </div>   
 <div > 
 <label for="signer1" class="col-md-2 control-label" style='font-size: 0.9em;'>결재자2</label> 
       <select name="signer2">
      	<option value="">결재자2</option>
      	<c:forEach var="empDto" items="${list}">
        <c:set var="empno" value="${empDto.empno }" />
      	<option value="${empDto.empno }">${empDto.empnm }</option>
      	</c:forEach>
      </select>   
    </div> 
    <div >    
      <div class="col-md-10">
        <input type='hidden' class="form-control" name='status' id='status' 
                   value='1' required="required" style='width: 30%;' placeholder="근무상태">
      </div>
    </div>  
    
    <div >
      <label for="vacstart" class="col-md-2 control-label" style='font-size: 0.9em;'>휴가시작일</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='vacstart' id='vacstart' 
                   value='' required="required" style='width: 30%;' placeholder="휴가시작일">
      </div>
    </div>    
    <div >
      <label for="vacend" class="col-md-2 control-label" style='font-size: 0.9em;'>휴가종료일</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='vacend' id='vacend' 
                   value='' required="required" style='width: 30%;' placeholder="휴가종료일">
      </div>
    </div> 
    <div >
      <label for="vacdate" class="col-md-2 control-label" style='font-size: 0.9em;'>휴가일수</label>    
      <div class="col-md-10">
        <input readonly type='text' class="form-control" name='vacdate' id='vacdate' 
                   value='' required="required" style='width: 30%;' placeholder="휴가일수">
      </div>
    </div> 
   
    <div >
  
      <div class="col-md-10">
        <input type='hidden' class="form-control" name='vacstatus' id='vacstatus' 
                   value='1' required="required" style='width: 30%;' placeholder="휴가신청상태">
      </div>
    </div> 
    <div >
      <label for="vacleft" class="col-md-2 control-label" style='font-size: 0.9em;'>남은휴가</label>    
      <div class="col-md-10">
        <input readonly type='text' class="form-control" name='vacleft' id='vacleft' 
                   value='12' required="required" style='width: 30%;' placeholder="남은휴가">
      </div>
    </div> 
     <button type="submit" class="btn">등록</button>   
    </form>
   
    

 </body>
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
var left = $('#vacleft').val();

var delayEvt = (function() {
	var timer=0;
	return function(callback, ms) {
		clearTimeout(timer);
		timer = setTimeout(callback, ms);
	}
})();

/* $('#vacend').on('input', setTimeout(function() {
	var start = $('#vacstart').val();
	var end = $('#vacend').val();
	var date = 0;
	
	date = Number(end) - Number(start);
	$("#vacdate").val(date);
	$("#vacleft").val(12-date);
}), 2000);
 */
$('#vacend').keyup(function() {
	delayEvt(function() {
		var start = $('#vacstart').val();
		var end = $('#vacend').val();
		var date = 0;
		
		date = Number(end) - Number(start);
		$("#vacdate").val(date);
		$("#vacleft").val(12-date);
	}, 1500);
});
 
</script>
</html>