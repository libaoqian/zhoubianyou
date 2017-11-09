<#import "/spring.ftl" as spring />
<#include "/common/taglibs.ftl" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>饰袋后台管理系统</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="${contextPath}/view/assets/css/jquery-confirm.min.css" rel="stylesheet">
<link href="${contextPath}/view/assets/css/foder.css" rel="stylesheet" type="text/css" />
<style>
.img_content_li {
}
.img_content_div {
    position:relative;
    width: 95%;
    padding: 60px auto 0 20px;
    height: 100px;
}
.img_content_img {
   max-width:95px;
   max-height:95px;
}
.img_content_delete {
  padding-left:-10px;
  position:absolute;
}
.img_content_title {
    text-align: center;
    word-break: break-all;
}
.content_son_ {
	min-height: 140px;
	text-align: center;
}
.a-img-upload {
    background: #fafafa none repeat scroll 0 0;
    border: 1px solid #ddd;
    color: #888;
    cursor: pointer;
    display: inline-block;
    height: 28px;
    line-height: 30px;
    overflow: hidden;	
    position: relative;
    text-align: center;
    width: 100px;
}
.a-img-upload input {
    cursor: pointer;
    font-size: 100px;
    opacity: 0;
    position: absolute;
    right: 0;
    top: 0;
}
</style>
</head>
<body>
<div style="margin:6px;">
	<div style="height:35px;">
		<span id="option_hint" >单击图片选择</span>
    	<svg id="loadingSvg" style="display:none;" viewBox="0 0 4 18" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
			<g id="circle" class="g-circles g-circles--v1">
	          <circle id="12" transform="translate(35, 16.698730) rotate(-30) translate(-35, -16.698730) " cx="35" cy="16.6987298" r="10"></circle>
	          <circle id="11" transform="translate(16.698730, 35) rotate(-60) translate(-16.698730, -35) " cx="16.6987298" cy="35" r="10"></circle>
	          <circle id="10" transform="translate(10, 60) rotate(-90) translate(-10, -60) " cx="10" cy="60" r="10"></circle>
	          <circle id="9" transform="translate(16.698730, 85) rotate(-120) translate(-16.698730, -85) " cx="16.6987298" cy="85" r="10"></circle>
	          <circle id="8" transform="translate(35, 103.301270) rotate(-150) translate(-35, -103.301270) " cx="35" cy="103.30127" r="10"></circle>
	          <circle id="7" cx="60" cy="110" r="10"></circle>
	          <circle id="6" transform="translate(85, 103.301270) rotate(-30) translate(-85, -103.301270) " cx="85" cy="103.30127" r="10"></circle>
	          <circle id="5" transform="translate(103.301270, 85) rotate(-60) translate(-103.301270, -85) " cx="103.30127" cy="85" r="10"></circle>
	          <circle id="4" transform="translate(110, 60) rotate(-90) translate(-110, -60) " cx="110" cy="60" r="10"></circle>
	          <circle id="3" transform="translate(103.301270, 35) rotate(-120) translate(-103.301270, -35) " cx="103.30127" cy="35" r="10"></circle>
	          <circle id="2" transform="translate(85, 16.698730) rotate(-150) translate(-85, -16.698730) " cx="85" cy="16.6987298" r="10"></circle>
	          <circle id="1" cx="60" cy="10" r="10"></circle>
      		</g>
  		</svg>
	</div>
	<div class="foder" id="folder_ul">
		<#if Session.userWeb.id == "admin">
			<!-- <#if shops??>
				<select>
					<#list shops as shop>
						<option>${shop.shopName}</option>
					</#list>
				</select>
			</#if> -->
		</#if>
			<#if folderFiles??>
				<#if folderFiles.list?? && (folderFiles.list?size > 0)>
					<#list folderFiles.list as folder>
						<#if folder.suffix == ''>
							<#if folder_index == 0>
								<ul class="ful" id="folder_level${folder.level}" style="overflow-y:auto;">
								<input type="hidden" id="min_level" value="${folder.level}"/>
							</#if>
								<li>
									<div>
										<div class="fla" onclick="selectedFolder(this,${folder.level},'${folder.id}',1)" object_id="${folder.id}" absolutePath="${folder.yunKey}" folderLevel="${folder.level}" onmousemove="showDelete(this)" onmouseout="hideDelete(this)">
											<span class="pack btn_" id="id2"></span> 
											<span class="ftext">${folder.name}</span>
											<span class="delete btn_ none" onclick="deleteObject('${folder.id}',this,1)"></span>
										</div>
									</div>
								</li>
						</#if>
					</#list>
				<#else>
					<p>还没有目录，请新建</p>
				</#if>
			</#if>
			
		</ul>
	</div>
	<div class="content_" id="folder_file_div">
		<span>
			<span class="btn blue" id="lastLevelFolder" onclick="folderOnClickLastFolder(this)" absolutepath="/" foldername="" level="0">上一级</span>
			<span id="folder_now_show"></span>
			<input type="hidden" id="last_folder_id"/>
		</span>	
		<div style="position:absolute;margin-top: 10px; width: 95%;">	
				<div class="col-sm-6 col-md-4 content_son_" id="upload_li" style="display:none;">
					<div class="thumbnail content_son_">
						<div class="caption">
							<a href="javascript:;" class="a-img-upload">
								<input type="file" id="upload_img_file" multiple="multiple" accept=".png,.gif,.jpg" onchange="UpladImage('upload_img_file')" name="upload_img_file"/>
								上传图片
							</a>
							<input type="hidden" id="foder_id_now"/>
							<a href="javascript:;" class="a-img-upload" onclick="addfolderShow()">
								新建文件夹
							</a>
						</div>	
					</div>
				</div>
				<div id="content_imgs">
					<#if folderFiles.list?? && (folderFiles.list?size > 0)>
						<#list folderFiles.list as folder>
							<#if folder.suffix == ''>
								<div class="col-sm-6 col-md-4" style="padding-right:5px;padding-left: 5px;">
									<div onclick="folderOnClickFolder(this,0)" absolutepath="${folder.yunKey}" object_id="${folder.id}" foldername="${folder.name}" level="${folder.level}" class="thumbnail content_son_">
										<img src="../view/assets/img/folder.png">
										<div class="caption">
								            <p class="img_content_title">${folder.name}</p>
								         </div>
									</div>
								</div>
							</#if>
						</#list>
					<#else>
						<p>还没有目录，请新建</p>
					</#if>
				</div>
		</div>
	</div>
	<div style="position:absolute;bottom:0;text-align:center;width:100%;">
		<div id="imgPage">
			<ul class="pagination"></ul>
		</div>
  		<input id="imgPageNum" name="imgPageNum" type="hidden" value="<#if folderFiles??>${folderFiles.pageNum}</#if>"/>
  		<input id="imgLastPage" name="imgLastPage" type="hidden" value="<#if folderFiles??>${folderFiles.lastPage}</#if>"/>
		<button type="button" class="button gray" type="button" onclick="closeSelectImg()" >关闭</button>
		<button style="margin:10px;" type="button" class="button blue" type="button" onclick="addToHtml()" >确认添加</button>
	</div>
