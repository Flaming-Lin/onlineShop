<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%  
      String path = request.getContextPath();  
      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
      pageContext.setAttribute("basePath", basePath);
%>
<title>登陆</title>
    <link href="${basePath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"> 
	<link href="${basePath}/css/index.css" rel="stylesheet" type="text/css">
    <script src="${basePath}/js/jquery-3.1.0.js"></script>
    <script src="${basePath}/js/bootstrap.min.js"></script>
    <script src="${basePath}/js/login.js"></script>
</head>
<body>
   <div class="container">
	<div class="row">
		<h3>欢迎来到剁手</h3>
	</div>
   </div>
   <br>
<br>
<div class="container">
<div class="row">
<div class="col-md-4 col-md-offset-4">
<div class="form-body">
    <ul class="nav nav-tabs final-login">
        <li class="active"><a data-toggle="tab" href="#sectionA">登录</a></li>
        <li><a data-toggle="tab" href="#sectionB">注册!</a></li>
    </ul>
    <div class="tab-content">
        <div id="sectionA" class="tab-pane fade in active">
        <div class="innter-form">
            <form class="sa-innate-form" action="${basePath}/Business/login.do" id="login-form" method="post" onsubmit="return checkForm()">
            <label>用户名</label>
            <input type="text" name="username" />
            <label>密码</label>
            <input type="password" name="password" id="input_password"/>
            <div class="tipStyle" id="loginTip"></div>
            <button type="submit">登录</button>
            <a href="">&nbsp;忘记密码?</a>
            </form>
            </div>
         </div>
         ${result}
         <div id="sectionB" class="tab-pane fade">
			<div class="innter-form">
            <form class="sa-innate-form" method="post" id="register-form" action="${basePath}/Business/register.do">
            <label>用户名</label>
            <input id="storeName"  type="text" name="username" class="rtext" />
            <div class="tipStyle" id="storeTip"></div>
            <label>密码</label>
            <input type="password" name="password" class="rtext">
            <div class="tipStyle" id="psTip"></div>
            <label>确认密码</label>
            <input type="password" name="password2" class="rtext" />
            <div class="tipStyle" id="ps_again_Tip"></div>
            <label>店铺名称</label>
            <input type="text" name="nickName" class="rtext" />
            <div class="tipStyle" id="mailTip"></div>
            <label>手机号码</label>
            <input type="text" name="telephone" class="rtext" />
            <div class="tipStyle" id="phoneTip"></div>
            <button type="submit" id="register_btn">注册</button>
            <p style="display: inline-block;">点击经营你的店铺吧！</p>
            </form>
            </div>
        </div>
          </div>
         </div>
        </div>
       </div>
    </div>
</body>
</html>