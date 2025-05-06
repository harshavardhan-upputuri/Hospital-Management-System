<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../components/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
	
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center mb-4">Doctor Details</p>
						
						<!-- Error Message -->
						<c:if test="${not empty errorMsg}">
							<p class="fs-5 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<!-- Success Message -->
						<c:if test="${not empty succMsg}">
							<div class="fs-5 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<table
							class="table table-bordered table-striped table-hover table-sm mt-2">
							<thead class="table-success text-center small">
								<tr>
									<th>Full Name</th>
									<th>DOB</th>
									<th>Qualification</th>
									<th>Specialist</th>
									<th>Email</th>
									<th>Mob No</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody class="small text-center align-middle">
								<%
								DoctorDao ddao = new DoctorDao(DBConnect.getConn());
								List<Doctor> dlist = ddao.getAllDoctors();
								for (Doctor d : dlist) {
								%>
								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialist()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobNo()%></td>
									<td>
									<a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-outline-primary me-1">Edit</a> 
									<a href="../deleteDoctor?id=<%=d.getId()%>" class="btn btn-sm btn-outline-danger">Delete</a></td>
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