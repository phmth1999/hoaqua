<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
<title>Thêm sản phẩm</title>

</head>
<body>
<div class="main-content">
	<div class="main-content-inner">
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<form:form action="luu" method="post" class="form-horizontal" role="form" id="formSubmit" modelAttribute="product">
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Tên sản phẩm</label>
								<div class="col-sm-9">
									<form:input  path="name" cssClass="col-xs-10 col-sm-5" id="name" onkeyup="Ajaxf()"/>
									&nbsp; &nbsp; &nbsp;
									<span id="nameMsg" style="font-size: 150%;color: red" ></span>
								</div>
								
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Giá</label>
								<div class="col-sm-9">
									<form:input path="price" cssClass="col-xs-10 col-sm-5"/>
								</div>
						</div>
						<div class="form-group">
						  	<label for="shortDescription" class="col-sm-3 control-label no-padding-right">Mô tả ngắn:</label>
						  	<div class="col-sm-9">
						  		<form:textarea path="shortDescription" rows="5" cols="10" cssClass="form-control" id="shortDescription"/>
						  	</div>
						</div>
						<div class="form-group">
						<label  class="col-sm-3 control-label no-padding-right"></label>
						  	<div class="col-sm-9">
						  	<button class="btn btn-info" type="submit" id="btnNew">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Thêm sản phẩm
												</button>
												&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Hủy
											</button>
						  	</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>	

<script type="text/javascript">
function Ajaxf() {
$("#name").blur(function(){
	var name1=$("#name").val();
	console.log(name1);
	$.ajax({
		url: "/hoaqua/quan-tri/san-pham/validateName",
		type: "post",
		data:"name="+name1,
		dataType: "text",
		success:function(result){
			if(result=='Duplicate'){
				$("#nameMsg").html("Tên sản phẩm đã tồn tại");
				$("#name").focus();
				$("#btnNew").prop("disabled",true);
			}else{
				$("#nameMsg").html("");
				$("#btnNew").prop("disabled",false);
			}
		}
	});
});
}

</script>
</body>
</html>