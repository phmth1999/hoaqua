<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách tài khoản</title>
	</head>

	<body>
	<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
		                <c:url value="/quan-tri/san-pham/danh-sach" var="pagedLink">
			            <c:param name="page" value="~" />
		                </c:url>
		<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Trang chủ</a>
							</li>
						</ul>
					</div>
					<div align="center" style="margin-top: 10px;" >
					<form  method="get" action="search">
                                            <input size="50" type="text" name="keyword" id="productName" />
                                            <input style="height:30px; width:50px;" type="submit" value="Search" />
                                            </form>
                    </div>
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<c:url var="createNewURL" value="/quan-tri/bai-viet/chinh-sua"/>
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm bài viết' href="<c:url value='/quan-tri/san-pham/them-moi'/>">
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa bài viết'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th><input type="checkbox" id="checkAll"></th>
														<th>Họ và tên</th>
														<th>Hình ảnh</th>
														<th>Địa chỉ</th>
														<th>Tên quyền</th>
														<th>Thao tác</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${pagedListHolder.pageList}">
														<tr>
															<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
															<td>${item.hoten}</td>
															<td>${item.hinhanh}</td>
															<td>${item.diachi}</td>
															<td>${item.tenquyen}</td>
															<td>
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href="<c:url value='/quan-tri/san-pham/chinh-sua?id=${item.id}'/>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
																 &nbsp;&nbsp;&nbsp;
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Xóa bài viết" href="<c:url value='/quan-tri/san-pham/xoa?id=${item.id}'/>"><i class="fa fa-trash-o bigger-110" aria-hidden="true"></i>
																</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div class="pull-right tableTools-container">
										  		<tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
										    </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
		<!-- /.main-content -->
		<script type="text/javascript">
	$(document).ready(function() {
		$('#productName').autocomplete({
			source : '/hoaqua/quan-tri/san-pham/autocompletesearch'
		});
	});
</script>
	</body>
	</html>