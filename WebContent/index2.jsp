<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yc.dao.PageDao" %>
<%@ page import="com.yc.bean.Emp" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>分页查询</title>
</head>
<body>
	<%
		String pageNumber = request.getParameter("pageNumber"); //显示第几页
		if(pageNumber == null || pageNumber.equals("")){ //如果没有此参数为空
			pageNumber = "1"; //缺省显示第一页
		}
		int number = Integer.parseInt(pageNumber); //转成整数类型
		int RECORD_COUNT = 3; //每页显示的数据条数
		int start = 0; //从第几条开始
	
		int end = 0; //到第几条结束
		
		start = (number - 1) * RECORD_COUNT + 1;
		end = number * RECORD_COUNT;
		PageDao dao = new PageDao();
		List<Emp> empList = dao.list(start,end);
		int count = dao.totalCount(); //总条数
	
		int total = (count - (count%RECORD_COUNT))/RECORD_COUNT; //总页数
	
		if(count % RECORD_COUNT != 0){
			total++;
		}
 %>

<table width='80%' border='2'>
	<tr bgcolor='red'>
		<td width='30%'>雇员编号</td>
		<td width='50%'>雇员姓名</td>
	</tr>
	<%for(int i = 0;i < empList.size();i++){ %>
	<tr>
		<td width='30%'><%=empList.get(i).getEmpNo() %></td>
		<td width='50%'><%=empList.get(i).geteName() %></td>
	</tr>
<%} %>
</table>
<br/>



	页码:
	     <%for(int i = 1;i <= total;i++) {%>
	         <a href="index2.jsp?pageNumber=<%=i%>"><%=i%></a>&nbsp;&nbsp;&nbsp;&nbsp;
	     <%}%>
	     
	<hr>
	
	
	
	
	<script language='Javascript'>
	function init(){
		var pageNumber = document.getElementById('pageNumber');
		pageNumber.selectedIndex = <%=pageNumber%> - 1;
	}
	function changeNum(num){
		document.location = 'index2.jsp?pageNumber=' + num;
	}
</script>
	页数:
	<select name='pageNumber' id='pageNumber' onchange='changeNum(this.value)'>
		<%for(int i = 1;i <= total;i++) {%>
		<option value='<%=i%>'>第<%=i%>页</option>
		<%}%>
	</select>
	
	
	
	<hr>
	<a href="#">首页</a>&nbsp;<a href="#">上一页</a>&nbsp;
	<input type="text" value="" size="2"/><input type="button" value="跳转至" />&nbsp;
	<a href="#">下一页</a>&nbsp;<a href="#">尾页</a>&nbsp;
</body>
</html>