</div>

<div id="add_folder" class="theme-popover" style="margin-top:-200px;margin-left: -250px;">
 	<div style="z-index: 99;position:absolute; left:-12px; top:-12px;" >
		<img src="../view/assets/img/close.png" onclick="addfolderHide()"/>
	</div>
	<div style="">
		<input type="hidden" id="fatherFolder" name="fatherFolder"/>
		<input type="hidden" id="fatherLevel" name="fatherLevel"/>
		<input type="hidden" id="fatherObject" name="fatherObject"/>
		<div class="add_div" style="margin-bottom:0;">
			<span>文件夹名称:</span>
			<b id="father_folder"></b>
			<input type="text" id="folderName" name="folderName" value=""/>
		</div>
        <div class="add_div">
        	<div style="margin-left:80px;">
        		<button type="button" class="button gray" onclick="addfolderHide()">取消</button>
				<button type="button" class="button blue" type="button" onclick="addfolder()">保存</button>
			</div>
        </div>
	</div>
</div>
<div id="add_folder_mask" class="theme-popover-mask"></div>
<script>
	jQuery(document).ready(function($) {
		<#if folderFiles.list?? && (folderFiles.list?size > 0)>
			<#list folderFiles.list as folder>
				<#if folder.suffix == ''>
				    var obj = $('#folder_ul').find('div[object_id="${folder.id}"]')
				    folderOnClickFolder(obj,0);	
				</#if>
			</#list>
		</#if>
	});
	var pageOptions = {  
        currentPage: $('#imgPageNum').val(),  
        totalPages: $('#imgLastPage').val(),  
        size:"normal",  
        alignment:"center",  
        itemTexts: function (type, page, current) {  
            switch (type) {  
                case "first":  
                    return "第一页";  
                case "prev":  
                    return "<";  
                case "next":  
                    return ">";  
                case "last":  
                    return "最后页";  
                case "page":  
                    return  page;  
            }                 
        },  
        onPageClicked: function (e, originalEvent, type, page) {  
			$('#imgPageNum').val(page);
            refreshContent();
        }  
    };
    $('#imgPage').bootstrapPaginator(pageOptions); 
</script>
</body>
</html>
