<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat,java.util.*,java.sql.*,com.jspsmart.upload.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传处理</title>
</head>
<body>
	<%		
		SmartUpload su = new SmartUpload();
		//初始化SmartUpload对象
		su.initialize(pageContext);
		com.jspsmart.upload.File file = null;
		//允许上传类型
		String allowed = "gif,jpg,doc,rar";
		//不许上传类型
		String denied = "jsp,asp,php,aspx,html,htm,exe,bat";
		com.jspsmart.upload.Request req  = null;
		//设置上传文件大小
		int file_size = 2*1024*1024;
		String exceptionMsg = null;
		int i = 0;
		try {
				//定义允许上传文件类型   
				su.setAllowedFilesList(allowed);
				//不允许上传文件类型   
				su.setDeniedFilesList(denied);		
				//单个文件最大限制   
				su.setMaxFileSize(file_size);						
				su.setCharset("UTF-8");
				//执行上传
				su.upload();
				//得到单个上传文件的信息
				file = su.getFiles().getFile(0);
				String filepath = null;
				if(!file.isMissing()){
					//设置文件在服务器的保存位置
					filepath = "upload\\";
					filepath += file.getFileName();
					//文件另存为   
					file.setCharset("UTF-8");
					System.out.println(filepath);
					file.saveAs(filepath, SmartUpload.SAVE_VIRTUAL);
				}
				
			} catch (Exception e) {
				exceptionMsg = e.getMessage();
				e.printStackTrace();
		}	
%>
</body>
</html>