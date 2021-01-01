<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Id: ${product.id}</label>
								<div class="col-sm-9">
									<form:hidden  path="id" cssClass="col-xs-10 col-sm-5" />
								</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Tên sản phẩm</label>
								<div class="col-sm-9">
									<form:input  path="tensanpham" cssClass="col-xs-10 col-sm-5" />
								</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Hình ảnh</label>
								<div class="col-sm-9">
									<form:input path="hinhanh" cssClass="col-xs-10 col-sm-5"/>
								</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Số lượng</label>
								<div class="col-sm-9">
									<form:input path="soluong" cssClass="col-xs-10 col-sm-5"/>
								</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Giá</label>
								<div class="col-sm-9">
									<form:input path="gia" cssClass="col-xs-10 col-sm-5"/>
								</div>
						</div>
						<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Miêu tả</label>
						  	<div class="col-sm-9">
						  		<form:textarea path="mieuta" rows="5" cols="10" cssClass="form-control" />
						  	</div>
						</div>
						<div class="form-group">
						<label  class="col-sm-3 control-label no-padding-right"></label>
						  	<div class="col-sm-9">
						  	<button class="btn btn-info" type="submit" >
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
