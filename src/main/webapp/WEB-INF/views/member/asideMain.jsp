<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송파여성인력개발센터</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>

/* CSS Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	height: 1080px;
}

body {
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	/* min-height: 100vh; */
}

main {
<<<<<<< HEAD
    flex: 1;
    margin-left: 300px;
    margin-top: 110px;
    overflow-y: auto;
    height: 100%;
=======
	flex: 1;
	margin-left: 300px;
	margin-top: 110px;
	overflow-y: auto;
	height: 100%;
>>>>>>> refs/heads/develop
}

</style>
</head>
<body>

    <!-- 메뉴바 연결 -->
    <%@ include file="../common/header.jsp"%>

    <!-- 사이드바 연결 -->
    <%@ include file="aside.jsp"%>

   <main>
        <!-- Main content -->   
        <div>
        	글자라도 써봅니다
        </div>
    </main>

	<!-- 푸터 연결 -->
	<%@ include file="../common/footer.jsp"%>

</body>
</html>