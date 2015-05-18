<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=cp%>/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script>
		$(document).ready(function(){
			$("#send").click(function(){
				var form_data = {
						user: $("#user").val(),
						chat: $("#chat").val(),
						is_ajax: 1
				};
				$.ajax({
					type: "POST",
					url: "ajax",
					data: form_data,
					success: function(data) {
						
						$("#chatLog").html($("#chatLog").html() + "<p>" + data + "</p>");
					}
				});
				
				return false;
			});
			
		});

	</script>

</head>
<body>
	<div class="container">
		<h1>AJAX TEST</h1>
		<h2 id="searchbox" value="World">Hello</h2>
		

		<div class="panel panel-default">
			<div class="panel-body">
				<div id="chatLog"></div>
			</div>
		</div>
		<br>
		<form id="form1" name="form1" method="post">
			<input type="text" id="user" name="user" placeholder="Input username"/>
			<input type="text" id="chat" name="chat" placeholder="message"/>
			<input type="submit" id="send">
		</form>
	</div>
	
    <script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>