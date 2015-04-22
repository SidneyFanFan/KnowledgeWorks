<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String rootPath = application.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Knowledge Works</title>

<!-- Bootstrap core CSS -->
<link href="../resources/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../resources/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Custom styles for this template -->
<link href="../resources/css/people.css" rel="stylesheet">
</head>
<!-- NAVBAR
================================================== -->
<body>
	<div class="navbar-wrapper">
		<div class="container">

			<nav class="navbar navbar-inverse navbar-static-top"
				role="navigation">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="/KnowledgeWorks">Knowledge Works</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a href="/KnowledgeWorks">Home</a></li>
							<li class="active"><a href="/KnowledgeWorks/people">People</a></li>
							<li><a href="#about">About</a></li>
							<li><a href="#contact">Contact</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li class="dropdown-header">Nav header</li>
									<li><a href="#">Separated link</a></li>
									<li><a href="#">One more separated link</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>

		</div>
	</div>

	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->

	<div class="container marketing">
		<!-- <h1>Knowledge Bases</h1> -->
		<!-- Three columns of text below the carousel -->
		<!-- name,type,school,image,title,area,email,page -->
		<div class="row">
			<!-- Researchers -->
			<h2 class="people_categroy">Researchers</h2>
			<hr>
			<c:forEach items="${director}" var="item">
				<div class="col-sm-12 col-sm-4 col-md-3 col-lg-3">
					<c:if test="${item[3]=='#'}">
						<img class="img-circle"
							src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
							alt="Generic placeholder image"
							style="width: 100px; height: 100px;">
					</c:if>
					<c:if test="${item[3]!='#'}">
						<img class="img-circle" src="../resources/image/people/${item[3]}"
							alt="Generic placeholder image"
							style="width: 100px; height: 100px;">
					</c:if>
					<h2>
						<!-- name -->
						<c:out value="${item[0]}"></c:out>
					</h2>
					<p>
						<!-- title -->
						<c:out value="${item[4]}"></c:out>
						<br>
						<c:out value="Director"></c:out>
					</p>
					<p style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
						<!-- interest -->
						<c:set var="paras" scope="request" value="${item[5]}" />
						<%
							String paras = (String) request.getAttribute("paras");
								String[] parasSplit = paras.split(";");
								request.setAttribute("parasSplit", parasSplit);
						%>
						<c:forEach items="${parasSplit}" var="interest">
							<span title="${interest}"><c:out value="${interest}"></c:out></span>
							<br>
						</c:forEach>
					</p>
					<p>
						<!-- email -->
						<a href="mailto:${item[6]}" role="button"><c:out
								value="${item[6]}"></c:out></a>
					</p>
					<p>
						<!-- page -->
						<a href="${item[7]}" role="button">Personal Page</a>
					</p>
				</div>
			</c:forEach>
			<c:forEach items="${researchers}" var="item">
				<div class="col-sm-12 col-sm-4 col-md-3 col-lg-3">
					<c:if test="${item[3]=='#'}">
						<img class="img-circle"
							src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
							alt="Generic placeholder image"
							style="width: 100px; height: 100px;">
					</c:if>
					<c:if test="${item[3]!='#'}">
						<img class="img-circle" src="../resources/image/people/${item[3]}"
							alt="Generic placeholder image"
							style="width: 100px; height: 100px;">
					</c:if>
					<h2>
						<!-- name -->
						<c:out value="${item[0]}"></c:out>
					</h2>
					<p>
						<!-- title -->
						<c:out value="${item[4]}"></c:out>
					</p>
					<p style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
						<!-- interest -->
						<c:set var="paras" scope="request" value="${item[5]}" />
						<%
							String paras = (String) request.getAttribute("paras");
								String[] parasSplit = paras.split(";");
								request.setAttribute("parasSplit", parasSplit);
						%>
						<c:forEach items="${parasSplit}" var="interest">
							<span><c:out value="${interest}"></c:out></span>
							<br>
						</c:forEach>
					</p>
					<p>
						<!-- email -->
						<a href="mailto:${item[6]}" role="button"><c:out
								value="${item[6]}"></c:out></a>
					</p>
					<p>
						<!-- page -->
						<a href="${item[7]}" role="button">Personal Page</a>
					</p>
				</div>
			</c:forEach>
			<!-- /Researchers -->
		</div>
		<!-- .row -->
		<!-- name,type,school,image,title,area,email,page -->
		<div class="row">
			<!-- Advisory Committee -->
			<h2 class="people_categroy">Advisory Committee</h2>
			<hr>
			<c:forEach items="${acs}" var="item">
				<div class="col-sm-12 col-sm-4 col-md-3 col-lg-3">
					<c:if test="${item[3]=='#'}">
						<img class="img-circle"
							src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
							alt="Generic placeholder image"
							style="width: 100px; height: 100px;">
					</c:if>
					<c:if test="${item[3]!='#'}">
						<img class="img-circle" src="../resources/image/people/${item[3]}"
							alt="Generic placeholder image"
							style="width: 100px; height: 100px;">
					</c:if>
					<h2>
						<!-- name -->
						<c:out value="${item[0]}"></c:out>
					</h2>
					<p>
						<!-- title -->
						<c:out value="${item[4]}"></c:out>
						<br>
					</p>
					<p style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
						<!-- interest -->
						<c:set var="paras" scope="request" value="${item[5]}" />
						<%
							String paras = (String) request.getAttribute("paras");
								String[] parasSplit = paras.split(";");
								request.setAttribute("parasSplit", parasSplit);
						%>
						<c:forEach items="${parasSplit}" var="interest">
							<span><c:out value="${interest}"></c:out></span>
							<br>
						</c:forEach>
					</p>
					<p>
						<!-- email -->
						<a href="mailto:${item[6]}" role="button"><c:out
								value="${item[6]}"></c:out></a>
					</p>
					<p>
						<!-- page -->
						<a href="${item[7]}" role="button">Personal Page</a>
					</p>
				</div>
			</c:forEach>
			<!-- /Advisory Committee -->
		</div>
		<!-- .row -->
		<div class="row">
			<!-- Students -->
			<h2 class="people_categroy">Students</h2>
			<hr>
			<c:forEach items="${phds}" var="item">
				<div class="col-sm-12 col-sm-4 col-md-3 col-lg-3">
					<c:if test="${item[3]=='#'}">
						<img class="img-circle"
							src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
							alt="Generic placeholder image"
							style="width: 100px; height: 100px;">
					</c:if>
					<c:if test="${item[3]!='#'}">
						<img class="img-circle" src="../resources/image/people/${item[3]}"
							alt="Generic placeholder image"
							style="width: 100px; height: 100px;">
					</c:if>
					<h2>
						<!-- name -->
						<c:out value="${item[0]}"></c:out>
					</h2>
					<p>
						<!-- title -->
						<c:out value="${item[4]}"></c:out>
						<br>
					</p>
					<p style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
						<!-- interest -->
						<c:set var="paras" scope="request" value="${item[5]}" />
						<%
							String paras = (String) request.getAttribute("paras");
								String[] parasSplit = paras.split(";");
								request.setAttribute("parasSplit", parasSplit);
						%>
						<c:forEach items="${parasSplit}" var="interest">
							<span><c:out value="${interest}"></c:out></span>
							<br>
						</c:forEach>
					</p>
					<p>
						<!-- email -->
						<a href="mailto:${item[6]}" role="button"><c:out
								value="${item[6]}"></c:out></a>
					</p>
					<p>
						<!-- page -->
						<a href="${item[7]}" role="button">Personal Page</a>
					</p>
				</div>
			</c:forEach>

			<!-- /.row -->
		</div>

		<!-- START THE FEATURETTES -->

		<hr class="featurette-divider people_categroy">

		<!-- FOOTER -->
		<footer>
			<p class="pull-right">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot;
				<a href="#">Terms</a>
			</p>
		</footer>

	</div>
	<!-- /.container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/dist/js/bootstrap.min.js"></script>
	<!-- <script src="../../assets/js/docs.min.js"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../resources/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
