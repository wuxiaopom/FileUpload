<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jspsmart.upload.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传</title>
</head>

<body>
<div align='center'>
	<form enctype="multipart/form-data" method="post" action="dofileupload.jsp">
		     选择文件：<input type="file" name="nfile"><br/>
		     上传文件：<input type="submit" value="提交上传">
  	</form>
</div>
</body>
</html>