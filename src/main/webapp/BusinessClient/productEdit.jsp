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
<title>修改商品信息</title>
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
	 	<form class="form-horizontal" action="${basePath}/Products/edit.do?id=${product.id}" method="post" enctype="multipart/form-data">
    <fieldset>
      <div id="legend" class="">
        <legend class="">填入货物信息</legend>
      </div>
    

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">商品名称</label>
          <div class="controls">
            <input type="text" placeholder="请输入商品名称" class="input-xlarge" name="name" value="${product.name}">
            <p class="help-block"></p>
          </div>
        </div>
        
     <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">商品类型</label>
          <div class="controls">
            <input type="text" placeholder="请输入商品类型" class="input-xlarge" name="type" value="${product.type}">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">单价</label>
          <div class="controls">
            <input type="text" placeholder="请输入价格" class="input-xlarge" name="price"value="${product.price}">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">库存量</label>
          <div class="controls">
            <input type="text" placeholder="请输入现有库存量" class="input-xlarge" name="instock" value="${product.instock}">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">
          <label class="control-label">商品图片</label>
          <img src="${basePath}${product.imgurl}" width="100" height="100"/>

          <!-- File Upload -->
          <div class="controls">
            <input class="input-file" id="fileInput" type="file" name="file">
          </div>
        </div><div class="control-group">

          <!-- Textarea -->
          <label class="control-label">输入商品描述</label>
          <div class="controls">
            <div class="textarea">
                  <textarea type="" class="" name="memo">${product.memo}</textarea>
            </div>
          </div>
        </div>

    <div class="control-group">
          <label class="control-label"></label>

          <!-- Button -->
          <div class="controls">
            <button class="btn btn-danger">确认</button>
          </div>
        </div>

    </fieldset>
  </form>
	 </div>
	 <a href="${basePath}/Products/businessProlist.do">返回</a>
</body>
</html>