<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<meta charset="UTF-8">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click",function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action","/board/write");
				formObj.attr("method","post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0;i<regForm;i++){
				if($(".chk").eq(i).val()==""|| $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
	<body>
		<div class="container">
			<header>
				<h1>게시판</h1>
			</header>
			<hr />
			
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id = "container">
				<form name="writeForm" method = "post" action = "/board/write" enctype="multipart/form-data">
					<c:if test="${member.userId != null }">
						<div class="form-group">
							<label for = "title" class="col-sm-2 control-label">제목</label>
							<input type = "text" id = "title" name = "title" class="chk form-control" title="제목을 입력하세요."/>
						</div>
						<div class="form-group">
							<label for = "content" class="col-sm-2 control-label">내용</label>
							<textarea id = "content" name = "content" class="chk form-control" title="내용을 입력하세요"></textarea>
						</div>
						<div class="form-group">
							<label for = "writer" class="col-sm-2 control-label">작성자</label>
							<!-- <input type = "text" id = "writer" name = "writer" class="chk form-control" title="작성자를 입력하세요"/> -->	
							<input type="text" id="writer" name="writer" class="form-control" value="${member.userId}" readonly="readonly" />
						</div>
						<div class="form-group">
							<input type="file" name="file" class="form-control">
						</div>
						<div>
							<button type="button" class="write_btn btn btn-success" >작성</button>
						</div>
					</c:if>
					<c:if test="${member.userId == null }">
						<p>로그인 후에 작성하실 수 있습니다.</p>
					</c:if>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>