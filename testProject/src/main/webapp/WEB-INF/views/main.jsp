<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Creative - Start Bootstrap Theme</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="css/creative.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



</head>

<body id="page-top">
	
 	
 	 
 	 

	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i
					class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand page-scroll" href="#page-top"></a>
		</div>


	</div>
	<!-- /.container-fluid --> </nav>

	<header>
	<div class="header-content">
		<div class="header-content-inner">
			<h1 id="homeHeading">Welcome to KDN 중고나라!</h1>
			<hr>
			<p></p>
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">로그인</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#insertModal">회원가입</button>
		</div>
	</div>
	<div class="container">
	<% String mno = (String) session.getAttribute("mno");
 	if(mno ==null){    //로긴을 하지 않은 경우   로그인 화면 출력
 	  Cookie[] cookies = request.getCookies();
 		String idSave ="";
 	    for(Cookie cookie: cookies){
 	    	if(cookie.getName().equals("idsave")){
 	    		idSave = cookie.getValue();
 	    	}
 	    }
 	    String msg = (String)request.getAttribute("msg");
 	    if(msg!=null && !msg.equals("")){ 
 	    	out.println("<script type='text/javascript'>"
 	    	+ "alert('" + msg + "')"
 	    	+ "</script>");
 	 	}
 	 }
 	 %>
		<!-- 버튼 -->

		<!-- 모달 팝업 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="margin-top: 350px">
		
			<div class="modal-dialog modal-lg">
				
				<div class="modal-content">
				
					<div class="modal-header">
					
						<button type="button" class="close" data-dismiss="modal">
						
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h2 class="modal-title" id="myModalLabel">
							<font color="black">LOGIN</font>
						</h2>
					</div>
					
					<form action="login.do" method="post" id="frm">
						<div class="modal-body">
						
							<table align="center" style="color: black">
							
								<tr>
									<th>사    번</th>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td><input type="text" name="mno" id="mno"
										 placeholder="사 번" style="font-style: italic;" />
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td><input type="password" name="password" id="password"
										placeholder="비밀번호" style="font-style: italic;" /></td>

								</tr>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">
								<a style="color: white">로그인</a>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>


	</div>
	<form method="post" action="insertMember.do">
		<div class="modal fade" id="insertModal" tabindex="-1" role="dialog"
			aria-labelledby="insertModalLabel" aria-hidden="true"
			style="margin-top: 270px">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h2 class="modal-title" id="insertModalLabel">
							<font color="black">회원가입</font>
						</h2>
					</div>
					<div class="modal-body">
						<table align='center' style="color: black" >
							<tr>
								<th>사&nbsp;&nbsp;&nbsp;&nbsp;번</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td><input type='text' name='mno' id='mno' alt="mno"
									placeholder="사 번" style="font-style: italic"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td><input type='text' name='name' id='name'
									placeholder="이 름" style="font-style: italic"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td><input type='password' name='password' id='password'
									placeholder="비밀번호" style="font-style: italic"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th>닉&nbsp;네&nbsp;임</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td><input type='text' name='nick' id='nick'
									placeholder="닉 네 임" style="font-style: italic">
							</tr>
							<tr>
								<td>&nbsp;</td>
							<tr>
								<th>연&nbsp;락&nbsp;처</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td><input type='text' name='phonenum' id='phonenum'
									placeholder="연 락 처(-빼고 입력)" style="font-style: italic">
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th>주&nbsp;&nbsp;&nbsp;&nbsp;소</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td><input type='text' name='address' id='address'
									placeholder="주 소" style="font-style: italic">
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" value="취소">닫기</button>
						<button type="submit" class="btn btn-primary" value="전송" >회원가입</button>
					</div>
				</div>
			</div>
		</div>
	</form>
 	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script> <script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
</body>
</html>