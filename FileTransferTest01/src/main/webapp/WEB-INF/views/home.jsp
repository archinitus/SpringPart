<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String cp = request.getContextPath(); %>
<html>
<head>
	<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<title>Groupho, Spring part Test page.</title>
</head>
<body>
	
	<div class="container">
		<h2>  Groupho, Spring part test page. </h2>	
		
		<ul>
			<li><h4><a href="/ajou/messageform">Sending a message (with file)</a></h4></li>
			<li><h4><a href="/ajou/chatlogin">Chatting room</a></h4></li>
		</ul>
		
	</div>
    <script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
