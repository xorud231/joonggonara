<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD

=======
 
>>>>>>> branch 'master' of https://github.com/xorud231/joonggonara.git
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">고객 정보</h1>
	<table align="center">
		<caption></caption>
		<tr>
			<td>이 름</td>
			<td>${member.name}</td>
		</tr>
		<tr>
			<td>사 번</td>
			<td>${member.mno}</td>
		</tr>
		<tr>
			<td>닉 네 임</td>
			<td>${member.nick}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${member.phonenum}</td>
		</tr>
		<tr>
			<td>주 소</td>
			<td>${member.address}</td>
		</tr>
<<<<<<< HEAD
		<tr>

=======
		<button type="button" class="btn btn-primary btn-lg"
			data-toggle="modal" data-target="#updateModal">수   정</button>
		&nbsp;&nbsp;&nbsp;&nbsp; <a href="delete.do" class="btn btn-default-lg" >탈  퇴</a>
		<tr>
 			<td colspan='2' align='center' class='tfoot tspacial'>
		
		
			<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
				aria-labelledby="updateModalLabel" aria-hidden="true"
				style="margin-top: 270px">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h2 class="modal-title" id="updateModalLabel" align="center">
								<font color="black">정보수정</font>
							</h2>
						</div>
						 <form method="post" action="memberUpdate.do"> 
						<div class="modal-body">
						
							<table align='center' style="color: black">
								<tr>
									<td >사 번</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td class='tbasic'><input type='text' name='mno' id='mno'
										value='${member.mno}'></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td >비밀번호</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td class='tbasic'><input type='password' name='password'
										id='password' value='${member.password}'></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td >이 &nbsp;름</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td ><input type='text' name='name'
										id='name' value='${member.name}'></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td >닉네임</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td ><input type='text' name='nick'
										id='nick' value='${member.nick}'>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td >전화번호</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td ><input type='text' name='phonenum'
										id='phonenum' value='${member.phonenum}'>
								<tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td >주 &nbsp;소</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td ><input type='text' name='address'
										id='address' value='${member.address}'>
								</tr>
								<!--  <tr>
									<td colspan='2' align='center' class='tfoot tspacial'>
										<button type="submit" class="btn btn-primary">수정</button> <a
										href="myPage.do" class="btn btn-default">취소</a>
									</td>
								</tr>-->
							</table>
							
						</div>
						<div class="modal-footer">
						<button type="submit" class="btn btn-primary" value="전송" >수  정</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal" value="취소">닫  기</button>
							
						</div>
						</form>
					</div>
				</div>
			</div>
		 <script src="http://code.jquery.com/jquery-latest.min.js"></script> <script
			src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
		<!-- ie10-viewport-bug-workaround.js --> <script
			src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
		<!-- holder.js -->
>>>>>>> branch 'master' of https://github.com/xorud231/joonggonara.git
		</tr>
	</table>
	
<<<<<<< HEAD
		
	<td colspan='2' align='center' class='tfoot tspacial'>
			<button type="button" class="btn btn-primary btn-lg"
			data-toggle="modal" data-target="#updateModal">수   정</button>
		&nbsp;&nbsp;&nbsp;&nbsp; <a href="delete.do" class="btn btn-default-lg" >탈  퇴</a>
			<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
				aria-labelledby="updateModalLabel" aria-hidden="true"
				style="margin-top: 270px">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h2 class="modal-title" id="updateModalLabel" align="center">
								<font color="black">정보수정</font>
							</h2>
						</div>
						<div class="modal-body">
						<form method="post" action="memberUpdate.do">
							<table align='center' style="color: black">
								<tr>
									<td class='tbasic'>사 번</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td class='tbasic'><input type='text' name='mno' id='mno'
										value='${member.mno}'></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class='tbasic'>비밀번호</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td class='tbasic'><input type='password' name='password'
										id='password' value='${member.password}'></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class='tbasic'>이 &nbsp;름</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td class='tbasic'><input type='text' name='name'
										id='name' value='${member.name}'></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class='tbasic'>닉네임</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td class='tbasic'><input type='text' name='nick'
										id='nick' value='${member.nick}'>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class='tbasic'>전화번호</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td class='tbasic'><input type='text' name='phonenum'
										id='phonenum' value='${member.phonenum}'>
								<tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
									<td class='tbasic'>주 &nbsp;소</td>
									<td>&nbsp;&nbsp;:&nbsp;&nbsp;</td>
									<td class='tbasic'><input type='text' name='address'
										id='address' value='${member.address}'>
								</tr>
								<!--  <tr>
									<td colspan='2' align='center' class='tfoot tspacial'>
										<button type="submit" class="btn btn-primary">수정</button> <a
										href="myPage.do" class="btn btn-default">취소</a>
									</td>
								</tr>-->
							</table>
							</form>
						</div>
						<div class="modal-footer">
						<button type="submit" class="btn btn-primary" value="전송" >수  정</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal" value="취소">닫  기</button>
							
						</div>
					</div>
				</div>
			</div>
		 <script src="http://code.jquery.com/jquery-latest.min.js"></script> <script
			src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
		<!-- ie10-viewport-bug-workaround.js --> <script
			src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
		<!-- holder.js -->
=======
>>>>>>> branch 'master' of https://github.com/xorud231/joonggonara.git
</body>
</html>
