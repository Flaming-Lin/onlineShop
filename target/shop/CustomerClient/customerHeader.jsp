<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
pageContext.setAttribute("basePath", basePath);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>尊敬的用户您好！欢迎进入爱逛街商城！</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="${basePath}/css/reset.css"/>
<script src="${basePath}/js/jquery-3.1.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script><script src="js/bootstrap-table.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-nav mynavbarStyle">
      <div class="container-fluid">
        <div class="navbar-header">
     
         <a class="navbar-brand" href="${basePath}/CustomerClient/main.jsp">爱逛街</a>
        </div>
        <ul class="nav navbar-nav">
        <li><a href="${basePath}/Order/orderList.do">我的宝贝</a></li>
        </ul>
       <ul class="nav navbar-nav navbar-right">
          	<li>
          		<img class="ShowImgStyle" src="${basePath}${sessionScope.customer.imgurl}" style="width:40px" /><!-- 头像照片 -->
          	</li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                   昵称<b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="${basePath}/CustomerClient/personalInfo.jsp"><span class="glyphicon glyphicon-edit"></span>&nbsp;修改个人资料</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-off"></span>&nbsp;退出</a></li>
                </ul>
            </li>
           </ul>
      </div>
    </nav>
</body>
</html>