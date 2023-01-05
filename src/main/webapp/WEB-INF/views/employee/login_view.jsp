<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<title>login</title>
<!-- <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!--<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>-->

</head>
<body>
<jsp:include page="../top.jsp" flush='false' />
<form name='frm' method='POST' action='/pwdChk'>
<div >
      <label for="empno"style='font-size: 0.9em;'>아이디</label>    
      <div class="col-md-10">
        <input type='text'name='empno' id='empno' value='${ck_id }' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
          <Label>   
            <input type='checkbox' name='id_save' value='Y' 
                      ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>  
      </div>
    </div>   
                
    
    <div>
      <label for="pwd"style='font-size: 0.9em;'>비밀번호</label>    
      <div class="col-md-10">
        <input type='password'name='pwd' id='pwd' 
                   value='${ck_passwd }' required="required" style='width: 30%;' placeholder="비밀번호">
     <Label>
            <input type='checkbox' name='passwd_save' value='Y' 
                      ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>
      </div>
    </div> 
     <button type="submit" class="btn" id="btn_check">로그인</button>
     </form>
</body>

</html>