<%@page import="com.entity.Doctor"%>
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
<%@ include file="../components/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@  include file="navbar.jsp"%>

	<div class="container p-5">
		<%
		Doctor d= (Doctor) session.getAttribute("doctObj");
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		%>
		<div class="row">
			<!-- Doctor Card -->
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><%= dao.countDoctor() %>
						</p>
					</div>
				</div>
			</div>

			<!-- Appointment Card -->
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br> <%= dao.countAppointmentByDoctorId(d.getId()) %>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>