<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>	
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
<link href="css/creative.min.css" rel="stylesheet">
</head>
<body>
	<div class="header-content">
		<div class="header-content-inner" align="center">
				<h1 align="center">고객 정보</h1>
		<table align="center">
			<caption></caption>
			<tr>
				<th>사 번</th>
				<td>${member.mno}</td>
			</tr>
			<tr>
				<th>이 름</th>
				<td>${member.name}</td>
			</tr>
			
			<tr>
				<th>닉 네 임</th>
				<td>${member.nick}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${member.phonenum}</td>
			</tr>
			<tr>
				<th>주 소</th>
				<td>${member.address}</td>
			</tr>
			<tr>
		</table>
			</br>
			</br>
			<p></p>
			<p></p>
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myupdateModal">수 정</button>
			&nbsp;&nbsp;&nbsp;&nbsp; <button type="button" class="btn btn-default btn-lg"
				data-toggle="modal" data-target="#mydeleteModal" style="color: gray">회원탈퇴</button>
		</div>
	</div>

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
	</body>
</html>

