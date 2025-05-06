<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.entity.Doctor"%>
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


	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>

						<!-- Error Message -->
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<!-- Success Message -->
						<c:if test="${not empty succMsg}">
							<p class="fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Actions</th>
								</tr>
							</thead>

							<tbody>
								<%
								Doctor d = (Doctor) session.getAttribute("doctObj");
								AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
								List<Appointment> list = dao.getAllAppointmentByDoctorUser(d.getId());
								 
								for (Appointment ap : list) {
									 
								%>

								<tr>
									<td><%= ap.getFullName()%></td>
									<td><%= ap.getGender() %></td>
									<td><%= ap.getAge() %></td>
									<td><%= ap.getAppoinDate() %></td>
									<td><%= ap.getEmail() %></td>
									<td><%= ap.getPhNo() %></td>
									<td><%= ap.getDiseases() %></td>
									 
									<td><%= ap.getStatus()%></td>
									<td>
									<%
										if("Pending".equals(ap.getStatus())){%>
										 
											<a href="comment.jsp?id=<%= ap.getId() %>" class="btn btn-sm btn-success" >Comments</a>
											 
										<%}else{ %>
											<a href="#" class="btn btn-sm btn-success disabled" >Comments</a>
											 
										<%}
									%>
									
									
									</td>
								</tr>
								<%
								}
								%>



							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>