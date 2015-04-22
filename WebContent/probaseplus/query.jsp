<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="knowledgeBase.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// Currently I use js to replace some functions in JSP
	// Change to Java is OK
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

<title>Probase Plus</title>

<!-- Bootstrap core CSS -->
<link href="../resources/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../resources/css/dashboard.css" rel="stylesheet">
<!-- <link href="css/colorScheme.css" rel="stylesheet"> -->

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../resources/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Probase Plus</a><a
					class="navbar-brand subbrand" href="/KnowledgeWorks">Knowledge Works</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/KnowledgeWorks">Knowledge Works</a></li>
					<li><a href="#">Log in</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">Query<span class="sr-only">(current)</span></a></li>
					<li><a href="#">Instruction/Help</a></li>
					<li><a href="#">Download</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="#">Publication</a></li>
					<li><a href="#">People</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="#">GDM Lab</a></li>
				</ul>
				<footer class="sidebar-footer">
					Copy Right <span class="fontArial">©</span>
					<script>
						document.write(new Date().getFullYear());
					</script>
					GDM Lab <br> Fudan University
				</footer>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="page-header">
					<h1>Probase Query</h1>
					<h5 class="text-muted">Brief explaination of this page</h5>
				</div>
				<form class="form-inline" id="search_form" role="form">
					<div class="input-group">
						<input type="text" id="search_input" class="form-control" value="${word}">
						<span class="input-group-btn">
							<button class="btn btn-default" id="search_buttom" type="button">Search by Word</button>
						</span>
					</div>
					<br><br>
					<div class="input-group">
						<input type="text" id="search_id_input" class="form-control" value="${pbid}">
						<span class="input-group-btn">
							<button class="btn btn-default" id="search_id_buttom" type="button">Search by ID</button>
						</span>
					</div>
					<!-- /input-group -->
				</form>
				<h2 class="sub-header" id="result_title">Result</h2>
				<p>
					<span class="glyphicon glyphicon-list"></span> Statistic: "<span
						id="probase_word"></span>" has <span id="probase_concept_num"></span>
					hypernyms and <span id="probase_entity_num"></span> hyponyms
				</p>
				<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse"
						data-parent="#accordion" data-target="#collapseProbase">
						<h4 class="panel-title" id="probase_title">
							<span class="glyphicon glyphicon-search"></span> Probase
						</h4>
					</div>
					<div id="collapseProbase" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="table-responsive col-xs-6">
								<table class="table table-hover table-striped">
									<caption>Concept</caption>
									<thead>
										<tr>
											<td colspan="2">
												<div class="propager" id="probase_concept_pager">
													<a class="glyphicon glyphicon-fast-backward disabled"></a>
													<a class="glyphicon glyphicon-backward disabled"></a> <span
														class="pageNumber">0</span> <a
														class="glyphicon glyphicon-forward disabled"></a> <a
														class="glyphicon glyphicon-fast-forward disabled"></a>
												</div>
											</td>
										</tr>
										<tr>
											<th class="col-xs-6">Concept</th>
											<th class="col-xs-6">Weight</th>
										</tr>
									</thead>
									<tbody id="probase_concept_tbody">
									</tbody>
								</table>
							</div>
							<div class="table-responsive col-xs-6">
								<table class="table table-hover table-striped">
									<caption>Entity</caption>
									<thead>
										<tr>
											<td colspan="2">
												<div class="propager" id="probase_entity_pager">
													<a class="glyphicon glyphicon-fast-backward disabled"></a>
													<a class="glyphicon glyphicon-backward disabled"></a> <span
														class="pageNumber">0</span> <a
														class="glyphicon glyphicon-forward disabled"></a> <a
														class="glyphicon glyphicon-fast-forward disabled"></a>
												</div>
											</td>
										</tr>
										<tr>
											<th class="col-xs-6">Entity</th>
											<th class="col-xs-6">Weight</th>
										</tr>
									</thead>
									<tbody id="probase_entity_tbody">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<p>
					<span class="glyphicon glyphicon-list"></span> Statistic: "<span
						id="probaseplus_word"></span>" has <span id="probaseplus_concept_num"></span>
					hypernyms and <span id="probaseplus_entity_num"></span> hyponyms
				</p>
				<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse"
						data-parent="#accordion" data-target="#collapseProbaseplus">
						<h4 class="panel-title" id="probaseplus_title">
							<span class="glyphicon glyphicon-search"></span> Probase+
						</h4>
					</div>
					<div id="collapseProbaseplus" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="table-responsive col-xs-6">
								<table class="table table-hover table-striped">
									<caption>Concept</caption>
									<thead>
										<tr>
											<td colspan="2">
												<div class="propager" id="probaseplus_concept_pager">
													<a class="glyphicon glyphicon-fast-backward disabled"></a>
													<a class="glyphicon glyphicon-backward disabled"></a> <span
														class="pageNumber">0</span> <a
														class="glyphicon glyphicon-forward disabled"></a> <a
														class="glyphicon glyphicon-fast-forward disabled"></a>
												</div>
											</td>
										</tr>
										<tr>
											<th class="col-xs-6">Concept</th>
											<th class="col-xs-6">Weight</th>
										</tr>
									</thead>
									<tbody id="probaseplus_concept_tbody">
									</tbody>
								</table>
							</div>
							<div class="table-responsive col-xs-6">
								<table class="table table-hover table-striped">
									<caption>Entity</caption>
									<thead>
										<tr>
											<td colspan="2">
												<div class="propager" id="probaseplus_entity_pager">
													<a class="glyphicon glyphicon-fast-backward disabled"></a>
													<a class="glyphicon glyphicon-backward disabled"></a> <span
														class="pageNumber">0</span> <a
														class="glyphicon glyphicon-forward disabled"></a> <a
														class="glyphicon glyphicon-fast-forward disabled"></a>
												</div>
											</td>
										</tr>
										<tr>
											<th class="col-xs-6">Entity</th>
											<th class="col-xs-6">Weight</th>
										</tr>
									</thead>
									<tbody id="probaseplus_entity_tbody">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- panel panel-default -->
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/js/jquery.mobile.custom.min.js"></script>
	<script src="../resources/dist/js/bootstrap.min.js"></script>
	<script src="../resources/js/probaseBroswer.js"></script>
	<!-- <script src="assets/js/docs.min.js"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../resources/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

