<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.jspsmart.upload.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传处理</title>
</head>
<body>
	<%
		 // 新建一个SmartUpload对象
		SmartUpload su = new SmartUpload();
		// 上传初始化
		su.initialize(pageContext);
		// 设定上传限制
		// 1.限制每个上传文件的最大长度。
	    su.setMaxFileSize(20*1024*1024);
		// 2.限制总上传数据的长度。
	    su.setTotalMaxFileSize(40*1024*1024);
		// 3.设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。
		su.setAllowedFilesList("doc,txt,jpg");
		// 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有
		su.setCharset("UTF-8");
		//扩展名的文件。
	    su.setDeniedFilesList("exe,bat,jsp,htm,html");
		// 上传文件
		su.upload();
		 // 将上传文件全部保存到指定目录，需要先在在Web应用的根目录下，创建一个upload目录
		int count = su.save("/upload");
		out.println(count+"个文件上传成功！<br>");
		 // 逐一提取上传文件信息，同时可保存文件。
		for (int i=0;i<su.getFiles().getCount();i++){
		 com.jspsmart.upload.File file = su.getFiles().getFile(i);
		 // 若文件不存在则继续
		if (!file.isMissing()) {
		 // 显示当前文件信息
		 out.println("<TABLE BORDER=1>");
		 out.println("<TR><TD>表单项名（FieldName）</TD><TD>"
		 + file.getFieldName() + "</TD></TR>");
		 out.println("<TR><TD>文件长度（Size）</TD><TD>" +
		 file.getSize() + "</TD></TR>");
		 out.println("<TR><TD>文件名（FileName）</TD><TD>"
		 + file.getFileName() + "</TD></TR>");
		 out.println("<TR><TD>文件扩展名（FileExt）</TD><TD>"
		 + file.getFileExt() + "</TD></TR>");
		 out.println("<TR><TD>文件全名（FilePathName）</TD><TD>"
		 + file.getFilePathName() + "</TD></TR>");
		 out.println("</TABLE><BR>");
		
		// 另存到以WEB应用程序的根目录为文件根目录的目录下
		  file.saveAs("/upload/" + file.getFileName(),su.SAVE_VIRTUAL);
	   // 另存到操作系统的根目录为文件根目录的目录下
	   // file.saveAs("E:\\workspaces\\Jsp_6\\WebContent\\upload\\"+file.getFileName(),su.SAVE_PHYSICAL);
		}
 	}
 %>
</body>
</html>