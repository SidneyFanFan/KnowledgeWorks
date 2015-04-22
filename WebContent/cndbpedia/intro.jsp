<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="knowledgeBase.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%
	// Currently I use js to replace some functions in JSP
	// Change to Java is OK

	/***********TEMPLATE************/
	String siteTitle = "CN DBpedia";
	String cssPath = "../resources/css/cndbpedia.css";
	int defaultFuncIndex = 0;
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
				<a class="navbar-brand" href="#"><%=siteTitle%></a><a
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
				<%
					String[] func;
					for(int i=0;i<functions.size();i++){
						func = functions.get(i);
						if(i==currentFuncIndex){
							out.println(String.format("<li class='active'><a href=%s>%s<span class='sr-only'>(current)</span></a></li>",
									func[1],func[0]));
						}else{
							out.println(String.format("<li><a href=%s>%s</a></li>",
									func[1],func[0]));
						}
					}
				%>
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
					<h1>Introduction to CN-DBpedia</h1>
					<h5 class="text-muted">What is CN-DBpedia</h5>
					<p>CN-DBpedia is an effort to extract structured information from Chinese encyclopedia sites, such as Baidu Baike, and make this information available on the Web. CN-DBpedia allows you to ask sophisticated queries against Chinese encyclopedia sites, and to link the different data sets on the Web to Chinese encyclopedia sites data.</p>
					<h5 class="text-muted">什么是CN-DBpedia</h5>
					<p>CN-DBpedia致力于从中文百科类网站（如百科百科等）中提取结构化信息，并将其共享。CN-DBpedia支持用户进行复杂查询，并将中文百科类网站数据与互联网上其他数据源数据进行连接。</p>
				</div>
				<!-- Template Choose -->
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

