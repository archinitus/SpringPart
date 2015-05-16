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
</head>
<style type="text/css">
	.bs-example{
		margin: 20px;
	}
</style>
<body>
	
<div class="container">
	
	<div class="bs-example">
		<h2>Hi, ${to}</h2>
		
		<div class="panel-group" id="accordion">
		<c:if test="${msgList.isEmpty()}">
			There is no message.
		</c:if>	
		<c:forEach items="${msgList}" var="msg">

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse${msg.id}">From: ${msg.sender}</a>
					</h4>
				</div>
				<div id="collapse${msg.id}" class="panel-collapse collapse">
					<div class="panel-body">
						<p>${msg.textMessage}</p>
						
						<c:if test="${not empty msg.filePath}">
						<hr>
						<label>Attached File</label>
						<p><a href="/ajou/${msg.filePath}">Download file</a>
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach> 
		</div>
		 
	</div>

</div>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>