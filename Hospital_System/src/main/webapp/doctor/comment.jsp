<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/allcss.jsp"%>

<style>
.paint-card {
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url("../img/building.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@ include file="navbar.jsp"%>
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>
						
						<%
							int id= Integer.parseInt(request.getParameter("id"));
					 
							AppointmentDAO dao= new AppointmentDAO(DBConnect.getConn()); 
							Appointment ap = dao.getAllAppointmentById(id);
						%>

						<form class="row" action="../updateStatus" method="post">
							<!-- Patient Name -->
							<div class="col-md-6">
								<label>Patient Name</label> <input type="text" readonly value=<%= ap.getFullName() %>
									class="form-control">
							</div>

							<!-- Age -->
							<div class="col-md-6">
								<label>Age</label> <input type="text" readonly value=<%= ap.getAge() %>
									class="form-control">
							</div>

							<!-- Mobile Number -->
							<div class="col-md-6">
								<br> <label>Mob No</label> <input type="text" readonly
									value=<%= ap.getPhNo() %> class="form-control">
							</div>

							<!-- Diseases -->
							<div class="col-md-6">
								<br> <label>Diseases</label> <input type="text" readonly
									value=<%= ap.getDiseases() %> class="form-control">
							</div>

							<!-- Comment -->
							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea required name="comm" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<!-- Hidden Fields for id and did -->
							<input type="hidden" name="id" value=<%= ap.getId() %>> <input
								type="hidden" name="did" value=<%= ap.getDoctorId() %>>

							<!-- Submit Button -->
							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>