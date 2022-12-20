<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--    <link rel="stylesheet" href="/css/bootstrap.css"> -->
</head>
<body>

<div>
	<div id="comm">
	<c:forEach items="${cList}" var="comm">
		<div>${comm.empno} / ${comm.replydate }</div>
		<div>${comm.replycont} 
		<c:if test="${comm.empno == user.empno }">
		<button class="dbtn" id="${comm.replyno}">삭제</button>
		</c:if>
		</div>
		<hr>
	</c:forEach>
	</div>
	<input name="content" id="replycont"><button id="add">등록</button>
</div>




<!-- <div class="container">
    <form id="commentForm" name="commentForm" method="get">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
            <table class="table">                    
               <tr>
                   <td>
    <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
                      <br>
                    <div>
                <button id="add" class="btn pull-right btn-success">등록</button>
               
                    </div>
                    
                   </td>
              </tr>
            </table>
            </div>
        </div>
      <input type="hidden" id="b_code" name="b_code" value="${comm.content}" /> 
    </form>
</div>
 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#add").click(function(){
			let id = '${user.id}'; // 세션에 저장된 id값을 가져옴
			let content = $("#replycont").val();
			let no = ${dto.boardno};
						
			$.ajax({url:"/comm/insert",
					data:"boardno="+no+"&empno="+101+"&replycont="+content,
					method:"get",
					dataType:"json"
			}).done(function(resp){
					console.log(resp);
					let clist = "";
					resp.forEach(function(comm,index){
						clist += "<div>"+comm.empno+" / "+new Date(comm.replydate).toLocaleDateString() 
						+"</div><div>"+comm.replycont;
						if(101 == comm.empno){
							clist +='<button class="dbtn" id="'+comm.replyno+'">삭제</button>';
						}
						clist+="</div><hr>";
					});
					
					$("#comm").html(clist);
					$("#replycont").val("");
				});
		
		})//click
		$("#comm").on("click",".dbtn",function(){
			let replyno = $(this).attr("101");
			$.ajax({url:"/comm/delete/"+replyno,
				method:"get"
		}).done(function(){
				location.reload();		
			});
			
			
		})//click
	})//ready
	</script>
</body>
</html>