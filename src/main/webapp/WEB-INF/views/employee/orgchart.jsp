<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.work.employee.EmployeeDto" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Org Chart</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" user-scalable=no>
  <meta name="format-detection" content="telephone=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="../css/orgchart.css">
  <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<jsp:include page="../top.jsp" flush='false' />
    <div class="system">
        <ul>
        <c:forEach var="empDto" items="${list}">
        <c:set var="empno" value="${empDto.empno }" />
          <a href="/emp/updateView?empno=${empDto.empno }"><li><p><b>${empDto.empnm }</b></p></li></a>
            <!-- <ul>
              <li><p><b>금융소비자보호총괄책임자<em>(CCO : Chief Consumer Officer)</em></b></p></li>
              <li><span><b>금융소비자보호협의회<em>(CCO를 포함한 금융소비자보호 최고의결기가)</em></b></span></li>
              <li><p><b>소비자 보호파트</b></p></li>
                  <ul class="depth3">
                     <li>
                       <strong>소비자제도 기획</strong>
                        <div>
                           소비자 보호 관련 업무기획<br>
                           상품개발 및 판매 시 사전협의 및 모니터링 <br>
                           민원분석을 통한 제도 개선
                        </div>
                     </li>
                     <li>
                       <strong>VOC 및 민원 업무</strong>
                        <div>
                           고객의 소리 접수 및 처리<br>
                           대내외 민원 접수 및 처리 <br>
                           보이스피싱 피해 등 소비자 피해 보상의<br>
                           접수 및 처리
                        </div>
                     </li>
                     <li>
                       <strong>피해 예방 모니터링</strong>
                        <div>
                           보이스피싱 및 해킹에 의한<br>
                           이상금융거래 등 소비자피해 <br>
                           예방을 위한 모니터링 및 조치
                        </div>
                     </li>
                  </ul>
            </ul> -->
           </li>
           </c:forEach>
       </ul>
    </div>



</body>
</html>