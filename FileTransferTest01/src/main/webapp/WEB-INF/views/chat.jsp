<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Chat</title>
<link href="<%=cp%>/resources/css/chat.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
</head>
<body>
	<ul class="pages">
		<li class="chat page">
			<div class="chatArea">
				<ul class="messages">
				</ul>
			</div>
			<input class="inputMessage" placeholder="Type here . . ."/>
		</li>
	</ul>
	
<script src="//js.pusher.com/2.2/pusher.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="<%=cp%>/resources/js/pusher_key.js" type="text/javascript"></script>
<script>
	var userName = "${name}";
	var userEmail = "${email}";
</script>
<script src="<%=cp%>/resources/js/chat.js" type="text/javascript"></script>

</body>
</html>