<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
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
<link href="../resources/css/person.css" rel="stylesheet">
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
		<div class="row">
			<h2 class="people_categroy">Researcher or Student</h2>
			<hr>
		</div>
		<div class="row person">
			<div class="col-sm-12 col-sm-2 col-md-2 col-lg-2 img-container">
				<img class="img-circle"
							src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
							alt="Generic placeholder image"
							style="width: 100px; height: 100px;">
			</div>
			<div class="col-sm-12 col-sm-4 col-md-4 col-lg-4 text-left">
				<h3>English Name</h3>
				<h4>中文名</h4>
				<p>
					<a href="mailto:yangdeqing@fudan.edu.cn">###@fudan.edu.cn</a>
				</p>
				<p>Shanghai Key Laboratory of Data Science</p>
				<p>Graph Data Management Laboratory</p>
				<p>School of Computer Science</p>
				<p>Fudan University, Shanghai, China</p>
			</div>
		</div>
		<div class="row person">
			<div class="col-lg-12">
				<h3>Research Interests</h3>
				<p>data mining, social network analysis, knowledge graph,
					recommender systems</p>
			</div>
			<div class="col-lg-12">
				<h3>Education</h3>
				<ul>
					<li>Ph.D in School of Computer Science, Fudan University,
						June, 20##</li>
					<li>M.Sc. in Dept. of Computer Science and Engineering, Fudan
						University, June, 20##</li>
					<li>B.Sc. in Dept. of Computer Science and Engineering, Fudan
						University, June, 20##</li>
				</ul>
			</div>
			<div class="col-lg-12">
				<h3>Publications</h3>
				<h5>Conference Proceedings</h5>
				<ul style="list-style-type: decimal;">
					<li><strong>Name</strong>, el al,
						#######</li>
				</ul>
				<h5>Journals</h5>
				<ul style="list-style-type: decimal;">
					<li><strong>Name</strong>, #######</li>
				</ul>
				<h5>Book Chapters</h5>
				<ul style="list-style-type: decimal;">
					<li><strong>Name</strong>, #######</li>
				</ul>
				<h3>Something else</h3>
				<ul style="list-style-type: decimal;">
					<li>#####</li>
					<li>#####</li>
					<li>#####</li>
				</ul>
			</div>
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
