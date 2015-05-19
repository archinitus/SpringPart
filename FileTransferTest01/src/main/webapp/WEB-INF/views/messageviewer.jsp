<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>File upload</title>
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<h2>Spring MVC Message Viewer </h2>
	<form:form method="post" action="messagepage" role="form">
	    <div class="form-group">
	    	<label for="receiver">Receiver(TO)</label>
	    	<input type="text" class="form-control" id="to" name="to" placeholder="Input receiver name...">
	    </div>
	    
	    <br>
	    <button type="submit" class="btn btn-default">Send</button>
	</form:form>
</div>	
    <script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>