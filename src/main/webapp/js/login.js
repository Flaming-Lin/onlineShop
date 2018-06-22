$(function(){
  //登录界面
  //把表单数据传给后台
  $.post('login.html',$('#login-form').serialize(),function(callback){
    if(callback.status){
        location.href='index.html';
    }else{
    	$("#input_password").attr("value","");
        alert(callback.msg);
    }
  },'json');

  //注册界面
  //把表单数据传给后台
  var rBtn = $("#register_btn");
  rBtn.submit(function(){
  	$.ajax({
         type: "POST",
         url:ajaxCallUrl,
         data:$('#register-form').serialize(),// 要提交的表单 
         success: function(msg) 
         {alert(msg);}
     });
  })

  var registerTips = $("#sectionB").find("div.tipStyle");//获取提示tip
  var rTexts = $("#sectionB input.rtext");
  console.log(rTexts.eq(2));
  rTexts.eq(0).focus();
  rTexts.each(function(index){
  	$(this).focus(function(){
  	   tipShow(index);
  })
  });
  rTexts.each(function(index){
  	
  		$(this).blur(function(){
  	   if(rTexts.eq(index).val()==null||rTexts.eq(index).val()==""){
					// 输出xx不能为空
					rTexts.eq(index).css("borderColor","red");
					tipShowN(index);
				}else{
					testFun(index,rTexts.eq(index).val());
				}	
        });
  
  })
  //失去焦点判断店铺名是否存在
  function isStoreExit(){
     if($.trim($("#storeName").val())==""){
                tipShowN(0);
                $("#storeName").focus();
            }else{
                $.ajax({
                    type: "post",
                    url: "XXXX",//后台来验证传回来message
                    data: "username=" + $("#storeName").val(),
                    success: function(message){
                        registerTips.eq(0).html(message);
                    }
                });
            }
  }
	var showT;
	// 获取焦点后提示用户输入内容
	function tipShow(i){
		switch(i)
		{
			case 0:
			showT="必填，长度为4~16个字符"
			break;
			case 1:
			showT="必填，请输入您的密码"
			break;
			case 2:
			showT="必填，再次输入相同密码"
			break;
			case 3:
			showT="必填，长度为3~10个字符"
			break;
			case 4:
			showT="必填，请输入您的手机号"
			break;	
		}
		registerTips.eq(i).css("color","lightgray");
		registerTips.eq(i).html(showT);
	}
	//失去焦点验证是否为空
	function tipShowN(i){
		switch(i)
		{
			case 0:
			showT="名称不能为空"
			break;
			case 1:
			showT="密码不能为空"
			break;
			case 2:
			showT="需要确认密码"
			break;
			case 3:
			showT="昵称不能为空"
			break;
			case 4:
			showT="手机号不能为空"
			break;	
		}
		registerTips.eq(i).html(showT);
		registerTips.eq(i).css("color","red");
	}
	// 失去焦点时输入数据验证正确
	function tipShowT(i){
		switch(i)
		{
			case 0:
			showT="名称可用"
			break;
			case 1:
			showT="密码可用"
			break;
			case 2:
			showT="密码输入一致"
			break;
			case 3:
			showT="昵称可用"
			break;
			case 4:
			showT="手机号可用"
			break;	
		}
		registerTips.eq(i).html(showT);
		registerTips.eq(i).css("color","#90EE90");
		registerTips.eq(i).css("borderColor","#90ee90");
	}
	// 失去焦点时输入数据验证有误
	function tipShowF(i){
		switch(i)
		{
			case 0:
			showT="名称格式错误"
			break;
			case 1:
			showT="密码格式错误"
			break;
			case 2:
			showT="密码输入不一致"
			break;
			case 3:
			showT="昵称格式错误"
			break;
			case 4:
			showT="手机号格式错误"
			break;	
		}
		registerTips.eq(i).html(showT);
		registerTips.eq(i).css("color","red");
		rTexts.eq(i).css("borderColor","red");
	}
	// 调用验证
	function testFun(i,value){
		switch(i)
		{
			case 0:
			nameTest(value)
			break;
			case 1:
			psdTest(value)
			break;
			case 2:
			psdSame(value)
			break;
			case 3:
			nicNameTest(value)
			break;
			case 4:
			phoneTest(value)
			break;	
		}
	}
	//验证名称
	function nameTest(value){
		var excn=/[^\x00-\xff]{1,}/g;
		var exen=/\w{1,}/g;
		var cn=excn.exec(value);
		var en=exen.exec(value);
		if(cn==null){
			cn="";
		};
		if(en==null){
			en="";
		};
		var len=cn.toString().length*2+en.toString().length;
		if(len>3&&len<17){//调用后台数据来判断是否店铺名称存在
			tipShowT(0);
		}else{
			tipShowF(0);
		};
	}
	//验证密码
	function psdTest(i){
		var exen=/\w{1,}/g;
		var en=exen.exec(i);
		if(en==null){
			en="";
		};
		var len=en.toString().length;
		if(len>0){
			tipShowT(1);
		}else{
			tipShowF(1);
		};
	}
	//验证两次输入是否一致
	function psdSame(i){
		if(i==rTexts.eq(1).val()){
			tipShowT(2);
		}else{
			tipShowF(2);
		}
	}
	//验证昵称
	function nicNameTest(value){
		var excn=/[^\x00-\xff]{1,}/g;
		var exen=/\w{1,}/g;
		var cn=excn.exec(value);
		var en=exen.exec(value);
		if(cn==null){
			cn="";
		};
		if(en==null){
			en="";
		};
		var len=cn.toString().length*2+en.toString().length;
		if(len>=3&&len<11){
		   tipShowT(3);
			
		}else{
			tipShowF(3);
		};
	}
	//验证邮箱
	// function mailTest(i){
	// 	var exen= /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/g;
	// 	var en=exen.exec(i);
	// 	if(en==null){
	// 		en="";
	// 	};
	// 	var len=en.toString().length;
	// 	if(len>0){
	// 		tipShowT(3);
	// 	}else{
	// 		tipShowF(3);
	// 	};
	// }
	//验证手机号
	function phoneTest(i){
	var exen=/^1\d{10}$/g;
		var en=exen.exec(i);
		if(en==null){
			en="";
		};
		var len=en.toString().length;
		if(len>0){
			tipShowT(4);
		}else{
			tipShowF(4);
		};
	}
});