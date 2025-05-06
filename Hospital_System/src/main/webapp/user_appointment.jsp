<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@include file="../components/allcss.jsp"%>

<style>
.paint-card {
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url("img/building.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>

<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img src="img/doc4.jpg" alt="Doctor" width="400px" height="700px" class="img-fluid">
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>

						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<p class="fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="add_appoint" method="post">
							<input type="hidden" name="userid" value="${UserObj.id}">

							<div class="col-md-6">
								<label class="form-label">Full Name</label>
								<input required type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label class="form-label">Gender</label>
								<select class="form-control" name="gender" required>
									<option value="">--Select--</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label class="form-label">Age</label>
								<input required type="number" class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label class="form-label">Appointment Date</label>
								<input type="date" class="form-control" required name="appoint_date">
							</div>

							<div class="col-md-6">
								<label class="form-label">Email</label>
								<input required type="email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label class="form-label">Phone No</label>
								<input maxlength="10" required type="text" class="form-control" name="phno" pattern="\d{10}" title="Enter 10 digit phone number">
							</div>

							<div class="col-md-6">
								<label class="form-label">Diseases</label>
								<input required type="text" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label class="form-label">Doctor</label>
								<select required class="form-control" name="doct">
									<option value="">--Select--</option>
									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctors();
									for (Doctor d : list) {
									%>
										<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="col-md-12">
								<label class="form-label">Full Address</label>
								<textarea required name="address" class="form-control" rows="3"></textarea>
							</div>

							<div class="col-md-12 text-center">
								<c:choose>
									<c:when test="${empty UserObj}">
										<a href="user_login.jsp" class="btn btn-success">Login to Submit</a>
									</c:when>
									<c:otherwise>
										<button type="submit" class="btn btn-success">Submit</button>
									</c:otherwise>
								</c:choose>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
