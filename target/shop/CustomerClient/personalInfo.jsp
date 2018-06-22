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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="${basePath}/css/reset.css"/>
<script src="${basePath}/js/jquery-3.1.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script><script src="js/bootstrap-table.min.js"></script>
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
</head>
<body>

<div class="newInfo">
	 	<form class="form-horizontal" id="form" name="form" action="${basePath}/Customer/update.do" method="post" enctype="multipart/form-data">
    <fieldset>
      <div id="legend" class="">
        <legend class="">个人资料管理</legend>
      </div>
    

    <div class="control-group">
           <input type="hidden" name="id" value="${sessionScope.customer.id}" />
          <!-- Text input-->
          <label class="control-label" for="input01">用户名称</label>
          <div class="controls">
          <input type="text" name="nickname"class="input-xlarge" value="${sessionScope.customer.nickname}">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">手机号</label>
          <div class="controls">
            <input type="text" name="telephone" class="input-xlarge" value="${sessionScope.customer.telephone}">
            <p class="help-block"></p>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">头像</label>
          <img src="${basePath}${sessionScope.customer.imgurl}" style="width:40px" />

          <!-- File Upload -->
          <div class="controls">
            <input class="input-file" name="file" id="fileInput" type="file">
          </div>
        </div><div class="control-group">

 	    <!-- Textarea -->
          <label class="control-label">自我介绍</label>
          <div class="controls">
            <div class="textarea">
                  <textarea type="" class=""> </textarea>
            </div>
          </div>
        </div>

    <div class="control-group">
          <label class="control-label"></label>

          <!-- Button -->
          <div class="controls">
            <button class="btn btn-danger">更新</button>
            <a href="${basePath}/CustomerClient/main.jsp">返回</a>
          </div>
        </div>

    </fieldset>
  </form>
	 </div>
</body>
</html>