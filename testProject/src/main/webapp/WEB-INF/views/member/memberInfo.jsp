<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
 
 
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
 
 
 <script src="js/jquery.js"></script>
 <style type="text/css">
 #contact{
  margin-left: -250px;
  margin-top: -50px;
 
 
 }
 .form-group col-xs-12 floating-label-form-group controls{
 color: white;
 
 }
 
 </style>
 <script type="text/javascript">  </script>
 	<!-- Bootstrap Core CSS -->

    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
 	
<!-- Theme CSS -->
<link href="css/creative.min.css" rel="stylesheet">

    
 
 
</head>
<body>

<!-- Contact Section -->
    <section id="contact" >
        <div class="container" style="color: #9D9D9D">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>고객 정보</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2" >
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                           		<input type="text" value="사번 " disabled="disabled">
                                <input type="text" value="${member.mno}" disabled="disabled">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls" >
                                <input type="text" value="이름 " disabled="disabled">
                                <input type="text" value="${member.name}" disabled="disabled">
                            </div>
                        </div>
                        <br/>
                        
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                           		 <input type="text" value="닉네임" disabled="disabled">
                                <input type="text" value="${member.nick}" disabled="disabled">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                           		 <input type="text" value="전화번호" disabled="disabled">
                                <input type="text" value="${member.phonenum}" disabled="disabled">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                           		 <input type="text" value="주소" disabled="disabled">
                                <input type="text" value="${member.address}" disabled="disabled">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        
                    </form>
                </div>
            </div>
        </div>
    </section>

 
	
	<div class="header-content">
		<div class="header-content-inner" align="center" style="margin-left: -200px; margin-top: -100px">
			<a type="button" class="btn btn-primary btn-lg"  
				data-toggle="modal" data-target="#myupdateModal">수 정</a>
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="delete.do"
				class="btn btn-default-lg">탈 퇴</a>
		</div>
	</div>
	<div class="container">
 
		<!-- 버튼 -->
	<form action="memberUpdate.do" method="post" >
		<!-- 모달 팝업 -->
		<div class="modal fade" id="myupdateModal" tabindex="-1" role="dialog"
			aria-labelledby="updateModalLabel" aria-hidden="true"
			style="margin-top: 270px">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h2 class="modal-title" id="updateModalLabel" align="center">
							<font color="black">회원정보</font>
						</h2>
					</div>
					<div class="modal-body">
						<table align='center'>
							
							<tr>
								<th >사&nbsp;&nbsp;&nbsp;&nbsp;번</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td><td>${member.mno}</td>
								<td ><input type="hidden"  name='mno' id='mno' 
									value='${member.mno}'></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th >비밀번호</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td ><input type='password' name='password'
									id='password' value='${member.password}'></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td ><input type='text' name='name'
									id='name' value='${member.name}'></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th>닉&nbsp;네&nbsp;임</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td ><input type='text' name='nick'
									id='nick' value='${member.nick}'>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td><input type='text' name='phonenum'
									id='phonenum' value='${member.phonenum}'>
							<tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
								<th>주&nbsp;&nbsp;&nbsp;&nbsp;소</th>
								<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td><input type='text' name='address'
									id='address' value='${member.address}'>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							data-dismiss="modal">닫 기</button>
							 <button type="submit" style="color: white" class="btn btn-primary"  >수  정</button>
					</div>
				</div>
			</div>
		</div>
		</form>
		
		<div class="modal fade" id="mydeleteModal" tabindex="-1" role="dialog"
			aria-labelledby="deleteModalLabel" aria-hidden="true">
 
			<div class="modal-dialog modal-lg">
 
				<div class="modal-content">
 
					<div class="modal-header">
 
						<button type="button" class="close" data-dismiss="modal">
 
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="deleteModalLabel" align="center" >
							<font color="black">정말 탈퇴하시겠습니까?</font>
						</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" value="취소">닫 기</button>
						<a href="delete.do" class="btn btn-primary" value="전송" >확 인</a>
					</div>
				</div>
			</div>
	</div>
 
 
	</div>
</body>
</html>