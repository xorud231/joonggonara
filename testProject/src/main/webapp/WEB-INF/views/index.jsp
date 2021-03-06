<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 
<head>
 
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 
 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
 
<title>joonggonara</title>
 
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/shop-homepage.css" rel="stylesheet">
 
<script src="js/jquery.js"></script>
 
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	var click;
 
	$(function() {
		var sellbuy = <%=session.getAttribute("sellbuy")%>;
 
		if (sellbuy == 1) {
 
			var buy = document.getElementById("3_buy");
			buy.style.display = "none";
			var sell = document.getElementById("3_sell");
			sell.style.display = "";
			var my = document.getElementById("myPage");
			my.style.display = "none";
			click = document.getElementById("searchAll");
			click.style.display = "";
		}
 
		else if (sellbuy == 2) {
			var buy = document.getElementById("3_buy");
			buy.style.display = "";
			var sell = document.getElementById("3_sell");
			sell.style.display = "none";
			var my = document.getElementById("myPage");
			my.style.display = "none";
			click = document.getElementById("searchAll");
			click.style.display = "";
		}
 
		else if (sellbuy == 3) {
			var buy = document.getElementById("3_buy");
			buy.style.display = "none";
			var sell = document.getElementById("3_sell");
			sell.style.display = "none";
			var my = document.getElementById("myPage");
			my.style.display = "";
			var s = document.getElementById("searchAll");
			s.style.display = "";
		}
 
	});
 
</script>
 
</head>
 
<body>
 
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		style="background-color: #131313">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="navbar-brand">
					<a href="helloBoard.do"><img src="img/translogo.png "
						width="150px"></a>
				</div>
 
 
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="searchSellList.do?pageNo=1&bno=&sellbuy=2&cno=1">팝니다</a></li>
					<li><a href="searchBuyList.do?pageNo=1&bno=&sellbuy=1&cno=1">삽니다</a></li>
					<li><a href="helloBoard.do">My page</a></li>
					<li><a href="logout.do"
						onclick="alert('<%=(String) session.getAttribute("mno")%>님이 로그아웃 하셨습니다')">Logout</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
 
	<!-- Page Content -->
	<div class="container">
 
		<div class="row" id="row"  >
			<div class="col-md-3" id="col-md-3" onclick="md3()">
				<div id="3_buy" style="display: none" >
					<p class="lead">팝니다</p>
					<div class="list-group">
						<a class="list-group-item" href="searchSellList.do?pageNo=1&bno=&sellbuy=2&cno=1">전체</a> <a
							class="list-group-item" href="searchSellList.do?pageNo=1&bno=&sellbuy=2&cno=2">가전제품</a> <a
							class="list-group-item" href="searchSellList.do?pageNo=1&bno=&sellbuy=2&cno=3">가구</a> <a
							class="list-group-item" href="searchSellList.do?pageNo=1&bno=&sellbuy=2&cno=4">의류/잡화</a> <a
							class="list-group-item" href="searchSellList.do?pageNo=1&bno=&sellbuy=2&cno=5">생활용품</a> <a
							class="list-group-item" href="searchSellList.do?pageNo=1&bno=&sellbuy=2&cno=6">취미용품</a> <a
							class="list-group-item" href="searchSellList.do?pageNo=1&bno=&sellbuy=2&cno=7">기타</a>
					</div>
				</div>
				<div id="3_sell" style="display: none" >
					<p class="lead">삽니다</p>
					<div class="list-group" id="category_bg">
						<a class="list-group-item" href="searchBuyList.do?pageNo=1&bno=&sellbuy=1&cno=1">전체</a> <a
							class="list-group-item" href="searchBuyList.do?pageNo=1&bno=&sellbuy=1&cno=2">가전제품</a> <a
							class="list-group-item" href="searchBuyList.do?pageNo=1&bno=&sellbuy=1&cno=3">가구</a> <a
							class="list-group-item" href="searchBuyList.do?pageNo=1&bno=&sellbuy=1&cno=4">의류/잡화</a> <a
							class="list-group-item" href="searchBuyList.do?pageNo=1&bno=&sellbuy=1&cno=5">생활용품</a> <a
							class="list-group-item" href="searchBuyList.do?pageNo=1&bno=&sellbuy=1&cno=6">취미용품</a> <a
							class="list-group-item" href="searchBuyList.do?pageNo=1&bno=&sellbuy=1&cno=7">기타</a>
					</div>
				</div>
				<div id="myPage" style="display:" >
					<p class="lead">My Page</p>
					<div class="list-group" id="category_bg">
					
							
					<a href="myInfo.do" id="clickInfo" class="list-group-item">회원정보확인</a>
						<!-- 장바구니 드롭다운시작 -->
						
							
							<div class="list-group-item">
								<a id="dLabel" 
									data-toggle="dropdown" aria-haspopup="true" role="button"
									aria-expanded="false" style="color: #9D9D9D"  > 장바구니 <span
									class="caret"></span>
								</a>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel"  data-options="align:right">
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="searchBuyCart.do">삽니다 장바구니</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="searchSellCart.do">팝니다 장바구니</a></li>
								</ul>
							</div>
						
						
						<!-- 장바구니 드롭다운 끝 -->
						<!-- 내게시물관리 드롭다운시작 -->
						
							<div class="list-group-item">
								<a id="dLabel"  
									data-toggle="dropdown" aria-haspopup="true" role="button"
									aria-expanded="false" style="color: #9D9D9D;" > 내 게시물 관리 <span
									class="caret"></span>
								</a>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel"  data-options="align:right">
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="searchMyBuyBoard.do">삽니다 게시물</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="searchMySellBoard.do">팝니다 게시물</a></li>
								</ul>
							</div>
						
						<!-- 내게시물관리 드롭다운 끝 -->
 
					</div>
				</div>
			</div>
 
			<!-- div9 -->
			<div class="col-md-9" style="height: 750px">
 
 
				<!-- selectAll -->
				<div id="searchAll" style="display: none">
					<c:if test='${!empty content }'>
						<jsp:include page="${content}" />
					</c:if>
				</div>
				<!-- selectAll -->
 
			</div>
			<!-- div9 끝 -->
 
		</div>
		<!-- /.container -->
 
		<div class="container">
			<!-- Footer -->
			<footer>
				<div class="">
					<div class="col-lg-12">
						<p>KDN 중고나라 2017</p>
					</div>
				</div>
			</footer>
		</div>
		
		<!-- /.container -->
</body>
</html>