<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
      String path = request.getContextPath();  
      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
      pageContext.setAttribute("basePath", basePath);
%>
<html>
<head>
<link rel="stylesheet" href="${basePath}/css/reset.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    .newInfo{
    	width:350px;
    	background-color: white;
    	border:1px solid gray;
    	margin:0 auto;
    	margin-top:50px;
    	padding:30px;
    }
    </style>
<title>店铺信息</title>
</head>
<body>
<form id="form" name="form" action="${basePath}/Business/update.do" method="post" enctype="multipart/form-data">     
    <table id="baseInfo" align="center" border="0" cellpadding="0" cellspacing="0"  class="newInfo"> 
      <tr>
        <td><input type="hidden" name="id" value="${sessionScope.business.id}" /></td>
      </tr>
      <tr>
        <td>店铺名称：</td>
        <td><input type="text" name="nickName" value="${sessionScope.business.nickName}" /></td>
      </tr>
      <tr>
        <td>手机号：</td>
        <td><input type="text" name="telephone" value="${sessionScope.business.telephone}"/></td>
      </tr>
      <tr>
        <td>头像：</td>
        <td><img src="${basePath}${sessionScope.business.imgurl}" width="100" height="100"/></td>
      </tr>
      <tr>
        <td>开店日期：</td>
        <td><input type="text" name="openDate" value="${sessionScope.business.openDate}" readonly/></td>
      </tr>
      <tr><td>头像：</td>
      <td><input type="file" name="file"/></td>
      </tr>
      <tr>
        <td>店铺介绍：</td>
        <td></td>
      </tr>
      <tr>
        <td><input type="submit" value="更新"></td>
        <td><a href="${basePath}/BusinessClient/main.jsp">返回</a></td>
      </tr>
    </table>
</form>
</body>
</html>