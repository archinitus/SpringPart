<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=cp%>/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<br><br>
	<div class="container">
		<form action="chat" method="post">
			<div class="form-group">
			   	<label for="username">User Name</label>
			   	<input type="text" class="form-control" id="name" name="name" placeholder="User Name">
			</div>
			<div class="form-group">
				<label for="useremail">Email</label>
			    <input type="text" class="form-control" id="email" name="email" placeholder="Email">
			</div>
			<button type="submit" class="btn btn-default">Send</button>
		</form>
	</div>
</body>
</html>