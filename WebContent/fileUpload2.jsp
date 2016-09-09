<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="doUpload.jsp" enctype="multipart/form-data">
		 <table width="315" border="0">
		   <tr>
		     <td width="309" align="center"><input type="file" name="file1" size="30"></td>
		   </tr>
		   <tr>
		     <td align="center"><input type="file" name="file2" size="30"></td>
		    <tr>
		     <td align="center"><input type="submit" name="Submit" value="上传"></td>
		   </tr>
		 </table>
	 </form>
</body>
</html>