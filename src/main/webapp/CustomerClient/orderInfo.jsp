<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
      String path = request.getContextPath();  
      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
      pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单信息</title>
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
    	
     <script type="text/javascript">

     function goback(){
    	 window.location.href = "${basePath}/Order/orderList.do";
     }
     
     </script>
</head>
<body>
	<div class="newgoods">
		<form class="form-horizontal" method="post" enctype="multipart/form-data">
			<fieldset>
				<div id="legend" class="">
					<legend class="">订单信息</legend>
				</div>
				<div class="control-group">
		       		<label class="control-label" >商品名称</label>
		        	<label class="control-label" >${order.products.name}</label>
		        </div>
		       
				<div class="control-group">
		        	<label class="control-label" >商品类型</label>
		        	<label class="control-label" >${order.products.type}</label>
		        </div>
		
				<div class="control-group">
					<label class="control-label" >单价</label>
					<label class="control-label" >${order.products.price}</label>
		        </div>
		         
		        <div class="control-group">
					<label class="control-label">商品图片</label>
					<img src="${basePath}${order.products.imgurl}" width="100" height="100"/>
				</div>
				
				<div class="control-group">
					<label class="control-label" >单价</label>
					<label class="control-label" >${order.products.price}</label>
				</div>
				
				<div class="control-group">
					<label class="control-label" >总价</label>
					<label class="control-label" >${order.totalprice}</label>
				</div>
				
				<div class="control-group">
					<label class="control-label">商品评价</label>
		        	<label class="control-label">${order.comment}</label>
		        </div>
		
			</fieldset>
		</form>
		<div class="controls">
			<button class="btn btn-danger" onclick = "goback()">返回</button>
		</div>
	</div>
</body>
</html>