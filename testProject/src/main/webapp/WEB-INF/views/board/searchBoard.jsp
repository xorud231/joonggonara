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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
    <title>joonggonara</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
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
		  resize:none;
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
		
		td>button[type="button"]{
			background : #f5f5f5;
			border : 0px;
			float : right;
			
		}
		
    </style>
    
    <script type="text/javascript" src="js/jquery-1.10.1.js"></script>
    <script type="text/javascript">
    	var isInCart;
    	var count=0;
    
    	$(function(){
    		<% int index = 0; %>
    		$("#addFile").click(addFileForm);
    		
    		isInCart = ${board.isInCart};
    		var cartbutton = document.getElementById("cartbutton");
    		var boardMno = ${board.mno}; 
    		var myMno = <%= session.getAttribute("mno") %>;
    		
    		if(isInCart){
    			cartbutton.style.background = "#acd9f2";
    		}
    		
    		if(boardMno == myMno){
    			var modifyBoard = document.getElementById("modifyBoard");
    			var deleteBoard = document.getElementById("deleteBoard");
    			
    			modifyBoard.style.display = "";
    			deleteBoard.style.display = "";
    		}
    	})
    	
    	function addFileForm(){
    		var html="<div id='item_"+count+"'>"
    		html+="<input type='file' id = 'fileup" + count + "' name='fileup' style='display : inline' />";
    		html+="<input type='button' value='삭제' onclick='removeForm("+count+")'/></div>";
    		count++;
    		$("#fileUpForm").append(html);
    	}
    	
    	function removeForm(count){
    		var item = document.getElementById('item_'+count);
    		if(item !=null) item.parentNode.removeChild(item);
    	}
    	
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
    		if(isInCart){
    			var cartCheck = confirm("장바구니에서 삭제하시겠습니까?");
    			
    			if(cartCheck)
    				alert("장바구니에서 삭제하였습니다.");
    			
    			else
    				alert("취소하였습니다.");
    		}
    		
    		else{
    			var cartCheck = confirm("장바구니에 추가하시겠습니까?");
    			
    			if(cartCheck)
    				alert("장바구니에 추가하였습니다.");
    			
    			else
    				alert("취소하였습니다.");
    		}
    		
    		location.href = "updateCart.do?bno=" + ${board.bno};
    	}
    	
    	function updateReply(reply, index){
    		var replycontent = document.getElementById("reply" + index);
    		var editReply = document.getElementById("editReply" + index);
    		var updateReply = document.getElementById("updateReply"  + index);
    		var deleteReply = document.getElementById("deleteReply"  + index);
    		var editReplyButton = document.getElementById("editReplyButton"  + index);
    		
    		replycontent.style.display = "none";
    		editReply.style.display = "";
    		updateReply.style.display = "none";
    		deleteReply.style.display = "none";
    		editReplyButton.style.display = "";
    	}
    	
    	function updateReplyButton(reply, index){
    		var editReply = document.getElementById("editReply" + index);

    		location.href = "updateReply.do?replyTemp=" + reply + "&editReply=" + editReply.value;
    	}
    	
    	function deleteReply(rno){
    		var deleteCheck = confirm("댓글을 삭제하시겠습니까?");
    		
    		if(deleteCheck){
    			alert("댓글을 삭제하였습니다.")
    			location.href = "deleteReply.do?rnoString=" + rno + "&bno=" + ${board.bno};
    		}
    		
    		else{
    			alert("취소하였습니다.");
    		}
    	}
    	
    	function clickDno(value){
    		$("#dname").html(value);
    		
    		if(value == '직거래'){
    			$("#dno").val("1");
    		}
    		
    		else if(value == '택배'){
    			$("#dno").val("2");
    		}
    		
    		else if(value == '퀵택배'){
    			$("#dno").val("3");
    		}
    	}
    	
    	function clickCno(value){
    		$("#cname").html(value);
    		
    		if(value == '가전제품'){
    			$("#cno").val("2");
    		}
    		
    		else if(value == '가구'){
    			$("#cno").val("3");
    		}
    		
    		else if(value == '의류잡화'){
    			$("#cno").val("4");
    		}
    		
    		else if(value == '생활용품'){
    			$("#cno").val("5");
    		}
    		
    		else if(value == '취미용품'){
    			$("#cno").val("6");
    		}
    		
    		else if(value == '기타'){
    			$("#cno").val("7");
    		}
    	}
    	
    	function deleteBoard(){
    		var boardCheck = confirm("게시글을 삭제하시겠습니까?");
			
			if(boardCheck){
				alert("게시글을 삭제하였습니다.");
    			location.href = "deleteBoard.do?bno=" + ${board.bno};
			}
			
			else{
				alert("취소하였습니다.");
			}
    	}
    	
    	function updateBoard(){
    		var frm2 = document.getElementById("frm2");
			var boardCheck = confirm("게시글을 수정하시겠습니까?");
			var fileCount = 0;
			
			for(var temp = 0; temp < count; temp++){
				if($("#fileup" + temp).val() != 'undefiend' && $("#fileup0").val() != null){
					fileCount++;
				}
			}
			
			if(boardCheck){
				if(fileCount != 0){
					var uploadCheck = confirm("사진을 새로 등록하시겠습니까? 기존의 사진은 삭제됩니다.");
					
					if(uploadCheck){
						alert("게시글을 수정하였습니다.");
						frm2.submit();
					}
					
					else{
						alert("취소하였습니다.");
					}
				}
				
				else{
					var uploadCheck = confirm("사진을 등록하지 않으시겠습니까? 기존의 사진은 삭제됩니다.");
					
					if(uploadCheck){
						alert("게시글을 수정하였습니다.");
						frm2.submit();
					}
					
					else{
						alert("취소하였습니다.");
					}
				}
			}
			
			else{
				alert("취소하였습니다.");
			}
    	}
    	
    </script>
