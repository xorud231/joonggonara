<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<link href="../css/basic.css" rel="stylesheet" type="text/css">
</head>
<body>
<form method="post" action="memberUpdate.do" >
<table  align='center' >
	<tr><td class="caption" colspan='2'>회원정보수정</td></tr>
	<tr><td class='tbasic'>사    번</td>
	    <td class='tbasic'><input type='text' name='mno'  id='mno' value = '${member.mno}'></td>
	</tr>
	<tr><td class='tbasic'>비밀번호</td>
	    <td class='tbasic'><input type='password' name='password'  id='password' value = '${member.password}'></td>
	</tr>
	<tr><td class='tbasic'>이 &nbsp;름</td>
	    <td class='tbasic'><input type='text' name='name'  id='name' value = '${member.name}'></td>
	</tr>
	<tr><td class='tbasic'>닉네임</td>
	    <td class='tbasic'><input type='text' name='nick'  id='nick' value = '${member.nick}'>
	</tr>
	<tr><td class='tbasic'>전화번호</td>
	    <td class='tbasic'><input type='text' name='phonenum'  id='phonenum' value = '${member.phonenum}'>
	<tr><td class='tbasic'>주 &nbsp;소</td>
	    <td class='tbasic'><input type='text' name='address'  id='address' value = '${member.address}'>
	</tr>
	<tr>
	   <td colspan='2' align='center' class='tfoot tspacial'>
	     <button type="submit" class="btn btn-primary" >수정</button>
		 <a href="myInfo.do" class="btn btn-default">취소</a>
	   </td>
	</tr>
</table>
</form>
</body>
</html>






