<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">고객 정보</h1>
	<table align="center">
		<caption></caption>
		<tr><td>이    름</td><td>${member.name}</td></tr>
		
		<tr><td>사    번</td><td>${member.mno}</td></tr>
		<tr><td>닉 네 임</td><td>${member.nick}</td></tr>
		<tr><td>전화번호</td><td>${member.phonenum}</td></tr>
		<tr><td>주    소</td><td>${member.address}</td></tr>
	</table>
</body>
</html>






