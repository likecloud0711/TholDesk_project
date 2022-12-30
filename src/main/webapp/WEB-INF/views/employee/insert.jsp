<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!Doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<title>employee</title>
</head>
 <body>
 <jsp:include page="../top.jsp" flush='false' />
 <form name='frm' method='POST' action='/create' class="form-horizontal">
<div class="form-group">
      <label for="empno" class="col-md-2 control-label" style='font-size: 0.9em;'>아이디*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='empno' id='empno' value='' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
        <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 -->        
      </div>
    </div>   
                
    
    <div class="form-group">
      <label for="empnm" class="col-md-2 control-label" style='font-size: 0.9em;'>이름*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='empnm' id='empnm' 
                   value='' required="required" style='width: 30%;' placeholder="이름">
      </div>
    </div>   
 <div class="form-group">
      <label for="email" class="col-md-2 control-label" style='font-size: 0.9em;'>이메일</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='email' id='email' 
                   value='' required="required" style='width: 30%;' placeholder="이메일">
      </div>
    </div> 
    <div class="form-group">
      <label for="tel" class="col-md-2 control-label" style='font-size: 0.9em;'>전화번호*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='tel' id='tel' 
                   value='' required="required" style='width: 30%;' placeholder="전화번호"> 예) 010-0000-0000
      </div>
    </div>  
    <div class="form-group">
      <label for="pwd" class="col-md-2 control-label" style='font-size: 0.9em;'>패스워드*</label>    
      <div class="col-md-10">
        <input type='password' class="form-control" name='pwd' id='pwd' value='' required="required" style='width: 30%;' placeholder="패스워드">
      </div>
    </div>   
    <div class="form-group">
      <label for="adminyn" class="col-md-2 control-label" style='font-size: 0.9em;'>관리자</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='adminyn' id='adminyn' 
                   value='' required="required" style='width: 30%;' placeholder="관리자">
      </div>
    </div> 
   
    <div class="form-group">
      <label for="joindt" class="col-md-2 control-label" style='font-size: 0.9em;'>입사일</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='joindt' id='joindt' 
                   value='' required="required" style='width: 30%;' placeholder="입사일">
      </div>
    </div> 
    <div class="form-group">
      <label for="grade" class="col-md-2 control-label" style='font-size: 0.9em;'>직급</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='grade' id='grade' 
                   value='' required="required" style='width: 30%;' placeholder="직급">
      </div>
    </div>    
        <div class="form-group">
      <label for="teamno" class="col-md-2 control-label" style='font-size: 0.9em;'>부서번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='teamno' id='teamno' 
                   value='' required="required" style='width: 30%;' placeholder="부서번호">
      </div>
    </div> 
     <button type="submit" class="btn">등록</button>   
    </form>
   
    

 </body>
</html>