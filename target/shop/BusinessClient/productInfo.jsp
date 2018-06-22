<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  
      String path = request.getContextPath();  
      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
      pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品信息</title>
<link href="${basePath}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="${basePath}/js/jquery-3.1.0.js"></script>
    <script src="${basePath}/js/bootstrap.min.js"></script>
    <style>
    .newgoods{
    	width:350px;
    	background-color: white;
    	border:1px solid gray;
    	margin:0 auto;
    	margin-top:50px;
    	padding:30px;
    }
    </style>
</head>
<body>
  <div class="newgoods">
		<form class="form-horizontal" action="${basePath}/Products/customerBuy.do?id=${product.id}" method="post" enctype="multipart/form-data">
			<fieldset>
				<div id="legend" class="">
					<legend class="">商品信息</legend>
				</div>
				<div class="control-group">
		       		<label class="control-label" >商品名称</label>
		        	<label class="control-label" >${product.name}</label>
		        </div>
		       
				<div class="control-group">
		        	<label class="control-label" >商品类型</label>
		        	<label class="control-label" >${product.type}</label>
		        </div>
		
				<div class="control-group">
					<label class="control-label" >单价</label>
					<label class="control-label" >${product.price}</label>
		        </div>
		         
		        <div class="control-group">
					<label class="control-label">商品图片</label>
					<img src="${basePath}${product.imgurl}" width="100" height="100"/>
				</div>
				
				<div class="control-group">
					<label class="control-label" >库存量</label>
					<label class="control-label" >${product.instock}</label>
				</div>
				
				<div class="control-group">
					<label class="control-label">商品描述</label>
		        	<label class="control-label">${product.memo}</label>
		        </div>
		        </fieldset>
		</form>
		<div class="controls">
			<button class="btn btn-danger" onclick = "goback()">返回</button>
		</div>
	</div>
		
  <table class="table">
    <tr>
      <td>用户</td>
      <td>评论</td>
    </tr> 
      <c:forEach items="${orders}" var="order" varStatus="status">
    <tr>   
        <td>${order.customer_1}</td>
        <td>${order.comment}</td>       
    </tr> 
    </c:forEach>
  </table>
  <a href="<%=request.getContextPath()%>/Products/businessProlist.do"><input type="button" name="nextPage" value="返回" /></a>
</body>
</html>