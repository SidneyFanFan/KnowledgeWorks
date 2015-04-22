<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="resources/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="resources/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Custom styles for this template -->
<link href="resources/css/carousel.css" rel="stylesheet">
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
							<li class="active"><a href="/KnowledgeWorks">Home</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">People
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/KnowledgeWorks/people/researcher">Researcher</a></li>
									<li><a href="/KnowledgeWorks/people/student">Student</a></li>
								</ul></li>
							<li><a href="#about">About</a></li>
							<li><a href="#contact">Contact</a></li>

						</ul>
					</div>
				</div>
			</nav>

		</div>
	</div>


	<!-- Carousel
    ================================================== -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="imagecontainer">
					<img src="resources/image/static-graph.png" alt="First slide">
				</div>
				<div class="container">
					<div class="carousel-caption">
						<h1>Knowledge Works</h1>
						<p>Knowledge Works is produced by Graph Data Management Lab at
							Fudan University. We conduct theoretical and applied research on
							building and management of the large-scale knowledge graph - the
							major form of knowledge representation in the Age of Big Data.
							Built with millions of entities, concepts and semantic relations,
							knowledge graph flourishes the knowledge foundation of semantic
							understanding, and provides the machine language recognition with
							necessary knowledge supports. The goal of Knowledge Works is to
							produce the state-of-the-art technology and promote further
							applications of knowledge graph in the area of text
							understanding, intelligent search and artificial smart brain.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#projects" role="button">Learn
								more</a>
						</p>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="imagecontainer">
					<img src="resources/image/complexnetworkwhite.gif"
						alt="First slide">
				</div>
				<div class="container">
					<div class="carousel-caption">
						<h1>知识工场</h1>
						<p>知识工场源于复旦大学图数据管理实验室。 知识工场专注于各类大规模知识图谱构建、管理以及应用理论与方法研究。
							知识图谱表达了各类实体、概念及其之间的各种语义关系，成为了大数据时代知识表示的主要形态之一。
							知识图谱为语义理解提供了丰富的背景知识，为实现机器语言认知提供必需的知识支撑。
							知识工场以构建能够满足机器语言认知需要的大规模、高质量知识图谱为基本目标，
							并以推进知识图谱在文本理解、智慧搜索以及机器智脑等领域中的深入应用为主要使命。</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#projects" role="button">了解更多</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- /.carousel -->


	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->

	<div class="container marketing" id="projects">
		<!-- <h1>Knowledge Bases</h1> -->
		<!-- Three columns of text below the carousel -->
		<div class="row">
			<div class="col-lg-4">
				<img class="img-circle" src="resources/image/logo2.png"
					alt="Generic placeholder image"
					style="width: 140px; height: 140px;">
				<h2>CN DBpedia</h2>
				<p>CN-DBpedia is an effort to extract structured information
					from Chinese encyclopedia sites, such as Baidu Baike, and make this
					information available on the Web. CN-DBpedia allows you to ask
					sophisticated queries against Chinese encyclopedia sites, and to
					link the different data sets on the Web to Chinese encyclopedia
					sites data.</p>
				<p>
					<a class="btn btn-default" href="./cndbpedia" role="button">View
						details &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="img-circle" src="resources/image/logo9.png"
					alt="Generic placeholder image"
					style="width: 140px; height: 140px;">
				<h2>Probase Plus</h2>
				<p>Duis mollis, est non commodo luctus, nisi erat porttitor
					ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
					purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
					tortor mauris condimentum nibh.</p>
				<p>
					<a class="btn btn-default" href="./probaseplus" role="button">View
						details &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="img-circle" src="resources/image/logo10.png"
					alt="Generic placeholder image"
					style="width: 140px; height: 140px;">
				<h2>CN-Probase</h2>
				<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
					egestas eget quam. Vestibulum id ligula porta felis euismod semper.
					Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
					nibh, ut fermentum massa justo sit amet risus.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">Building...
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="img-circle" src="resources/image/logo3.png"
					alt="Generic placeholder image"
					style="width: 140px; height: 140px;">
				<h2>CNELL</h2>
				<p>Duis mollis, est non commodo luctus, nisi erat porttitor
					ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
					purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
					tortor mauris condimentum nibh.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">Building...
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="img-circle" src="resources/image/logo11.png"
					alt="Generic placeholder image"
					style="width: 140px; height: 140px;">
				<h2>Fudan Wiki</h2>
				<p>Duis mollis, est non commodo luctus, nisi erat porttitor
					ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
					purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
					tortor mauris condimentum nibh.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">Building...
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="img-circle" src="resources/image/logo6.png"
					alt="Generic placeholder image"
					style="width: 140px; height: 140px;">
				<h2>Verb Base</h2>
				<p>Duis mollis, est non commodo luctus, nisi erat porttitor
					ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
					purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
					tortor mauris condimentum nibh.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">Building...
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="img-circle" src="resources/image/logo7.png"
					alt="Generic placeholder image"
					style="width: 140px; height: 140px;">
				<h2>WiiCluster</h2>
				<p>Duis mollis, est non commodo luctus, nisi erat porttitor
					ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
					purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
					tortor mauris condimentum nibh.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">Building...
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="img-circle" src="resources/image/logo8.png"
					alt="Generic placeholder image"
					style="width: 140px; height: 140px;">
				<h2>S-Wiki</h2>
				<p>Duis mollis, est non commodo luctus, nisi erat porttitor
					ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
					purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
					tortor mauris condimentum nibh.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">Building...
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
		</div>
		<!-- /.row -->


		<!-- START THE FEATURETTES -->

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-6">
				<h2 class="featurette-heading">
					Application Demos<br> <span class="text-muted">应用展示</span>
				</h2>
				<p class="lead">Donec ullamcorper nulla non metus auctor
					fringilla. Vestibulum id ligula porta felis euismod semper.
					Praesent commodo cursus magna, vel scelerisque nisl consectetur.
					Fusce dapibus, tellus ac cursus commodo.</p>
			</div>
			<div class="col-md-6 whiteText">
				<div class="col-md-6" style="background-color: #F44336;">
					<h4>Deep Reading</h4>
					<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris
						condimentum nibh, ut fermentum massa justo sit amet risus.</p>
					<p>
						<a class="btn btn-default" href="#" role="button">View details
							»</a>
					</p>
				</div>
				<div class="col-md-6" style="background-color: #ffe83b;">
					<h4>Entity Search</h4>
					<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris
						condimentum nibh, ut fermentum massa justo sit amet risus.</p>
					<p>
						<a class="btn btn-default" href="#" role="button">View details
							»</a>
					</p>
				</div>
				<div class="col-md-6" style="background-color: #8bc34a;">
					<h4>Relation Explanation</h4>
					<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris
						condimentum nibh, ut fermentum massa justo sit amet risus.</p>
					<p>
						<a class="btn btn-default" href="#" role="button">View details
							»</a>
					</p>
				</div>
				<div class="col-md-6" style="background-color: #2196f3;">
					<h4>Job Search</h4>
					<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris
						condimentum nibh, ut fermentum massa justo sit amet risus.</p>
					<p>
						<a class="btn btn-default" href="#" role="button">View details
							»</a>
					</p>
				</div>
				<div class="col-md-6" style="background-color: #ff9800;">
					<h4>Who cites me</h4>
					<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris
						condimentum nibh, ut fermentum massa justo sit amet risus.</p>
					<p>
						<a class="btn btn-default" href="#" role="button">View details
							»</a>
					</p>
				</div>
				<div class="col-md-6" style="background-color: #9c27b0;">
					<h4>Conceptual Labelling</h4>
					<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris
						condimentum nibh, ut fermentum massa justo sit amet risus.</p>
					<p>
						<a class="btn btn-default" href="#" role="button">View details
							»</a>
					</p>
				</div>
			</div>
		</div>

		<hr class="featurette-divider">


		<!-- /END THE FEATURETTES -->


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
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/dist/js/bootstrap.min.js"></script>
	<script src="resources/js/home.js"></script>
	<!-- <script src="../../assets/js/docs.min.js"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="resources/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
