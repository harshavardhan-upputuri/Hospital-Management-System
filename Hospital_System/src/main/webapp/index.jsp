<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Page</title>
<%@ include file="components/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<%
	Connection conn = DBConnect.getConn();
	/* out.print(conn); */
	%>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/doc1.avif" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/doc2.avif" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/doc3.avif" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="container p-3">
		<p class="text-center fs-2">Key Features of our Hospital</p>

		<div class="row">
			<!-- Cards Column (Left) -->
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-6 mb-3">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mb-3">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mb-3">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mb-3">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Expert Doctors</p>
								<p>Our hospital has highly skilled and experienced doctors
									to provide the best care.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Image Column (Right) -->
			<div class="col-md-4 d-flex align-items-center">
				<img src="img/doc2.avif" alt="Doctor Image"
					class="img-fluid rounded shadow w-100">
			</div>
		</div>
	</div>

	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>

		<div class="row justify-content-center">

			<!-- Team Member 1 -->
			<div class="col-md-3 mb-4 d-flex">
				<div class="card paint-card h-100 w-100">
					<div class="card-body text-center d-flex flex-column">
						<img src="img/doc1.avif" alt="Samuani Simi" width="250"
							height="300" class="img-fluid rounded mb-2 mx-auto">
						<p class="fw-bold fs-5 mt-auto">Samuani Simi</p>
						<p class="fs-6 text-muted">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<!-- Team Member 2 -->
			<div class="col-md-3 mb-4 d-flex">
				<div class="card paint-card h-100 w-100">
					<div class="card-body text-center d-flex flex-column">
						<img src="img/doc2.avif" alt="Dr. Siva Kumar" width="250"
							height="300" class="img-fluid rounded mb-2 mx-auto">
						<p class="fw-bold fs-5 mt-auto">Dr. Siva Kumar</p>
						<p class="fs-6 text-muted">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<!-- Team Member 3 -->
			<div class="col-md-3 mb-4 d-flex">
				<div class="card paint-card h-100 w-100">
					<div class="card-body text-center d-flex flex-column">
						<img src="img/doc1.avif" alt="Samuani Simi" width="250"
							height="300" class="img-fluid rounded mb-2 mx-auto">
						<p class="fw-bold fs-5 mt-auto">Samuani Simi</p>
						<p class="fs-6 text-muted">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<!-- Team Member 4 -->
			<div class="col-md-3 mb-4 d-flex">
				<div class="card paint-card h-100 w-100">
					<div class="card-body text-center d-flex flex-column">
						<img src="img/doc2.avif" alt="Dr. Siva Kumar" width="250"
							height="300" class="img-fluid rounded mb-2 mx-auto">
						<p class="fw-bold fs-5 mt-auto">Dr. Siva Kumar</p>
						<p class="fs-6 text-muted">(Chief Doctor)</p>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@ include file="components/footer.jsp"%>


</body>
</html>