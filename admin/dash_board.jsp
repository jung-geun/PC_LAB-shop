<%@page import="project.ProductDao"%>
<%@page import="project.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserDBBean userdao = UserDBBean.getInstance();
ProductDao prodao = ProductDao.getInstance();
int user_count = userdao.getMemberCount();
int product_count = prodao.getProductCount();
%>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
</div>

<!-- Content Row -->
<div class="row">

	<!-- Earnings (Monthly) Card Example -->
	<div class="col-xl-3 col-md-6 mb-4">
		<a href="member.jsp">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-primary text-uppercase mb-1">
								Members :
								<%=user_count%></div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								<fmt:formatNumber value="${monthlyEarnings}" type="currency" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</a>
	</div>

	<!-- Earnings (Monthly) Card Example -->
	<div class="col-xl-3 col-md-6 mb-4">
		<a href="product.jsp">

			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">
								Products :
								<%=product_count%></div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								<fmt:formatNumber value="${annualEarnings }" type="currency" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</a>
	</div>

	<!-- Earnings (Monthly) Card Example -->
	<div class="col-xl-3 col-md-6 mb-4">
		<div class="card border-left-info shadow h-100 py-2">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div
							class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
						</div>
						<div class="row no-gutters align-items-center">
							<div class="col-auto">
								<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${Tasks }</div>
							</div>
							<div class="col"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Pending Requests Card Example -->
	<div class="col-xl-3 col-md-6 mb-4">
		<div class="card border-left-warning shadow h-100 py-2">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div
							class="text-xs font-weight-bold text-warning text-uppercase mb-1">
							Q & A</div>
						<div class="h5 mb-0 font-weight-bold text-gray-800">${noReply }</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>