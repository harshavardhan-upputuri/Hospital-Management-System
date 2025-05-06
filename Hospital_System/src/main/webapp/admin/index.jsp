<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>
	<%@ include file="navbar.jsp"%>

	<div class="container p-5">

		<!-- Display Error Message -->
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>

		<!-- Display Success Message -->
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<%
			DoctorDao dao= new DoctorDao(DBConnect.getConn());
		%>
		<div class="row">

			<!-- Doctor Count -->
			<div class="col-md-4 mt-2">
				<a href="doctor.jsp" style="text-decoration: none;">
					<div class="card paint-card">
						<div class="card-body text-center text-success">
							<i class="fas fa-user-md fa-3x"></i><br>
							<p class="fs-4 text-center">Doctor</p>
							<p class="fs-5 text-dark"><%= dao.countDoctor() %></p>
						</div>
					</div>
				</a>
			</div>

			<!-- User Count -->
			<div class="col-md-4 mt-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">User</p>
						<p class="fs-5 text-dark"><%= dao.countUsers() %></p>
					</div>
				</div>
			</div>

			<!-- Appointment Count -->
			<div class="col-md-4 mt-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">Total Appointments</p>
						<p class="fs-5 text-dark"><%= dao.countAppointment() %></p>
					</div>
				</div>
			</div>

			<!-- Specialist Count -->
			<div class="col-md-4 mt-2">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="fas fa-stethoscope fa-3x"></i><br>
						<p class="fs-4 text-center">Specialist</p>
						<p class="fs-5 text-dark"><%= dao.countSpecialist() %></p>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist" method="post">
						<div class="form-group">
							<label>Enter Specialist Name</label> <input type="text"
								name="specName" class="form-control">

							<div class="text-center mt-3">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>


</body>
</html>