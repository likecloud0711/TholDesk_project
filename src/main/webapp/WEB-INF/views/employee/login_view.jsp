<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="css/login.css">
<title>login</title>
<!-- <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">


</script>
</head>
<body>
<div class="login_background">
<span style="margin-left: 565px;">
<img alt="Carbs" src="./img/Vector.png" style="margin-top: 80px;">
<i class="thol_desk" style="font-size:60px;">Tholdesk</i>
</span>
<div class="login_prf">
		<span class="material-symbols-outlined" style="font-size: 150px; margin-left: 7.5px">
person
</span>
</div>
<%-- <jsp:include page="../top.jsp" flush='false' /> --%>

<div class="rect">
<form name='frm' method='POST' action='/pwdChk' class="form-horizontal">

<div class="id_loc">
<!-- 건희 -->
<input type='text' class="id_rect" style="font-size: 15pt; border:0 solid black;" name='empno' id='empno' value='${ck_id }' 
required="required" placeholder="사원번호를 입력하세요" autofocus="autofocus">
</div>

<!-- 저장버튼ID -->
<Label class="save1">
<input type='checkbox' name='id_save' value='Y' 
                      ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
</Label>

<div class="pwd_loc">
<!-- 건희 -->
<input type='password' class="id_rect" style="font-size: 15pt; border:0 solid black;" name='pwd' id='pwd' value='${ck_passwd }' 
required="required" placeholder="비밀번호를 입력하세요">
</div>
<!-- 저장버튼PWD -->
<Label class="save2">
<input type='checkbox' name='id_save' value='Y' 
                      ${ck_id_save == 'Y' ? "checked='checked'" : "" }>저장
</Label>
<%-- <div class="form-group" >
      <label for="empno" class="col-md-2 control-label" style='font-size: 0.9em;'>아이디</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='empno' id='empno' value='${ck_id }' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
          <Label>   
            <input type='checkbox' name='id_save' value='Y' 
                      ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>  
      </div>
    </div>   --%> 
 
    
<%--     <div class="form-group">
      <label for="pwd" class="col-md-2 control-label" style='font-size: 0.9em;'>비밀번호</label>    
      <div class="col-md-10">
        <input type='password' class="form-control" name='pwd' id='pwd' 
                   value='${ck_passwd }' required="required" style='width: 30%;' placeholder="비밀번호">
     <Label>
            <input type='checkbox' name='passwd_save' value='Y' 
                      ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>
      </div>
    </div>  --%>
     <button type="submit" class="login_btn login_btn3" id="btn_check">
     <span class="material-symbols-outlined" style="font-size:50px;">
		exit_to_app
	</span>
	</button>
     
     
     </form>
     </div> <!-- lect -->
</div>    
</body>
</html>