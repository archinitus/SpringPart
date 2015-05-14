<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>File upload</title>
</head>
<body>
	<h3>Spring MVC File upload example </h3>
	<form:form method="post" action="save" enctype="multipart/form-data">
		<table>
			<tr><td><label>To:</label></td><td><input name="to" type="text" /> <br></td></tr>
			<tr><td><label>From:</label></td><td><input name="from" type="text" /> <br></td></tr>
			<tr><td><label>File:</label></td><td><input name="file" type="file" /> <br></td></tr>
		</table> 
	    <br>
	    <input type="submit" value="Upload" />
	</form:form>
</body>
</html>