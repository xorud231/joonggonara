<%@ page language="java" contentType="text/html; charset=UTF-8"  	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop Homepage - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<script type="text/javascript">


	var click;
	
	$(function(){
		var sellbuy = <%= session.getAttribute("sellbuy")%>
		click = document.getElementById("9_hello")
		/* alert(sellbuy); */
		
		if(sellbuy == 1){
			click.style.display = "none";
			var buy = document.getElementById("3_buy");
			buy.style.display = "";
			var sell = document.getElementById("3_sell");
			sell.style.display = "none";
			var my = document.getElementById("myPage");
			my.style.display = "none";
			click = document.getElementById("searchAll");
			click.style.display = "";
		}
		
		else if(sellbuy == 2){
			click.style.display = "none";		
			var buy = document.getElementById("3_buy");
			buy.style.display = "none";
			var sell = document.getElementById("3_sell");
			sell.style.display = "";
			var my = document.getElementById("myPage");
			my.style.display = "none";
			click = document.getElementById("searchAll");
			click.style.display = "";
		}
		
		else if(sellbuy == 3){
			var buy = document.getElementById("3_buy");
			buy.style.display = "none";
			var sell = document.getElementById("3_sell");
			sell.style.display = "none";
			var my = document.getElementById("myPage");
			my.style.display = "";
		}
	});
	
	function md3() {
		var board = document.getElementById("col-md-9-board");
		board.style.display = "";
	}
	
	function sell_1() {
		click.style.display = "none";
		click = document.getElementById("9_sell_1");
		click.style.display = "";
	}
	function sell_2() {
		click.style.display = "none";
		click = document.getElementById("9_sell_2");
		click.style.display = "";
	}
	function sell_3() {
		click.style.display = "none";
		click = document.getElementById("9_sell_3");
		click.style.display = "";
	}
	function sell_4() {
		click.style.display = "none";
		click = document.getElementById("9_sell_4");
		click.style.display = "";
	}
	function sell_5() {
		click.style.display = "none";
		click = document.getElementById("9_sell_5");
		click.style.display = "";
	}
	function sell_6() {
		click.style.display = "none";
		click = document.getElementById("9_sell_6");
		click.style.display = "";
	}
	function sell_7() {
		click.style.display = "none";
		click = document.getElementById("9_sell_7");
		click.style.display = "";
	}

	function buy_1() {
		click.style.display = "none";
		click = document.getElementById("9_buy_1");
		click.style.display = "";
	}
	function buy_2() {
		click.style.display = "none";
		click = document.getElementById("9_buy_2");
		click.style.display = "";
	}
	function buy_3() {
		click.style.display = "none";
		click = document.getElementById("9_buy_3");
		click.style.display = "";
	}
	function buy_4() {
		click.style.display = "none";
		click = document.getElementById("9_buy_4");
		click.style.display = "";
	}
	function buy_5() {
		click.style.display = "none";
		click = document.getElementById("9_buy_5");
		click.style.display = "";
	}
	function buy_6() {
		click.style.display = "none";
		click = document.getElementById("9_buy_6");
		click.style.display = "";
	}
	function buy_7() {
		click.style.display = "none";
		click = document.getElementById("9_buy_7");
		click.style.display = "";
	}
	function smallBoard() {
		click.style.display = "none";
		document.getElementById("col-md-9-board").style.display = "none";
		document.getElementById("col-md-9-smallBoard").style.display = "";
		click = document.getElementById("smallBoard");
		click.style.display = "";
	}
	$(function(){
		$("#addFile").click(addFileForm);
	});
	var count=0;   //file form index
	function addFileForm(){
		var html="<div id='item_"+count+"'>"
		html+="<input type='file' name='fileup'  />";
		html+="<input type='button' value='삭제' onclick='removeForm("+count+")'/></div>";
		count++;
		//html=$("#content").html()+html;
		//$("#content").html(html);
		$("#fileUpForm").append(html);
	}
	function removeForm(count){
		var item = document.getElementById('item_'+count);
		if(item !=null) item.parentNode.removeChild(item);
	}
	
	
	

	
	
	
