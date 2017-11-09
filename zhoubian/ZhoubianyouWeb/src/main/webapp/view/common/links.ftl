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

	
  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
    <script src="../view/assets/js/html5shiv.js"></script>
  <![endif]-->

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="img/favicon.png">
  <script src="${contextPath}/view/assets/js/jquery.min.js"></script>
  <script src="${contextPath}/view/assets/js/bootstrap.min.js"></script>
  <script src="${contextPath}/view/assets/js/bootstrap-paginator.js"></script>
  <script src="${contextPath}/view/assets/js/jquery-confirm.min.js"></script>
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
  </script>
</head>