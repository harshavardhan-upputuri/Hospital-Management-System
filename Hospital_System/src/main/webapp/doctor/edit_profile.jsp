<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
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
	<div class="container ">
		<div class="row p-4">
			<div class="col-md-4 ">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<c:if test="${not empty errorMsg}">
						<p class="fs-4 text-center text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<c:if test="${not empty succMsg}">
						<p class="fs-4 text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<div class="card-body">
						<form action="../doctorPasswordChange" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="password"
									name="newPassword" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Enter Old Password</label> <input type="password"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctObj.id}" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
				<p class="text-center fs-3">Edit Profile</p>
				<c:if test="${not empty errorMsgd}">
						<p class="fs-4 text-center text-danger">${errorMsgd}</p>
						<c:remove var="errorMsgd" scope="session" />
					</c:if>

					<c:if test="${not empty succMsgd}">
						<p class="fs-4 text-center text-success">${succMsgd}</p>
						<c:remove var="succMsgd" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullname" required class="form-control" value="${doctObj.fullName }" />
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" required class="form-control" value="${doctObj.dob }"/>
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" required class="form-control" value="${doctObj.qualification }"/>
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" required class="form-control">
									<option   >${doctObj.specialist }</option>

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
									name="email" required class="form-control" value="${doctObj.email }"/>
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									name="mobno" required class="form-control" value="${doctObj.mobNo }"/>
							</div>
							
							<input type="hidden" name="id" value="${doctObj.id }">
							 

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>