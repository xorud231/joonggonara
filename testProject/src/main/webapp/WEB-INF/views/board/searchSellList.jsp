<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:useBean 	id="pageBean"         class="com.kdn.model.domain.PageBean" 
				scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<title>Insert title here</title>
<script type="text/javascript">
	//조건 검색, 페이지 번호로 게시글 요청을 위한 메서드  
	function pagelist(cpage){
		//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
		document.getElementById("pageNo").value=cpage;
		var frm = document.getElementById("frm");
		frm.action="searchBuyList.do";
		frm.submit();
	}
	//게시글 번호나 타이틀을 클릭하면 해당 게시글 요청을 위한 메서드 
	function getBoard(bno){
		//input 양식의 hidden으로 선언된 no(게시글 번호)에 요청된 게시글 번호를 셋팅
		document.getElementById("bno").value = bno;
		var frm = document.getElementById("frm");
		frm.action="searchBoard.do";
		frm.submit();
	}
</script>
</head>
<body>
  <div class="row">
					 <form id="frm" >
					<input type="hidden" id="pageNo"  name="pageNo"  value="1"/>
					<input type="hidden" id="sellbuy"  name="sellbuy"  value="2"/>
					<input type="hidden" id="bno"  name="bno"/>
					 <c:forEach  var="board" items="${list}">
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
							<c:choose>
							<c:when test="${!empty board.files[0].sfilename}">
 								<img src="img/portfolio/fullsize/${board.files[0].sfilename}" alt="없음">
							</c:when>
							<c:otherwise>
								<img src="http://placehold.it/320x150" alt="">
 							</c:otherwise>
 							</c:choose>
                            <div class="caption">
                                <h4 class="pull-right">${board.price}</h4>
                                <h4><a href="#" onclick="getBoard(${board.bno})">${board.title}</a>
                                </h4>
                                <p>${board.contents}<br/></p><p><a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    </form>
                </div>
</body>
</html>