<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="knowledgeBase.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="structure.Triple"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// Currently I use js to replace some functions in JSP
	// Change to Java is OK

	/***********TEMPLATE************/
	String siteTitle = "CN DBpedia";
	String cssPath = "../resources/css/dashboard.css";
	int defaultFuncIndex = 1;
	// functions & links & introduction & template
	List<String[]> functions = new ArrayList<String[]>();
	functions.add(new String[]{"Introduction","introduction","Brief introduction", "#"});
	functions.add(new String[]{"Search","search","Brief introduction","SEARCH"});
	functions.add(new String[]{"Sparql","http://gdm.fudan.edu.cn/sparql/gdm_sparql.jsp","#","#"});
	functions.add(new String[]{"Download","#","Brief introduction","#"});
	functions.add(new String[]{"People","#","Brief introduction","#"});
	functions.add(new String[]{"Publication","#","Brief introduction","#"});
	functions.add(new String[]{"GDM Lab","http://gdm.fudan.edu.cn","Brief introduction","#"});
	
	int currentFuncIndex = defaultFuncIndex;
	String[] curr_func = functions.get(currentFuncIndex);
	String word = request.getParameter("word");
	request.setAttribute("word", word);
	request.setAttribute("curr_tpl",curr_func[3]);
	request.setAttribute("functions",functions);
	request.setAttribute("currentFunc", curr_func[0]);
	// template for search
	// TODO
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

<title><%=siteTitle%></title>

<!-- Bootstrap core CSS -->
<link href="../resources/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href=<%=cssPath%> rel="stylesheet">

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
				<a class="navbar-brand"
					href="http://gdm.fudan.edu.cn/KnowledgeWorks/cndbpedia"><%=siteTitle%></a><a
					class="navbar-brand subbrand" href="/KnowledgeWorks">Knowledge Works</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="..">Knowledge Works</a></li>
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
					<c:forEach items="${functions}" var="func">
						<c:if test="${currentFunc == func[0]}">
							<li class='active'><a href="${func[1]}"><c:out
										value="${func[0]}"></c:out><span class='sr-only'>(current)</span></a></li>
						</c:if>
						<c:if test="${currentFunc != func[0]}">
							<li><a href="${func[1]}"><c:out value="${func[0]}"></c:out><span
									class='sr-only'>(current)</span></a></li>
						</c:if>
					</c:forEach>
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
					<h1><%=curr_func[0]%></h1>
					<h5 class="text-muted"><%=curr_func[2]%></h5>
				</div>
				<!-- Template Choose -->
				<c:if test="${curr_tpl == 'SEARCH'}">
					<!-- Search From -->
					<form action="search" method="get" class='form-inline'
						id='search_form' role='form'>
						<div class='input-group'>
							<input type='text' id='search_input' class='form-control'
								name='word'> <span class='input-group-btn'>
								<button class='btn btn-default' id='search_buttom' type='button'>Search</button>
							</span>
						</div>
						<img class="hidden loadingimg"
							src="../resources/image/loading.gif">
					</form>
					<!-- End Search From -->
					<h2 class="sub-header" id="result_title">
						Result:
						<c:out value="${word}"></c:out>
					</h2>
					<!--Information -->
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapseInformation">
							<h4 class="panel-title">
								<span class="glyphicon glyphicon-search"></span> Information
							</h4>
						</div>
						<div id="collapseInformation" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-hover table-striped">
										<tbody>
											<c:forEach items="${Information}" var="triple">
												<tr>
													<td class="col-xs-3"><c:out
															value="${triple.getArg2()}"></c:out></td>
													<td class="col-xs-9 text-left"><c:set var="paras"
															scope="session" value="${triple.getArg3()}" /> <%
 	String paras = (String) session.getAttribute("paras");
 			paras = paras.replaceAll("\\[(\\d+)\\]", "");
 			String[] split = paras.split("\\|\\|\\|");
 			request.setAttribute("paras", split);
 %> <c:forEach items="${paras}" var="para">
															<p>
																<c:out value="${para}"></c:out>
															</p>
														</c:forEach></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!--Infobox -->
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapseInfoBox">
							<h4 class="panel-title">
								<span class="glyphicon glyphicon-search"></span> InfoBox
							</h4>
						</div>
						<div id="collapseInfoBox" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-hover table-striped">
										<tbody>
											<c:forEach items="${InfoBox}" var="triple">
												<tr>
													<td class="col-xs-3"><c:out
															value="${triple.getArg2()}"></c:out></td>
													<td class="col-xs-9"><c:out
															value="${triple.getArg3()}"></c:out></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!--Category -->
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapseCategory">
							<h4 class="panel-title">
								<span class="glyphicon glyphicon-search"></span> Category
							</h4>
						</div>
						<div id="collapseCategory" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-hover table-striped">
										<tbody>
											<c:forEach items="${Category}" var="triple">
												<tr>
													<td class="col-xs-3"><c:out
															value="${triple.getArg2()}"></c:out></td>
													<td class="col-xs-9"><c:out
															value="${triple.getArg3()}"></c:out></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!--Class -->
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapseClass">
							<h4 class="panel-title">
								<span class="glyphicon glyphicon-search"></span> Linking to
								DBpedia Class
							</h4>
						</div>
						<div id="collapseClass" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-hover table-striped">
										<tbody>
											<c:forEach items="${Class}" var="triple">
												<tr>
													<td class="col-xs-3"><a
														href="http://www.w3.org/1999/02/22-rdf-syntax-ns#type" target="_blank">rdf:type</a>
													</td>
													<td class="col-xs-9"><a href="${triple.getArg3()}" target="_blank"><c:out
																value="${triple.getArg2()}"></c:out></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!--Class2 -->
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapseClass2">
							<h4 class="panel-title">
								<span class="glyphicon glyphicon-search"></span> Linking to
								DBpedia Class (Heuristic)
							</h4>
						</div>
						<div id="collapseClass2" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-hover table-striped">
										<tbody>
											<c:forEach items="${Class2}" var="triple">
												<tr>
													<td class="col-xs-3"><a
														href="http://www.w3.org/1999/02/22-rdf-syntax-ns#type" target="_blank">rdf:type</a>
													</td>
													<td class="col-xs-9"><a href="${triple.getArg3()}" target="_blank"><c:out
																value="${triple.getArg2()}"></c:out></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!--Entity -->
					<div class="panel panel-default">
						<div class="panel-heading" data-toggle="collapse"
							data-parent="#accordion" data-target="#collapseEntity">
							<h4 class="panel-title">
								<span class="glyphicon glyphicon-search"></span> Linking to
								DBpedia Entity
							</h4>
						</div>
						<div id="collapseEntity" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-hover table-striped">
										<tbody>
											<c:forEach items="${Entity}" var="triple">
												<tr>
													<td class="col-xs-3"><a
														href="http://www.w3.org/2002/07/owl#sameAs" target="_blank">rdf:sameAs</a>
													</td>
													<td class="col-xs-9"><a href="${triple.getArg3()}" target="_blank"><c:out
																value="${triple.getArg2()}"></c:out></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:if>
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
	<script src="../resources/js/cndb.js"></script>
	<!-- <script src="assets/js/docs.min.js"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../resources/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

