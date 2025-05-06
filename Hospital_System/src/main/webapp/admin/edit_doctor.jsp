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
			<!-- Add Doctor Form -->
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>

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
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						Doctor d=dao2.getDoctorById(id);
						%>

						<!-- Doctor Form -->
						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullname" required class="form-control" value="<%= d.getFullName() %>"/>
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" required class="form-control" value="<%= d.getDob() %>"/>
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" required class="form-control" value="<%= d.getQualification() %>"/>
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" required class="form-control">
									<option >value="<%= d.getSpecialist() %>"</option>

									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									name="email" required class="form-control" value="<%= d.getEmail() %>" />
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									name="mobno" required class="form-control" value="<%= d.getMobNo() %>"/>
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="text" name="password" required class="form-control" value="<%= d.getPassword() %>"/>
							</div>
							
							<input type="hidden" name="id" value="<%= d.getId() %>">
							

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>


</body>
</html>