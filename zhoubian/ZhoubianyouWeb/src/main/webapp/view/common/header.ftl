<div class="row z-depth-2 base_header base_bg">
	<a href="/webAdmin/main/main.do">
		<div id="base_header_title" class="col m4 s12 base_header_title" style="min-height: 80px; padding-top: 24px; padding-left: 16px">
			<span class="glyphicon glyphicon-home"></span>
		</div>
	</a>

	<div class="col m7 s8 base_header_info" style="min-height: 80px">
		<p id="base_header_user" style="margin-top: 30px">欢迎您<#if Session.userWeb?exists> ${Session.userWeb.userName}</#if></p>
		<p id="base_header_welcome">今天是<b id="time_now"></b></p>
	</div>
	<!--退出-->
	<div id="base_header_logout" class="col m1 s4 base_header_logout">
		<span class="glyphicon glyphicon-off" onclick="window.location.href='${contextPath}/main/logout.do'" style="min-height: 60px; margin-top: 40px">退出</span>
	</div>
</div>
<script type="text/javascript">
	var contextPath = '${contextPath}';
	var yunPath = '${yunPath}';
	//全局的ajax访问，处理ajax清求时sesion超时  
	$.ajaxSetup({
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		complete : function(XMLHttpRequest, textStatus) {
			//通过XMLHttpRequest取得响应头，sessionstatus，  
			var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
			if (sessionstatus == "timeout") {
				//如果超时就处理 ，指定要跳转的页面  
				window.location = "../main/login.do";
			}
		}
	});

	$(document).ready(function() {
		var d, s = "";
		var x = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
		d = new Date();
		s += d.getFullYear() + "年" + (d.getMonth() + 1) + "月" + d.getDate() + "日　";
		s += x[d.getDay()];
		$('#time_now').text(s);
	});

	function clearApiCache() {
		var url = "${contextPath}/product/reloadProduct.do";
		$.ajax({
			type : "GET",
			url : url,
			dataType : "json",
			success : function(data) {
				var content;
				if (data.success) {
					content = '完成Api缓存清理！';
				} else {
					content = '清理Api缓存失败！';
				}
				$.confirm({
					title : '提示',
					content : content,
					confirmButton : '确定',
					cancelButtonClass : 'hide'
				});
			}
		});
	}
	
	function clearInvalidOrders() {
		var url = "${contextPath}/order/clearInvalidOrders.do";
		$.ajax({
			type : "GET",
			url : url,
			dataType : "json",
			success : function(data) {
				var content;
				if (data.success) {
					content = '无效订单清理完成！';
				} else {
					content = '无效订单清理失败！';
					if (data.errorMessage) {
						content = content + "失败原因：" + data.errorMessage;
					}
				}
				$.confirm({
					title : '提示',
					content : content,
					confirmButton : '确定',
					cancelButtonClass : 'hide'
				});
			}
		});
	}
</script>