</head>

<body>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-9">
            	<div class="row carousel-holder">
                    <div class="col-md-12">
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<% int imageIndex = 0; %>
								<c:forEach var = "boardfile" items="${board.files}">
									<!-- 여기에 넘어가는 사진들 index 번호랑 해서 넣으면 됨 -->
									<% 
										if(imageIndex == 0){
									%>
								    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
								    <%  imageIndex++;
								    	}
										else{ 
									%>
								    <li data-target="#carousel-example-generic" data-slide-to="<%=imageIndex++%>"></li>
								    <% } %>
							    </c:forEach>
							</ol>
							<div class="carousel-inner">
								<!-- 여기에 넘어가는 사진들 넣으면 됨 -->
								<% boolean imageFirst = true; %>
								<c:forEach var = "boardfile" items="${board.files}">
									<% 
										if(imageFirst){
									%>
									    <div class="item active">
									        <img class="slide-image" src="upload/${boardfile.sfilename}" alt="" style = "height : 400px;">
									    </div>
									<% 
										imageFirst = false;
										} 
										else{
									%>
									    <div class="item">
									        <img class="slide-image" src="upload/${boardfile.sfilename}" alt="" style = "height : 400px;">
									    </div>
									<% } %>

							    </c:forEach>
							</div>
							<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							    <span class="glyphicon glyphicon-chevron-left"></span>
							</a>
							<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							    <span class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</div>            
            	</div>
                <div class="thumbnail">
					<div class="caption-full">
						<a id = "cartbutton" class = "btn"
							onclick = "update()" style = "color : black;">담기</a>
						<a class = "btn" onclick = "back()" 
							style = "background-color : #63A69F; color : #fff">목록</a>
						<a style = "background-color : #F2E1AC; display : none; color : #fff;" class = "btn" 
							data-toggle = "modal" data-target="#myModal" id = "modifyBoard">수정</a>
						<a style = "background-color : #F2836B; display : none; color : #fff;" class = "btn"
						 	onclick = "deleteBoard()" id = "deleteBoard">삭제</a>
                    	<h4 style = "font-weight : bold;">작성자: ${member.nick}</h4>
                    	<p><p style = "float : left; font-weight : bold">작성일 :&nbsp;</p> ${board.regdate}</p>
                    	<p><p style = "float : left; font-weight : bold">연락처 :&nbsp;</p>${board.phoneNum}</p>
                    	<p><p style = "float : left; font-weight : bold">거래방법 :&nbsp;</p>${dealway}</p>
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
							<input type = "hidden" id = "bno" value = "${board.bno}"  name="bno">
	                    	<textarea class = "reply" id = "replycontent"  name="replycontent"></textarea>
	                    	<input type = 'submit' class = "btn btn-success" value = "댓글달기"/>
	                    </div>
                    </form>

                    <hr>

					<!-- 디비에서 댓글 가져와서 div 하나씩 생성하자 -->
					<div id = "replyDiv">
						<c:forEach var = "reply" items="${replys}">
							<div class="row" style = "border-top : 1px solid #d3d3d3; padding-top : 7px;">
		                        <div class="col-md-12">
		                        	<span style = "font-weight : bold;">
		                        		작성자: ${reply.nick}
		                        	</span>
		                            <span class="pull-right" style = "font-weight : bold;">
		                            	${reply.regdate}
		                            </span>
		                            <table style = "width : 100%;">
			                            <tr>
			                            	<td style = "width : 88%;">
					                            <p style = "margin-top : 5px;" id = "reply<%=index%>">
					                            	${reply.replyContent}
					                            </p>
					                            <textarea class = "reply" id = "editReply<%=index %>" style = "display : none; height : 40px; margin-top : 10px;">${reply.replyContent}</textarea>
				                            </td>
				                            <c:if test = "${reply.mno == member.mno}">
					                            <td>
					                            	<button type="button" class="btn btn-default btn-sm" 
											        	id = "deleteReply<%=index %>" 
											        	onclick = "deleteReply('${reply.rno}')">
											        	<span class="glyphicon glyphicon-remove"></span> 
											        </button>
						                            <button type="button" class="btn btn-default btn-sm" 
						                            	id = "updateReply<%=index %>"
						                            	onclick = "updateReply('${reply}', <%=index%>)"
						                            	style = "background-image : url('img/asd.PNG')">
											        	<span class="glyphicon glyphicon-edit"></span>
											        </button>
											        <a class = "btn btn-success" 
											        	id = "editReplyButton<%=index%>"
											        	style = "display : none; margin-left : 30px;"
											        	onclick = "updateReplyButton('${reply}', <%=index++%>)">
											        	완료
											        </a>
										        </td>
									        </c:if>
								        </tr>
							        </table>
		                        </div>
	                    	</div>
						</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"
						style = "font-weight : bold; text-align: center; font-size : 20px;">								
						<c:if test = '${sellbuy == 1}'>
							구매게시글 수정
						</c:if>
						<c:if test = '${sellbuy == 2}'>
							판매게시글 수정
						</c:if>
					</h4>
				</div>
				<form method = 'post' action = "insertBoard.do" enctype="multipart/form-data" id = "frm2">
					<div class="modal-body">
						<table align="center" width="300">
							<tr height="50">
								<td><label for="mno">아이디</label></td>
								<td><input type="text" name="mno" id="mno"
									disabled="disabled" value="${mno }" /></td>
							</tr>
							<tr height="50">
								<td><label for="title">제목</label></td>
								<td>
									<input type="text" name="title" id="title" 
											placeholder="title" value = "${board.title}"/>
								</td>
							</tr>
							<tr height="50">
								<td><label for="phonenum">연락처</label></td>
								<td>
									<input type="text" name="phoneNum" id="phoneNum"
											placeholder="phone number" value = "${board.phoneNum}"/>
								</td>
							</tr>
							<tr height="50">
								<td><label for="price">가격</label></td>
								<td>
									<input type="text" name="price" id="price"
											placeholder="price" value = "${board.price}"/>
								</td>
							</tr>
							<input type="hidden" name="dealstate" id="dealstate" 
									value = "${board.dealstate}"/>
							<tr height="50">
								<td><label for="dno">거래방법</label></td>
								<td>
									<div class="btn-group">
									  <a id = "dname" name = "dname" href="#" class="btn btn-default">${dealway}</a>
									  <input type = "hidden" id = "dno" name = "dno" value = "${board.dno}"/>
									  <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></a>
									  <ul class="dropdown-menu">
									    <li onclick = "clickDno('직거래')"><a href="#">직거래</a></li>
									    <li onclick = "clickDno('택배')"><a href="#">택배</a></li>
									    <li onclick = "clickDno('퀵택배')"><a href="#">퀵택배</a></li>
									  </ul>
									</div>
								</td>
							</tr>
							<tr height="50">
								<td><label for="cno">카테고리</label></td>
								<td>
									<div class="btn-group">
									  <a id = "cname" href="#" class="btn btn-default">${category}</a>
									  <input type = "hidden" id = "cno" name = "cno" value = "${board.cno}"/>
									  <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></a>
									  <ul class="dropdown-menu">
									    <li onclick = "clickCno('가전제품')"><a href="#">가전제품</a></li>
									    <li onclick = "clickCno('가구')"><a href="#">가구</a></li>
									    <li onclick = "clickCno('의류잡화')"><a href="#">의류잡화</a></li>
									    <li onclick = "clickCno('생활용품')"><a href="#">생활용품</a></li>
									    <li onclick = "clickCno('취미용품')"><a href="#">취미용품</a></li>
									    <li onclick = "clickCno('기타')"><a href="#">기타</a></li>
									  </ul>
									</div>
								</td>
							</tr>
							<tr height="50">
								<td><label for="fileup">업로드할 파일</label></td>
								<td><input type="button" name="addFile" id="addFile"
									value="파일 추가" /></td>
							</tr>
							<tr height="50">
								<td colspan="2" id="fileUpForm"></td>
							</tr>
							<tr>
								<td colspan="2"><label for="content">내용</label></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><textarea name="contents"
										id="contents" cols="70" rows="15" placeholder="content">${board.contents}</textarea></td>
							</tr>
							<tr>
								<input type = "hidden" id = "bno" name = "bno" value = "${board.bno}"/>
								<td colspan="2" align="center">
								<button type="button" onclick = "updateBoard()" class="btn btn-primary">
									게시글수정
								</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td>
							</tr>
						</table>
					</div>
				</form>
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
