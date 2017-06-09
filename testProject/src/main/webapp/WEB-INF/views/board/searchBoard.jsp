<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang = "en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>joonggonara</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-item.css" rel="stylesheet">
    
    <style type="text/css">
    	.reply {
    	  width : 100%;
		  display: inline-block;
		  padding: 6px;
		  margin-bottom: 12px;
		  font-size: 14px;
		  font-weight: normal;
		  line-height: 1.42857143;
		  white-space: nowrap;
		  vertical-align: middle;
		  -ms-touch-action: manipulation;
		      touch-action: manipulation;
		  -webkit-user-select: none;
		     -moz-user-select: none;
		      -ms-user-select: none;
		          user-select: none;
		  border: 1px solid transparent;
		  border-radius: 4px;
		}
		
		.ratings > a {
			color : #d17581;
		}
		
		#cartbutton {
			float: right !important;
			background-color : #eeeeee;
			color : #ffecec;
			font-weight : bold;
		}
		
		#cartbutton:hover {
			background-color : #dedede;
		}
		
    </style>
    
    <script type="text/javascript" src="js/jquery-1.10.1.js"></script>
    <script type="text/javascript">
    	var isInCart;
    
    	$(function(){
    		isInCart = ${board.isInCart};
    		var cartbutton = document.getElementById("cartbutton");
    		var boardMno = ${board.mno}; 
    		var myMno = <%= session.getAttribute("mno") %>;
    		
    		if(isInCart){
    			cartbutton.style.background = "#e8f42d";
    			$('#cartbutton:hover').css("background", "black");
    		}
    		
    		if(boardMno == myMno){
    			var modifyBoard = document.getElementById("modifyBoard");
    			var deleteBoard = document.getElementById("deleteBoard");
    			
    			modifyBoard.style.display = "";
    			deleteBoard.style.display = "";
    		}
    	})
    	
    	var reviewClick = false;
    	
    	function review(){
    		var review = document.getElementById("review");
    		
    		if(!reviewClick){
    			review.style.display = "";
    			reviewClick = true;
    		}
    		
    		else{
    			review.style.display = "none";
    			reviewClick = false;
    		}
    	}
    	
    	function back(){
    		var sellbuy = <%= session.getAttribute("sellbuy") %>;
			
    		if(sellbuy == 1){
    			location.href = "searchBuyList.do?sellbuy=1"
    		}
    		
    		else{
    			location.href = "searchSellList.do?sellbuy=2"
    		}
    	}
    	
    	function update(){
    		if(isInCart)
    			alert("장바구니에서 제거하였습니다.");
    		else
    			alert("장바구니에 추가하였습니다.");
    		
    		location.href = "updateCart.do?bno=" + ${board.bno};
    	}
    	
    </script>
</head>

<body>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="thumbnail">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<!-- 여기에 넘어가는 사진들 index 번호랑 해서 넣으면 됨 -->
						    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<!-- 여기에 넘어가는 사진들 넣으면 됨 -->
						    <div class="item active">
						        <img class="slide-image" src="img/header.jpg" alt="" style = "height : 400px;">
						    </div>
						    <div class="item">
						        <img class="slide-image" src="http://placehold.it/800x300" alt="">
						    </div>
						    <div class="item">
						        <img class="slide-image" src="http://placehold.it/800x300" alt="">
						    </div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
						    <span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
						    <span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
					<div class="caption-full">
						<a id = "cartbutton" class = "btn btn-success"
							onclick = "update()" style = "color : black;">담기</a>
						<a class = "btn btn-success" onclick = "back()" 
							style = "background-color : #d041ff;">목록</a>
						<a style = "background-color : #d041ff; display : none;"
							class = "btn btn-success" onclick = "back()" id = "modifyBoard">수정</a>
							<a style = "background-color : #d041ff; display : none;"
							class = "btn btn-success" onclick = "back()" id = "deleteBoard">삭제</a>
                    	<h4 style = "font-weight : bold;">작성자: ${board.mno}</h4>
                    	<a style = "color:black">작성일 : ${board.regdate}</a>
                    </div>
                    
                    <div class="caption-full">
                        <h3 class="pull-right">￦${board.price}</h3>
                        <h3 style = "color : #43bdb1; font-weight : bold;">${board.title}</h3>
                        <p>${board.contents}</p>
                    </div>
                    <div class="ratings">
                        <a class="pull-right" href = "#" onclick = "review()" style = "font-size : 18px">
                        	${replycount} replies
                        </a>
                        <p>&nbsp;</p>
                    </div>
                </div>

                <div id = "review" class="well" style = "display : none;">
					
					<form action = "reply.do">
	                    <div class="text-right">
	                    	<input type = "hidden" id = "sellbuy" value = "1"  name="sellbuy">
							<input type = "hidden" id = "bno" value = "1"  name="bno">
	                    	<textarea class = "reply" id = "replycontent"  name="replycontent">
	                    	</textarea>
	                    	<input type = 'submit' class = "btn btn-success" value = "댓글달기"/>
	                    </div>
                    </form>

                    <hr>

					<!-- 디비에서 댓글 가져와서 div 하나씩 생성하자 -->
					<div id = "replyDiv">
						<c:forEach var = "reply" items="${replys}">
							<div class="row" style = "border-top : 1px solid #d3d3d3; padding-top : 7px;">
		                        <div class="col-md-12">
		                        	<span style = "font-weight : bold;">작성자: ${reply.mno}</span>
		                            <span class="pull-right" style = "font-weight : bold;">${reply.regdate}</span>
		                            <p style = "margin-top : 5px;">${reply.reply}</p>
		                        </div>
	                    	</div>
						</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
