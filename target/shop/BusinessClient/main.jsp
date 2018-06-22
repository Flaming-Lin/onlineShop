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
  <title>店铺首页</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link href="${basePath}/css/bootstrap-editable.css" rel="stylesheet" type="text/css">
<link href="${basePath}/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">
<link href="${basePath}/css/reset.css" rel="stylesheet" type="text/css">
<script src="${basePath}/js/jquery-3.1.0.js"></script>
<script src="${basePath}/https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script><script src="js/bootstrap-table.min.js"></script>
<script src="${basePath}/js/bootstrap-table-editable.js"></script>
<script src="${basePath}/js/bootstrap-table-zh-CN.js"></script>
<script src="${basePath}/js/bootstrap-editable.js"></script>

<script src="index.js"></script>
</head>
<body>
  

   <nav class="navbar navbar-fixed-top mynavbarStyle">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        <a class="navbar-brand" href="${baseaPath}/BusinessClient/main">爱逛街</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          </ul>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a id="goods" href="${basePath}/Products/businessProlist.do">货物管理<span class="sr-only">(current)</span></a></li>
            <li><a id="order" href="${basePath}/Order/orderList.do">订单管理</a></li>
            <li><a id="order" href="${basePath}/BusinessClient/personalInfo.jsp">店铺资料</a></li>
          </ul>
        </div>
        <div class="col-md-10 col-md-offset-2">
        
        </div>
        <div class="col-md-10 col-md-offset-2">
        </div>
        </div>
       </div>
        <div class="first_img" style="text-align: center">
            <img src="${basePath}/Image/logo.jpg"/>
        </div>
        <div class="first_img" style="text-align: center">
            <img src="${basePath}/Image/character.png"/>
        </div>
   
</body>
</html>