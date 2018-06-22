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
<title>逛街啊！</title>
	<link href="${basePath}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="${basePath}/js/jquery-3.1.0.js"></script>
    <script src="${basePath}/js/bootstrap.min.js"></script>
    <script>
    $(function(){


    	$('#number').blur(function(){
    		var buyNumber = $("#number").val();
    		if(buyNumber == ""){
                 $('#sumPrice').html("请输入购买数量!");
    		}else{
    			
    		var price = $("#goodsPrice").html();
    		
    		var sumPrice = parseInt(buyNumber)*parseInt(price);
    		console.log(sumPrice);
    			$('#sumPrice').html(sumPrice+"元");
    		}
    	})

    })
    </script>
   <style>
  .mynavbarStyle{
	background-color:#d14d42;
	
}
.mynavbarStyle a{
	color:white;

}
#navbar ul li a:hover,.mynavbarStyle a:hover{
	background-color: #990000;
}
  .ShowImgStyle{
  	width:40px;
  	height: 40px;
  	overflow: hidden;
  	margin:5px;
  }
  .content{
  	 width:800px;
  	 margin: auto;  
     position: absolute;  
     top: 100px; left: 0; bottom: 0; right: 0;  
  }
  .info{
  	height:400px;
  	width:100%;
  }
  .image{
  	width:50%;
  	float:left;
  }
  .info img{
   height:350px;
  }
  .goodsInfo{
  	width:50%;
  	float:right;
  	text-align: left;
  	font-family: "Microsoft YaHei";
  	font-size:15px;
  	
  }
  .goodsInfo p{
  	word-break:break-word;
  }
  #goodsComment{
  	width:90%;
  	height:50px;
  	word-break:break-word;
  }
  .showSumPrice{
  	
    width:80%;
    margin:0 auto;
  }
  .showSumPrice p{
  	color:#CC0000;
  }
  </style>
  
    	
     <script type="text/javascript">

     function goback(){
    	 window.location.href = "${basePath}/Products/customerProList.do ";
     }
     
     </script>
</head>
<body>
<jsp:include page="customerHeader.jsp"></jsp:include> 
		<form class="form-horizontal" action="${basePath}/Order/create.do?id=${product.id}" method="post" enctype="multipart/form-data">
			<fieldset>
				<div class="content">
     <div class="info">
     	<div class="image">
     		<img src="${basePath}${product.imgurl}"/>
     	</div>
     	<div class="goodsInfo">
     		<h3 id="goodsName">${product.name}</h3>
     		<h4 id="goodsType">${product.type}</h4>
     		<h4 style="display: inline-block">库存量：</h4>
     		<lable id="goodsNum">${product.instock}</lable>
     		<br/>
     		<h4 style="display: inline-block">单价:</h4></div>
     		<lable id="goodsPrice">${product.price}</lable>
     		<h4>评价</h4>
     		<div id="goodsComment">
     			${product.memo}
     		</div>

     	</div>
     <div class="buy">
     	<div class="showSumPrice">
     		<lable>输入购买数量:</lable><input id="number" type="text" name="number"/>
     	<lable>总价为:</lable><p id="sumPrice" style="display: inline"></p>
     	<button class="btn btn-danger" id="vbuy">确认购买</button>
     	</div>
     </div>
    </div>
			</fieldset>
		</form>
	
</body>
</html>