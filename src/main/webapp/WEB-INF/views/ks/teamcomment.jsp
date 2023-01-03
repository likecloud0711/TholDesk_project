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

 <div class="container">
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
    <textarea style="width: 1100px" rows="3" cols="30" id="replycont" name="replycont" placeholder="댓글을 입력하세요"></textarea>
                      <br>
				<span style="float:right;">
				<br>
                <button id="add" class="btn pull-right btn-outline-success">등록</button>
               </span>
               <br>
               <br>
               <br>
               <hr>
               <div id="comm">
	<c:forEach items="${cList}" var="comm">
		<div>${comm.empnm} / ${comm.replydate }</div> 
		<span style="float:right;">
		<c:if test="${empno == comm.empno }">
		<button class="btn btn-outline-danger" id="${comm.replyno}">삭제</button>
		</c:if>
		</span>
		<div>${comm.replycont}</div>
		<br>
		<hr>
	</c:forEach>
			</div>
			</td>
              </tr>
            </table>
            </div>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#add").click(function(){
			let content = $("#replycont").val();
			let no = ${dto.boardno};
			let empno = ${empno}
						
			$.ajax({url:"/comm/teaminsert",
					data:"boardno="+no+"&replycont="+content,
					method:"get",
					dataType:"json"
			}).done(function(resp){
					console.log(resp);
					let clist = "";
					resp.forEach(function(comm,index){
						clist += "<div>"+comm.empno+" / "+new Date(comm.replydate).toLocaleDateString() 
						+"</div><div>"+comm.replycont;
						if(empno == comm.empno){
							clist +='<button class="btn btn-outline-danger" id="'+comm.replyno+'">삭제</button>';
						}
						clist+="</div><hr>";
					});
					$("#comm").html(clist);
					$("#replycont").val("");
				});
		})//click
		$("#comm").on("click",".btn",function(){
			let replyno = $(this).attr("id");
			$.ajax({url:"/comm/teamdelete/"+replyno,
				method:"get"
		}).done(function(){
				location.reload();
			});
		})//click
	})//ready
	</script>
</body>
</html>