</script>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img src="img/translogo.png"
					width="150px"></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="searchBuyList.do" >팝니다</a></li>
					<li><a href="searchSellList.do">삽니다</a></li>
					<li><a href="myBoardPage.do">My page</a></li>
					<li><a href="logout.do" onclick="alert('"+${mno}+"'님 로그아웃 되었습니다')">Logout</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row" id="row">
			<div class="col-md-3" id = "col-md-3" onclick="md3()">
			<div id="3_buy" style="display: none">
				<p class="lead">팝니다</p>
				<div class="list-group">
					<a href="#col-md-9" class="list-group-item" onclick="sell_1()">전체</a>
					<a href="#col-md-9" class="list-group-item" onclick="sell_2()">가전제품</a>
					<a href="#col-md-9" class="list-group-item" onclick="sell_3()">가구</a>
					<a href="#col-md-9" class="list-group-item" onclick="sell_4()">의류/잡화</a>
					<a href="#col-md-9" class="list-group-item" onclick="sell_5()">생활용품</a>
					<a href="#col-md-9" class="list-group-item" onclick="sell_6()">취미용품</a>
					<a href="#col-md-9" class="list-group-item" onclick="sell_7()">기타</a>
				</div>
			</div>
			<div  id="3_sell" style="display: none">
				<p class="lead">삽니다</p>
				<div class="list-group">
					<a href="#col-md-9" class="list-group-item" onclick="buy_1()">전체</a>
					<a href="#col-md-9" class="list-group-item" onclick="buy_2()">가전제품</a>
					<a href="#col-md-9" class="list-group-item" onclick="buy_3()">가구</a>
					<a href="#col-md-9" class="list-group-item" onclick="buy_4()">의류/잡화</a>
					<a href="#col-md-9" class="list-group-item" onclick="buy_5()">생활용품</a>
					<a href="#col-md-9" class="list-group-item" onclick="buy_6()">취미용품</a>
					<a href="#col-md-9" class="list-group-item" onclick="buy_7()">기타</a>
				</div>
			</div>
			<div id="myPage" style="display:">
				<p class="lead">My Page</p>
				<div class="list-group">
					
					<a href="#col-md-9" class="list-group-item" >회원정보확인</a> 
					<a href="#col-md-9" class="list-group-item">장바구니</a> 
					<a href="#col-md-9" class="list-group-item">내 게시물 관리</a>
				</div>
			</div>			
			</div>

			<!-- div9 -->
			<div class="col-md-9">
				<div id=col-md-9-board>
					<div id="9_hello">

						<div class="row carousel-holder">

							<div class="col-md-12">
								<div id="carousel-example-generic" class="carousel slide"
									data-ride="carousel">
									<!--  <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol> -->
									<div class="carousel-inner">
										<div class="item active">
										<h1>${mno}님 환영합니다</h1>
											<img class="slide-image" src="img/welcome.PNG"  alt="">
										</div>
										<!-- <div class="item">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                </div> -->
									</div>
									<!-- <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a> -->
								</div>
							</div>

						</div>



					</div>


					<!-- div9  팝니다-->

					<!-- div9_sell_1-->
					<div id="9_sell_1" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4" onclick="smallBoard()">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$64.99</h4>
										<h4>
											<a href="#">Second Product</a>
										</h4>
										<p>This is a short description. Lorem ipsum dolor sit
											amet, consectetur adipiscing elit.</p>
									</div>
									<div class="ratings">
										<p class="pull-right">12 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star-empty"></span>
										</p>
									</div>
								</div>
							</div>



						</div>

					</div>


					<!-- div9_sell_1-->
					<!-- div9_sell_2-->
					<div id="9_sell_2" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$64.99</h4>
										<h4>
											<a href="#">Second Product</a>
										</h4>
										<p>This is a short description. Lorem ipsum dolor sit
											amet, consectetur adipiscing elit.</p>
									</div>
									<div class="ratings">
										<p class="pull-right">12 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star-empty"></span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$64.99</h4>
										<h4>
											<a href="#">Second Product</a>
										</h4>
										<p>This is a short description. Lorem ipsum dolor sit
											amet, consectetur adipiscing elit.</p>
									</div>
									<div class="ratings">
										<p class="pull-right">12 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star-empty"></span>
										</p>
									</div>
								</div>
							</div>



						</div>

					</div>


					<!-- div9_sell_2-->
					<!-- div9_sell_3-->
					<div id="9_sell_3" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>




						</div>

					</div>


					<!-- div9_sell_3-->
					<!-- div9_sell_4-->
					<div id="9_sell_4" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>




						</div>

					</div>


					<!-- div9_sell_4-->
					<!-- div9_sell_5-->
					<div id="9_sell_5" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>




						</div>

					</div>


					<!-- div9_sell_5-->
					<!-- div9_sell_6-->
					<div id="9_sell_6" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>




						</div>

					</div>


					<!-- div9_sell_6-->
					<!-- div9_sell_7-->
					<div id="9_sell_7" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>




						</div>

					</div>


					<!-- div9_sell_7-->




					<!-- 바이 -->

					<!-- div9_buy_1-->
					<div id="9_buy_1" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$64.99</h4>
										<h4>
											<a href="#">Second Product</a>
										</h4>
										<p>This is a short description. Lorem ipsum dolor sit
											amet, consectetur adipiscing elit.</p>
									</div>
									<div class="ratings">
										<p class="pull-right">12 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star-empty"></span>
										</p>
									</div>
								</div>
							</div>



						</div>

					</div>


					<!-- div9_buy_1-->
					<!-- div9_buy_2-->
					<div id="9_buy_2" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$64.99</h4>
										<h4>
											<a href="#">Second Product</a>
										</h4>
										<p>This is a short description. Lorem ipsum dolor sit
											amet, consectetur adipiscing elit.</p>
									</div>
									<div class="ratings">
										<p class="pull-right">12 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star-empty"></span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$64.99</h4>
										<h4>
											<a href="#">Second Product</a>
										</h4>
										<p>This is a short description. Lorem ipsum dolor sit
											amet, consectetur adipiscing elit.</p>
									</div>
									<div class="ratings">
										<p class="pull-right">12 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star-empty"></span>
										</p>
									</div>
								</div>
							</div>



						</div>

					</div>


					<!-- div9_buy_2-->
					<!-- div9_buy_3-->
					<div id="9_buy_3" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>




						</div>

					</div>


					<!-- div9_buy_3-->
					<!-- div9_buy_4-->
					<div id="9_buy_4" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>




						</div>

					</div>


					<!-- div9_buy_4-->
					<!-- div9_buy_5-->
					<div id="9_buy_5" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>




						</div>

					</div>


					<!-- div9_buy_5-->
					<!-- div9_buy_6-->
					<div id="9_buy_6" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>




						</div>

					</div>


					<!-- div9_buy_6-->
					<!-- div9_buy_7-->
					<div id="9_buy_7" style="display: none">



						<div class="row">

							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="http://placehold.it/320x150" alt="">
									<div class="caption">
										<h4 class="pull-right">$24.99</h4>
										<h4>
											<a href="#">First Product</a>
										</h4>
										<p>
											See more snippets like this online store item at <a
												target="_blank" href="http://www.bootsnipp.com">Bootsnipp
												- http://bootsnipp.com</a>.
										</p>
									</div>
									<div class="ratings">
										<p class="pull-right">15 reviews</p>
										<p>
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
										</p>
									</div>
								</div>
							</div>




						</div>

					</div>
				</div>


				<!-- div9_buy_7-->

				<!-- 바이끝 -->

				<!-- 여기서부터는 입력보드 폼 -->

				<div id="col-md-9-smallBoard" >
				<div id = "smallBoard" style="display: none">
					<form method="post" action="insertBoard.do" enctype="multipart/form-data" >
						<table align="center" width="300">
								<tr><th colspan="2"> 게시글 작성 </th></tr>
								<tr height="50"><td><label for="title">제목</label></td>
								    <td><input type="text" name="title" id="title"/></td>
								</tr>
								<tr height="50"><td><label for="title">아이디</label></td>
								    <td><input type="text" name="id" id="id"  disabled="disabled" value="<%=(String)session.getAttribute("mno")%>"/></td>
								</tr>
								<tr height="50" ><td><label for="fileup">업로드할 파일</label></td>
								    <td>
								    	<input type="button" name="addFile" id="addFile" value="파일 추가"/>
								    </td>
								</tr>
								<tr height="50" ><td colspan="2" id="fileUpForm"> </td>
								</tr>
								<tr><td colspan="2"><label for="content">내용</label></td></tr>
								<tr><td colspan="2" align="center">
								    <textarea name="content" id="content" cols="30" rows="5"></textarea>
								</td></tr>
								<tr><td colspan="2" align="center">
									<input type="submit" value="작성"/>
									<input type="reset" value="취소"/>
								</td></tr>
						</table>
					</form>
				</div>
				</div>
						<!-- 여기까지 입력보드 폼 -->
			
			<!-- selectAll -->
			<div id="searchAll" style="display: none">
				<c:if test = '${!empty content }'>
		            <jsp:include page="${content}"/>
				</c:if>
			</div>
			
			<!-- selectAll -->
                
				
						
						
						
			</div><!-- 9끝 -->



			

		</div>
		

	</div>
	<!-- /.container -->

	<div class="container">

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>KDN 중고나라 2017</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>
