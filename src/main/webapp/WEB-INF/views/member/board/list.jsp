<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송파여성인력개발센터</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
    flex: 1;
    margin-left: 250px;
    margin-top: 160px;
    overflow-y: auto;
    height: 100%;
}

.content {
    padding: 20px;
    background-color: #fff;
}

.content h2 {
    margin-bottom: 20px;
}

.title-container{
	display: flex;
    align-items: center; /* 수직 가운데 정렬 */
}

.title-container h1{
	margin-right: 20px; /* 텍스트와 선택 박스 사이의 간격 */
	font-weight: bold;
}

.bi-house-fill {
	cursor: pointer;
	font-size: 20px;
}

/* boardList-wrapper 스타일 */
.boardList-wrapper {
	width: 70%;
    background-color: #fff;
    padding: 20px;
    margin: 20px auto;
}

.boardList-wrapper h2 {
    margin-bottom: 30px;
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table th, table td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    font-size: 14px;
}

/* 테이블 헤더 스타일 */
table th {
    background-color: #f4f4f4;
    color: #333;
    font-weight: bold;
}

/* 테이블 행 스타일 */
table tr {
    transition: background-color 0.3s ease;
}

/* 테이블 행에 마우스를 올렸을 때 배경색 변경 */
table tr:hover {
    background-color: #f9f9f9;
    cursor: pointer;
}

/* 테이블 번호 열 스타일 */
table td:first-child {
    font-weight: bold;
}

.search_wrap {
	margin-top: 20px;
	text-align: center; 
}

.search_input input[type=text] {
	margin: 0 5px;
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
}

.search_input button, #enrollBtn {
	background-color: #007bff;
	color: #fff;
	border: none;
	cursor: pointer;
}

.search_input button :hover, #enrollBtn :hover {
	background-color: #0056b3;
}

.btn-container {
    text-align: right;
    margin-bottom: 20px; /* 버튼과 테이블 사이의 간격을 조정 */
}

.pageMaker_wrap{
	text-align: center;
    margin-top: 30px;
    margin-bottom: 40px;
}
.pageMaker_wrap a{
	color : black;
}
.pageMaker{
    list-style: none;
    display: inline-block;
}	
.pageMaker_btn {
    float: left;
    width: 40px;
    height: 40px;
    line-height: 40px;
    margin-left: 20px;
}
.next, .prev {
    border: 1px solid #ccc;
    padding: 0 10px;
}
.next a, .prev a {
    color: #ccc;
}
.active{							/* 현재 페이지 버튼 */
	border : 2px solid black;
	font-weight:400;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

    <!-- 메뉴바 연결 -->
    <%@ include file="../../common/header.jsp"%>

    <!-- 사이드바 연결 -->    
    <%@ include file="../aside.jsp"%>

    <main>
        <!-- Main content -->
        <div class="content">
            <div class="boardList-wrapper">
				<table>
					<tr>
						<th>번호</th>
						<th width=70%>제목</th>
						<th>글쓴이</th>
						<th>등록일</th>
						<th>조회수</th>
						<th>좋아요</th>
					</tr>
					<c:set var="seq" value="0" />
            		<c:forEach items="${boardList}" var="board">
                		<tr onclick="window.location.href='${pageContext.servletContext.contextPath}/member/board/detail?boardNo=${board.boardNo}'">
                    		<td>${ board.boardNo }</td>
							<td>${ board.boardTitle }</td>
							<td>${ board.member.memberNickname }</td>
							<td>${ board.boardRegDate }</td>
							<td>${ board.boardCount }</td>
							<td>${ board.boardHeartCount }</td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- 등록버튼 -->
				<c:if test="${ sessionScope.loginMember.memberRole eq 'ROLE_MEMBER' }">
					<div class="btn-container">
						<button id="enrollBtn" class="btn search_btn">등록</button>
					</div>
				</c:if>
				
				<!-- 검색 영역 -->
				<div class="search_wrap">
					<form id="searchForm" action="/member/board/list" method="get">
						<div class="search_input">
							<input type="text" name="keyword"
								value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
							<input type="hidden" name="pageNum"
								value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
							<input type="hidden" name="amount"
								value='${pageMaker.cri.amount}'>
							<button class='btn search_btn'>검 색</button>
						</div>
					</form>
				</div>

				<!-- 페이지 이동 인터페이스 영역 -->
				<div class="pageMaker_wrap">

					<ul class="pageMaker">

						<!-- 이전 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageMaker_btn prev"><a href="${pageMaker.pageStart - 1}">이전</a></li>
						</c:if>

						<!-- 페이지 번호 -->
						<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
							<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active" : ""}"><a href="${num}">${num}</a></li>
						</c:forEach>

						<!-- 다음 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageMaker_btn next"><a href="${pageMaker.pageEnd + 1 }">다음</a></li>
						</c:if>

					</ul>

				</div>
				<form id="moveForm" action="/member/board/list" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				</form>
			</div>
        </div>
    </main>

    <!-- 푸터 연결 -->
    <%@ include file="../../common/footer.jsp"%>
    
    <script>
    let message = '${message}';
	if(message) {
		alert(message);
	}
	
	$("#enrollBtn").click(function() {
        window.location.href = '${pageContext.servletContext.contextPath}/member/board/enroll';
    });
	
	let moveForm = $('#moveForm');
	//페이지 이동 버튼
	$(".pageMaker_btn a").on("click", function(e){
	    e.preventDefault();
	    let pageNum = $(this).attr("href");
	    moveForm.find("input[name='pageNum']").val(pageNum);
	    moveForm.submit();
	});
	
	function showboardDetail(event, boardNo) {
		window.location.href = '${pageContext.servletContext.contextPath}/member/board/detail?boardNo=' + boardNo;
	}
	
	
	</script>

</body>
</html>
