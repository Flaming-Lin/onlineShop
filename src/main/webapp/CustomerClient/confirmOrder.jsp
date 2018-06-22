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
<title>交易成功</title>
	<link href="${basePath}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="${basePath}/js/jquery-3.1.0.js"></script>
    <script src="${basePath}/js/bootstrap.min.js"></script>
    <style>
    .newgoods{
    	width:1000px;
    	background-color: white;
    	border:1px solid gray;
    	margin:0 auto;
    	margin-top:50px;
    	padding:30px;
    	
    }
    .beCenter{
    width:50%;
    margin:0 auto;
    text-align:left;
    
    }
    </style>
    	
     <script type="text/javascript">

     function goback(){
    	 window.location.href = "${basePath}/Products/customerProList.do";
     }
     
     </script>
</head>
<body>
<jsp:include page="customerHeader.jsp"></jsp:include> 
	<div class="newgoods">
		<form class="form-horizontal" action="${basePath}/Order/addComment.do?id=${order.id}" method="post" enctype="multipart/form-data">
			<fieldset>
				<div id="legend" class="">
					<legend class="" style="color:#CC0000;">交易成功</legend>
				</div>
				<div class="beCenter">
		        <div class="control-group">
					<label class="control-label">商品图片</label><br/>
					<img src="${basePath}${order.products.imgurl}" width="100" height="100"/>
				</div>
				
				<div class="control-group">
		       		<label class="control-label" >商品名称：</label>
		        	<label class="control-label" >${order.products.name}</label>
		        </div>
		       
				<div class="control-group">
		        	<label class="control-label" >商品类型：</label>
		        	<label class="control-label" >${order.products.type}</label>
		        </div>
		
				<div class="control-group">
					<label class="control-label" >单价：</label>
					<label class="control-label" >${order.products.price}</label>
				</div>
				
				<div class="control-group">
					<label class="control-label" >总价：</label>
					<label class="control-label" >${order.totalprice}</label>
		        </div>

				<div class="control-group">
					<label class="control-label">订单日期：</label>
		        	<label class="control-label">${order.date}</label>
		        </div>
		        		
				<div class="control-group">
					<label class="control-label">请为宝贝写个评价吧！：</label>
		        </div>
		        
		    	<div class="control-group">
					<label class="control-label"></label>
					<!-- Button -->
					<div class="controls">
           				<input type="text" placeholder="评价" class="input-xlarge" name="comment" value="1">
            		<p class="help-block"></p>
					<div class="controls">
		            	<button class="btn btn-danger" > 确认收货</button>
		          	</div>

		        </div>
		</div>
			</fieldset>
		</form>
	</div>
	<a href="${basePath}/Products/customerProlist.do">返回</a>
</body>
</html>