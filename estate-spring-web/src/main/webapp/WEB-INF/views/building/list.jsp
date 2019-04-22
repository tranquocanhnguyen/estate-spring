<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách tòa nhà</title>
	</head>

	<body>
		<div class="main-content">
		<form:form action="" id="formSubmit" method="get" commandName="model">

				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Trang chủ</a>
							</li>
						</ul>
						<!-- /.breadcrumb -->
					</div>
					<div class="page-content">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">
									${message}
							</div>
						</c:if>
						<div class="row">
							<div class="col-xs-12">
								<div class="widget-box table-filter">
									<div class="widget-body">
										<div class="widget-main">
											<div class="form-horizontal">
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right">Tên tòa nhà</label>
													<div class="col-sm-9">
														<%--<input type="text" id="name" name="name" class="form-control" value="${model.name}"/>--%>
														<form:input path="name" cssClass="form-control"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right">Đường</label>
													<div class="col-sm-9">
														<%--<input type="text" id="street" name="street" class="form-control" value="${model.street}"/>--%>
														<form:input path="street" cssClass="form-control"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right">Số tầng hầm</label>
													<div class="col-sm-9">
														<%--<input type="text" id="numberOfBasement" name="numberOfBasement" class="form-control" value="${model.numberOfBasement}"/>--%>
														<form:input path="numberOfBasement" cssClass="form-control"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"></label>
													<div class="col-sm-9">
														<%--<c:forEach var="type" items="${buildingTypes}">
															<input type="checkbox" class="form-check-input" name="buildingTypes"
																   value="${type.key}">
															<label> ${type.value}</label>
														</c:forEach>--%>
														<form:select path="buildingTypes" id="buildingTypes">
															<form:option value="" label="--- Chọn loại tòa nhà ---"/>
															<form:options items="${buildingTypes}"/>
														</form:select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"></label>
													<div class="col-sm-9">
														<button id="btnSearch" type="button" class="btn btn-sm btn-success">
															Tìm kiếm
															<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm tòa nhà' href='#'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button" disabled
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa tòa nhà'>
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
											<table class="table table-bordered" id="buildingTable">
												<thead>
													<tr>
														<th><input type="checkbox" class="check-box-element" id="checkAll"/></th>
														<th>Tên tòa nhà</th>
														<th>Diện tích sàn</th>
														<th>Quận</th>
														<th>Phường</th>
														<th>Đường</th>
														<th>Số tầng hầm</th>
														<th>Hướng</th>
														<th>Hạng</th>
														<th>Mô tả diện tích</th>
														<th>Mô tả giá thuê</th>
														<th>Tên quản lý</th>
														<th>Điện thoại quản lý</th>
														<th>Thao tác</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model.listResult}">
														<tr>
															<td><input type="checkbox" class="check-box-element" id="checkbox_${item.id}" value="${item.id}"/></td>
															<td>${item.name}</td>
															<td>${item.buildingArea}</td>
															<td>${item.district}</td>
															<%--<td>${item.ward}</td>--%>
															<td>abc</td>
															<td>${item.street}</td>
															<td>${item.numberOfBasement}</td>
															<td>${item.direction}</td>
															<td>abc123</td>
															<%--<td>${item.levelBuilding}</td>--%>
															<td>${item.areaDescription}</td>
															<td>${item.costDescription}</td>
															<td>${item.managerName}</td>
															<td>${item.managerPhone}</td>
															<td>
																<%--<c:url var="editURL" value="/admin-new">
																	<c:param name="type" value="edit"/>
																	<c:param name="id" value="${item.id}"/>
																</c:url>--%>
																<button class="btn btn-xs btn-primary btn-edit"
																			data-toggle="tooltip" type="button" title='Giao tòa nhà'
																			id="btnAssignBuilding" buildingId="${item.id}">
																		<i class="fa fa-tasks"></i>
																</button>
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật tòa nhà" href='#'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<ul class="pagination" id="pagination"></ul>
											<input type="hidden" value="" id="page" name="page"/>
											<input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form:form>
		</div>
		<!-- /.main-content -->

		<script>
			$(document).ready(function () {

            });
			var totalPages = ${model.totalPage};
			var currentPage = ${model.page};
            var limit = 5;
			$(function () {
				window.pagObj = $('#pagination').twbsPagination({
					totalPages: totalPages,
					visiblePages: 10,
					startPage: currentPage,
					onPageClick: function (event, page) {
						if (currentPage != page) {
							$('#maxPageItem').val(limit);
							$('#page').val(page);
							$('#formSubmit').submit();
						}
					}
				});
			});

			$('#btnSearch').click(function () {
                $('#maxPageItem').val(limit);
                $('#page').val(1);
                $('#formSubmit').submit();
            });

		</script>
	</body>

	</html>