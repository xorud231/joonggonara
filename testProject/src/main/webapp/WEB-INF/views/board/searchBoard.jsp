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
    </style>
    
    <script type="text/javascript">
    	var click = false;
    	
    	function review(){
    		var review = document.getElementById("review");
    		
    		if(!click){
    			review.style.display = "";
    			click = true;
    		}
    		
    		else{
    			review.style.display = "none";
    			click = false;
    		}
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
						        <img class="slide-image" src="img/header.jpg" alt="">
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
                        <h3 class="pull-right">￦${board.price}</h3>
                        <h3 style = "color : #43bdb1;">${board.title}</h3>
                        <p>${board.contents}</p>
                    </div>
                    <div class="ratings">
                        <a class="pull-right" href = "#" onclick = "review()">${replycount} reviews</a>
                        <p>&nbsp;</p>
                    </div>
                </div>

                <div id = "review" class="well" style = "display : none;">

                    <div class="text-right">
                    	<textarea class = "reply">
                    		
                    	</textarea>
                        <a class="btn btn-success" href = "reply.do">댓글달기</a>
                    </div>

                    <hr>

					<!-- 디비에서 댓글 가져와서 div 하나씩 생성하자 -->
					<div id = "replyDiv">
						<c:forEach var = "reply" items="${replys}">
							<div class="row">
		                        <div class="col-md-12">
		                            <span class="glyphicon glyphicon-star"></span>
		                            <span class="glyphicon glyphicon-star"></span>
		                            <span class="glyphicon glyphicon-star"></span>
		                            <span class="glyphicon glyphicon-star"></span>
		                            <span class="glyphicon glyphicon-star-empty"></span>
		                            ${reply.mno}
		                            <span class="pull-right">${reply.regdate}</span>
		                            <p>${reply.reply}</p>
		                        </div>
	                    	</div>
						</c:forEach>
	                    <!-- <div class="row">
	                        <div class="col-md-12">
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star-empty"></span>
	                            Anonymous
	                            <span class="pull-right">10 days ago</span>
	                            <p>This product was great in terms of quality. I would definitely buy another!</p>
	                        </div>
	                    </div>
	
	                    <hr>
	
	                    <div class="row">
	                        <div class="col-md-12">
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star-empty"></span>
	                            Anonymous
	                            <span class="pull-right">12 days ago</span>
	                            <p>I've alredy ordered another one!</p>
	                        </div>
	                    </div>
	
	                    <hr>
	
	                    <div class="row">
	                        <div class="col-md-12">
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star"></span>
	                            <span class="glyphicon glyphicon-star-empty"></span>
	                            Anonymous
	                            <span class="pull-right">15 days ago</span>
	                            <p>I've seen some better than this, but not at this price. I definitely recommend this item.</p>
	                        </div>
	                    </div> -->
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
