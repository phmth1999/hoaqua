<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
<title>Chỉnh sửa sản phẩm</title>
</head>
<body>
<div class="main-content">
	<div class="main-content-inner">
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<form:form action="luu" method="post" class="form-horizontal" role="form" id="formSubmit" modelAttribute="product">
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"></label>
								<div class="col-sm-9">
                                   <form:hidden path="id"/>
								</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Tên sản phẩm</label>
								<div class="col-sm-9">
									<form:input path="tensanpham" cssClass="col-xs-10 col-sm-5"/>
								</div>
						</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">hinh anh</label>
								<div class="col-sm-9">
									<form:input path="hinhanh" cssClass="col-xs-10 col-sm-5"/>
								</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">so luong</label>
								<div class="col-sm-9">
									<form:input path="soluong" cssClass="col-xs-10 col-sm-5"/>
								</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">gia</label>
								<div class="col-sm-9">
									<form:input path="gia" cssClass="col-xs-10 col-sm-5"/>
								</div>
						</div>
						<div class="form-group">
						  	<label for="shortDescription" class="col-sm-3 control-label no-padding-right">mieuta</label>
						  	<div class="col-sm-9">
						  		<form:textarea path="mieuta" rows="5" cols="10" cssClass="form-control" id="mieuta"/>
						  	</div>
						</div>
						<div class="form-group">
						<label  class="col-sm-3 control-label no-padding-right"></label>
						  	<div class="col-sm-9">
						  		<button class="btn btn-info" type="submit" id="btnAddOrUpdateNew">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Cập nhật sản phẩm
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

<script>
</script>
</body>
</html>
