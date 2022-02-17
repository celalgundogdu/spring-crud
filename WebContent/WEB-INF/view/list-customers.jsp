<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.example.springdemo.util.SortUtils"%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
		integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
		crossorigin="anonymous">
	<link type="text/css" rel="stylesheet"
		href="${pageContext.request.contextPath }/resources/css/style.css">
	<title>List Customers</title>
</head>

<body>

	<div class="container">

		<header>
			<h2 class="text-primary text-center my-4 py-3">Customer
				Relationship Manager</h2>
		</header>

		<div class="d-flex justify-content-between mb-4">
			<button type="button" class="btn btn-outline-primary"
				onClick="window.location.href='showAddForm'; return false;">Add
				Customer</button>
			<nav class="navbar navbar-dark">
				<form:form action="search" method="GET" class="form-inline">
					<input class="form-control mr-2" type="search" name="customerName"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form:form>
			</nav>
		</div>

		<c:url var="sortLinkFirstName" value="/customer/list">
			<c:param name="sorting"
				value="<%=Integer.toString(SortUtils.FIRST_NAME)%>" />
		</c:url>
		<c:url var="sortLinkLastName" value="/customer/list">
			<c:param name="sorting"
				value="<%=Integer.toString(SortUtils.LAST_NAME)%>" />
		</c:url>
		<c:url var="sortLinkEmail" value="/customer/list">
			<c:param name="sorting" value="<%=Integer.toString(SortUtils.EMAIL)%>" />
		</c:url>

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col"><a href="${sortLinkFirstName}">First Name</a></th>
					<th scope="col"><a href="${sortLinkLastName}">Last Name</a></th>
					<th scope="col"><a href="${sortLinkEmail}">Email</a></th>
					<th scope="col">Action</th>
				</tr>
			</thead>

			<tbody>

				<c:forEach var="customer" items="${customers}">

					<c:url var="updateLink" value="/customer/showUpdateForm">
						<c:param name="customerId" value="${customer.id}" />
					</c:url>
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${customer.id}" />
					</c:url>

					<tr>
						<td>${customer.firstName}</td>
						<td>${customer.lastName}</td>
						<td>${customer.email}</td>
						<td><a href="${updateLink}" class="btn btn-warning mr-2">UPDATE</a>
							<button type="button" class="btn btn-danger" data-toggle="modal"
								data-target="#exampleModal-${customer.id}">DELETE</button> <!-- Modal -->
							<div class="modal fade" id="exampleModal-${customer.id}"
								tabindex="-1" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">Are you sure you want to delete
											this customer?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<a href="${deleteLink}" class="btn btn-danger">Delete</a>
										</div>
									</div>
								</div>
							</div></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
		integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
		crossorigin="anonymous"></script>
</body>

</html>