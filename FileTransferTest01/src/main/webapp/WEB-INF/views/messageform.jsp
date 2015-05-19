<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<h3>Spring MVC File upload example </h3>
	<form:form method="post" action="save" enctype="multipart/form-data" role="form">
		<!-- 
		<table>
			<tr><td><label>To:</label></td><td><input name="to" type="text" class="form-control"/> <br></td></tr>
			<tr><td><label>From:</label></td><td><input name="from" type="text" class="form-control"/> <br></td></tr>
			<tr><td><label>File:</label></td><td><input name="file" type="file" class="form-control"/> <br></td></tr>
			<tr><td><label>MSG :</label></td><td><input name="textMessage" type="text" class="form-control"/> <br></td></tr>
		</table> 
	    <br>
	     -->
	    <div class="form-group">
	    	<label for="receiver">Receiver(TO)</label>
	    	<input type="text" class="form-control" id="to" name="to" placeholder="Receiver">
	    </div>
	    <div class="form-group">
	    	<label for="sender">Sender(FROM)</label>
	    	<input type="text" class="form-control" id="from" name="from" placeholder="Sender">
	    </div>
	    <div class="form-group">
	    	<label for="file">File input</label>
	    	<input type="file" id="inputfile" name="file">
	    </div>
	    <div class="form=group">
	    	<label for="textMsg">Text Message</label>
	    	<input type="text" class="form-control" id="textMessage" name="textMessage" placeholder="TextMessage">
	    </div>
	    
	    <br>
	    <button type="submit" class="btn btn-default">Send</button>
	    <!-- <input type="submit" value="Upload" class="btn btn-default"/> -->
	</form:form>
</div>	
    <script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>