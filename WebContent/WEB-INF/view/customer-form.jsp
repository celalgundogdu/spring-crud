<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<!--  Bootstrap -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
		integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
		crossorigin="anonymous">
	<title>Save Customer</title>
</head> 
<body>
	
	<div class="container">
		
		<header>
			<h2 class="text-primary text-center my-4 py-3">Customer Form</h2>
			<a href="${pageContext.request.contextPath}/customer/list" class="btn btn-outline-secondary mb-3">Back</a>
		</header>
		
		<form:form action="saveCustomer" modelAttribute="customer" method="POST" class="mt-3">
			<form:hidden path="id"/>
			<div class="form-group">
			    <label>First Name</label>
			    <form:input path="firstName" class="form-control" />
  			</div>
			<div class="form-group">
			    <label>Last Name</label>
			    <form:input path="lastName" class="form-control" />
  			</div>
  			<div class="form-group">
			    <label>Email</label>
			    <form:input path="email" class="form-control" />
  			</div>
  			<button type=submit class="btn btn-success btn-lg btn-block">Save Customer</button>
		</form:form>
		
	</div>

</body>

</html>