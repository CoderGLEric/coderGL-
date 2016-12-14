$(function(){
	//登陆
		$("#js-login-btn").on('click', function(event) {
			if (checkPhoneNumIsEmpty()) {
				phoneEmptyAnimation();
			}else if (checkVertifyNumIsEmpty()) {
				vertifyEmptyAnimation();
			}else{
				//登陆
				var jsonOBJ = {
					method:"mobile",
                    type:"login",
                    ident:"client",
                    verify_code:$("#js-vertify").val(),
                    mobile:$("#js-user").val()
                };
                //地址自己写个登陆的URL吧
                var url = "";
                var httpTool = new HttpTool(jsonOBJ,url,function(){
                	alert("登陆成功");
                },function(){
                	alert("失败回调");
                });
                httpTool.postData();
			}
		});
		//验证码
		$("#js-obtain-vertify").on('click', obtainVertify);
		function obtainVertify(event) {
			if (checkPhoneNumIsEmpty()) {
				phoneEmptyAnimation();
			}else{
				//获取验证码 
                var jsonOBJ = {
                    type:"login",
                    mobile:$("#js-user").val()
                };
                //自己写个URL吧
                var url = "";
                var httpTool = new HttpTool(jsonOBJ,url,function(){
                	
                },function(){
                	alert("失败回调");
                	end();
                });
                httpTool.postData();
                start();
				$(this).unbind();
			}
			
		}

        function checkPhoneNumIsEmpty() {
            return isEmpty($("#js-user").val());
        }
        function checkVertifyNumIsEmpty(){
        	return isEmpty($("#js-vertify").val());
        }

        function isEmpty(str){
        	return str.length==0 || str==undefined;
        }

        function checkNumIsRight() {
        	//验证电话号码是否正确
        }

		//定时器
		var timer;
		var count = 60;
		function operator(argument) {
			// body...
			$("#js-obtain-vertify").text(count+"秒");
			count --;
			if (count<=0) {end()}
		}

		function start(argument) {
			// body...
			timer = window.setInterval(operator,1000);
		}
		function end(argument) {
			// body...
			$("#js-obtain-vertify").on('click', obtainVertify);
			window.clearInterval(timer);
			count=60;
			$("#js-obtain-vertify").text("获取验证码");
			
		}
		//动画
		function phoneEmptyAnimation(){
			shakeAnimation($("#js-user"));
		}

		function vertifyEmptyAnimation(){
			shakeAnimation($("#js-vertify"));
		}

		function shakeAnimation(element){
			element.removeClass('shake'+" animated").addClass('shake'+" animated").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
					$(this).removeClass('shake'+" animated")
				});
		}
});