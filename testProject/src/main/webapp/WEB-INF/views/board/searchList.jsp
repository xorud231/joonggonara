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


 
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 
<title>Insert title here</title>
 
<link href="css/style.css" rel="stylesheet">
<style type="text/css">
select { 
   width: 80px; 
   height: 30px; 
   padding-left: 10px; 
   font-size: 18px; 
   color: #787278;
   border: 1px solid #006fff; 
   border-radius: 3px; 
   -webkit-appearance: none;  
   -moz-appearance: none;     
   appearance: none; 
} 
select::-ms-expand { 
   display: none;             
} 
 
</style>

<!-- jQuery -->
<script src="js/jquery.js"></script>
 
<script type="text/javascript">
	$(function(){
		$("#addFile").click(addFileForm);
	});
	var count=0;   //file form index
	function addFileForm(){
		var html="<div id='item_"+count+"'>"
		html+="<input type='file' id = 'fileup' name='fileup' style='display : inline' />";
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

	//조건 검색, 페이지 번호로 게시글 요청을 위한 메서드  
	function pagelist(cpage){
		//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
		document.getElementById("pageNo").value=cpage;
		var frm = document.getElementById("frm");
		var sellbuy = <%= session.getAttribute("sellbuy") %>;
		var sellbuyCheck = <%= session.getAttribute("sellbuyCheck") %>;
		
		if(sellbuy == 1)
			frm.action="searchBuyList.do";
		else if(sellbuy == 2)
			frm.action="searchSellList.do";
		else if(sellbuy == 3){
			if(sellbuyCheck == 1)
				frm.action="searchBuyCart.do";
			else
				frm.action="searchSellCart.do";
		}
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
 
	function insertBoard(){
		var frm2 = document.getElementById("frm2");
		
		var insertCheck = confirm("게시글을 등록하시겠습니까?");
		
		if(insertCheck){
			alert("게시글을 등록하였습니다.");
			frm2.submit();
		}
		
		else{
			alert("취소하였습니다.");
		}
	}
</script>

</head>
<body>
	<div class="main">
		<form id="frm" >
			<input type="hidden" id="pageNo"  name="pageNo"  value="1"/>
			<input type="hidden" id="bno"  name="bno"/>
			
               <div class="row">
					<input type="hidden" id="sellbuy"  name="sellbuy"  value="1"/>
					 <c:forEach  var="board" items="${list}">
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
 							<img class="slide-image" src="upload/${board.files[0].sfilename}"  style = "width:320px; height:150px" alt="">
                            <div class="caption">
                                <h4 class="pull-right">￦${board.price}</h4>
                                <h4><a href="#" onclick="getBoard(${board.bno})">${board.title}</a>
                                </h4>
                                <p style = "overflow: hidden; text-overflow: ellipsis;">${board.contents}</p><br/>
                            </div>
                            <div class="ratings">
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    </div>
                    
                    <table align="center">
	  	<tr align="center">
	  	 <td colspan="3" height="100" align="center">
	  	  <select  name="key" id="key">
	  		<option value="all"  selected="selected"   >--all--</option>
	  		<option value="mno"      <%=pageBean.getKey("mno")%> >아이디</option>
	  		<option value="title"   <%=pageBean.getKey("title")%>  >제목</option>
	  		<option value="contents" <%=pageBean.getKey("contents")%>  >내용</option>
	  	  </select>
	  	  <input type="text" id="word" name="word" value="${pageBean.word}"/>
	  	  <input type = "hidden" id = "cno" name = "cno" value="${pageBean.cno}"/>
	  	  <a href="#" onclick="pagelist(1)" class="myButton">검색</a>
	  	  <a data-toggle = "modal" class="myButton" data-target="#myModal">글쓰기</a>

	  	 </td>
	  	</tr>
		</table>
		<div class="bottom"><center>${pageBean.pagelink } </center></div>
            </form>
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
								구매게시글 등록
							</c:if>
							<c:if test = '${sellbuy == 2}'>
								판매게시글 등록
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
									<td><input type="text" name="title" id="title"placeholder="title" /></td>
								</tr>
								<tr height="50">
									<td><label for="phonenum">연락처</label></td>
									<td><input type="text" name="phoneNum" id="phoneNum"
										placeholder="phone number"/></td>
								</tr>
								<tr height="50">
									<td><label for="price">가격</label></td>
									<td><input type="text" name="price" id="price"
										placeholder="price"/></td>
								</tr>
								<input type="hidden" name="dealstate" id="dealstate" value = "1"/>
								<tr height="50">
									<td><label for="dno">거래방법</label></td>
									<td>
										<div class="btn-group">
										  <a id = "dname" name = "dname" href="#" class="btn btn-default">거래방법</a>
										  <input type = "hidden" id = "dno" name = "dno" value = ""/>
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
										  <a id = "cname" href="#" class="btn btn-default">거래방법</a>
										  <input type = "hidden" id = "cno" name = "cno" value = ""/>
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
											id="contents" cols="70" rows="15" placeholder="content"></textarea></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
									<button type="button" onclick = "insertBoard()" class="btn btn-primary">
										게시글등록
									</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>