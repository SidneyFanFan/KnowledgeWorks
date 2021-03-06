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
								data-toggle="dropdown" role="button" aria-expanded="false">People
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/KnowledgeWorks/people/researcher">Researcher</a></li>
									<li><a href="/KnowledgeWorks/people/student">Student</a></li>
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
			<h2 class="people_categroy">Researcher</h2>
			<hr>
		</div>
		<div class="row person">
			<div class="col-sm-12 col-sm-2 col-md-2 col-lg-2 img-container">
				<img class="img-circle"
					src="../resources/image/people/Yang,Deqing.jpg"
					alt="Generic placeholder image"
					style="width: 100px; height: 100px;">
			</div>
			<div class="col-sm-12 col-sm-4 col-md-4 col-lg-4 text-left">
				<h3>Yang, Deqing</h3>
				<h4>阳德青</h4>
				<p>
					<a href="mailto:yangdeqing@fudan.edu.cn">yangdeqing@fudan.edu.cn</a>
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
						June, 2013</li>
					<li>M.Sc. in Dept. of Computer Science and Engineering, Fudan
						University, June, 2005</li>
					<li>B.Sc. in Dept. of Computer Science and Engineering, Fudan
						University, June, 2002</li>
				</ul>
			</div>
			<div class="col-lg-12">
				<h3>Publications</h3>
				<h5>Conference Proceedings</h5>
				<ul style="list-style-type: decimal;">
					<li><strong>Deqing Yang</strong>, Yanghua Xiao, Hanghang Tong,
						Junjun Zhang, Wei Wang:  An Integrated Tag Recommendation
						Algorithm Towards Weibo User Profiling. DASFAA (1) 2015: 353-373</li>
					<li><strong>Deqing Yang</strong>, Yanghua Xiao, Yangqiu Song,
						Junjun Zhang, Kezun Zhang, Wei Wang:  Tag propagation based
						recommendation across diverse social media. WWW (Companion Volume)
						2014: 407-408</li>
					<li><strong>Deqing Yang</strong>, Yanghua Xiao, Bo Xu,
						Hanghang Tong, Wei Wang, Sheng Huang:  Which Topic Will You
						Follow? ECML/PKDD (2) 2012: 597-612</li>
					<li><strong>Deqing Yang</strong>, Linhao Xu, Wenyuan Cai,
						Shuigeng Zhou, Aoying Zhou:  Efficient Query Routing for XML
						Documents Retrieval in Unstructured Peer-to-Peer Networks. APWeb
						2004: 217-223</li>
				</ul>
				<h5>Journals</h5>
				<ul style="list-style-type: decimal;">
					<li><strong>Deqing Yang</strong>, Yanghua Xiao, Wei Wang:
						Statistical Model-Based Analysis and Prediction of Collective
						Attention in Social Networks. Journal of Computer Research and
						Development 2010:47(Suppl.) 378-384</li>
				</ul>
				<h5>Book Chapters</h5>
				<ul style="list-style-type: decimal;">
					<li>Bo Xu, <strong>Deqing Yang</strong>, Qi Liu, Yanghua
						Xiao:  Social Communication Network, Case Study. Encyclopedia of
						Social Network Analysis and Mining 2014: 1771-1777
					</li>
				</ul>
				<h3>Funding Experience</h3>
				<ul style="list-style-type: decimal;">
					<li>“Research on cloud services of e-government”, Shanghai
						Municipal Commission of Economy and Informationization,
						Informationization Construction Project, 2014/08-2015/06,
						98k(CNY).</li>
					<li>“Big data applications for personalized services on
						employment affairs”, Shanghai Municipal Education Commission,
						2014/09-2015/06, 200k(CNY).</li>
					<li>“Query processing on big knowledge graphs”, NSF61472085,
						2015/01-2018/12, 830k(CNY), attendance.</li>
					<li>“Query processing on social network”, NSF61003001,
						2011/01-2013/12, 190k(CNY), attendance.</li>
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
