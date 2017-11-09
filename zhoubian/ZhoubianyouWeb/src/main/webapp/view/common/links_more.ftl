<#include "/common/taglibs.ftl" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>F.A.Wholesale后台管理系统</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
	<!--link rel="stylesheet/less" href="less/bootstrap.less" type="text/css" /-->
	<!--link rel="stylesheet/less" href="less/responsive.less" type="text/css" /-->
	<!--script src="js/less-1.3.3.min.js"></script-->
	<!--append ‘#!watch’ to the browser URL, then refresh the page. -->
	<link href="${contextPath}/view/assets/css/style.css" rel="stylesheet">
	<link href="${contextPath}/view/assets/css/bootstrap.css" rel="stylesheet">
	<link href="${contextPath}/view/assets/css/jquery-confirm.min.css" rel="stylesheet">
	<link href="${contextPath}/view/assets/css/zTreeStyle.css" rel="stylesheet">
	<link href="${contextPath}/view/assets/css/pagination.css" rel="stylesheet">
	<link href="${contextPath}/view/assets/css/base.css" rel="stylesheet">
	<link href="${contextPath}/view/assets/css/base_header.css" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="${contextPath}/view/assets/css/jquery.datetimepicker.css"/ >
  	<link rel="stylesheet" type="text/css" href="${contextPath}/view/assets/css/font-awesome.min.css"/ >
  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
    <script src="../view/assets/js/html5shiv.js"></script>
  <![endif]-->

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-57-precomposed.png">
  <link href="https://fonts.googleapis.com/css?family=Raleway:300,400" rel="stylesheet">
  <link rel="shortcut icon" href="img/favicon.png">
  <script src="${contextPath}/view/assets/js/jquery.min.js"></script>
  <script src="${contextPath}/view/assets/js/bootstrap.min.js"></script>
  <script src="${contextPath}/view/assets/js/bootstrap-paginator.js"></script>
  <script src="${contextPath}/view/assets/js/jquery-confirm.min.js"></script>
  <script src="${contextPath}/view/assets/js/jquery.form.js"></script>
  <script src="${contextPath}/view/assets/js/jquery.validate.min.js"></script>
  <script src="${contextPath}/view/assets/js/jquery.ztree.core.js"></script>
  <script src="${contextPath}/view/assets/js/jquery.ztree.excheck.js"></script>
 <script src="${contextPath}/view/assets/js/jquery.datetimepicker.js"></script>
 <script src="${contextPath}/view/assets/js/My97DatePicker/WdatePicker.js"></script>
 <script src="${contextPath}/view/assets/js/pagination.js"></script>
  <script type="text/javascript" >
  	function checkInputLength(obj,length){
	var text = $(obj).val();
	var content = "输入不能超过"+ length +"个!";
	if(text.length >= length){
		$.confirm({
		    title: false,
		    content: content,
		    confirmButton: '确定',
			cancelButton: '取消', 
		    confirm: function(){
		        
		    }
		});
		}
	}
	
	function selectShop(){
		var selectedShopId = '';
		selectedShopId = $('#shopId').val();
		$("#chooseShopDiv").load("../shop/selectShop.do?pageSize=100&shopId="+selectedShopId);
		//弹出层位置
		var X = $('#shopName').offset().top;
		$('#choose_shop_div').css("top",X+0);
		$('#choose_shop_div').slideDown(200);
	}
	
	Date.prototype.format = function(fmt) 
{ //author: meizz 
  var o = { 
    "M+" : this.getMonth()+1,                 //月份 
    "d+" : this.getDate(),                    //日 
    "h+" : this.getHours(),                   //小时 
    "m+" : this.getMinutes(),                 //分 
    "s+" : this.getSeconds(),                 //秒 
    "q+" : Math.floor((this.getMonth()+3)/3), //季度 
    "S"  : this.getMilliseconds()             //毫秒 
  }; 
  if(/(y+)/.test(fmt)) 
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
  for(var k in o) 
    if(new RegExp("("+ k +")").test(fmt)) 
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 
  return fmt; 
}

function buttonDisabled(buttonId){
	$(buttonId).removeClass("blue");
 	$(buttonId).addClass("disabled");
}

function buttonEnabled(buttonId){
	$(buttonId).removeClass("disabled");
 	$(buttonId).addClass("blue");
}

function openTypeShow(){
	var X = $('#choosed_str').offset().top;
	var Y = $('#choosed_str').offset().left;
	window.open(contextPath+'/category/selectCategory.do', 'newwindow','height=500, width=550, top='+(X-50)+', left='+(Y+50)+
			+',titlebar=no, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
	
}
  </script>
</head>