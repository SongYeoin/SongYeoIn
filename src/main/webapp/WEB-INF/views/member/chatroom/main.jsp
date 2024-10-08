<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@page import="java.util.Date"%> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방</title>

<style>
body{
width: 100vw;  
height: 100vh; 
}

* {
    box-sizing: border-box;
}

html, body {
    overflow-x: hidden;
    overflow-y: auto; /* 수직 스크롤 보이기 */
}
.content{
	padding:80px 0 0;
}


.grid-rows{
	display:grid;
	grid-template-columns: 1.3fr 3fr;
	gap: 10px; /* 열 사이의 간격 */
}


.scrollable-div{
	 width: 380px; /* 너비 설정 */
     height: 650px; /* 높이 설정 */
     border: 1px solid #ccc; /* 테두리 설정 */
     overflow: auto; /* 스크롤을 자동으로 추가 */
}

a.custom{
	 text-decoration: none !important;
}

/* styles.css */

/* 모달 창을 숨깁니다. */
.modal {
	display: none; /* 숨김 */
    position: fixed; /* 고정 위치 */
    z-index: 1; /* 위쪽에 표시 */
    overflow: auto; /* 스크롤 가능 */
    background-color: rgba(0,0,0,0.4); /* 반투명 배경 색 */
    display: flex; /* 플렉스 박스 레이아웃 사용 */
    justify-content: center; /* 수평 중앙 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
}

/* 모달 내용 스타일 */
.modal-content {
    background-color: #fefefe;
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* 너비 설정 */
    max-width: 500px; /* 최대 너비 설정 */
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3); /* 그림자 추가 */
}

/* 닫기 버튼 스타일 */
.close {
    color: #aaa;
    float: right;
    font-size: 15px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}




#chat {
    max-height: 100vh;
    max-width: 100vw;
    overflow-y: auto;  /* 수직 스크롤 추가 */
    padding: 0;
    list-style: none;
    margin: 0;
}

</style>

<!-- Font Awesome -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.min.css"
  rel="stylesheet"
/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
</head>
<body>
	<!-- 메뉴바 연결 -->
	<%@ include file="../../common/header.jsp"%>
	<section class="content">
		<div class="w-100 h-100 p-3 py-4">

			<div class="grid-rows">
				<div class="d-flex align-items-start">
				<div class="w-100 h-100  p-3 border --bs-light-border-subtle rounded-3">
				
					 <button id="openModalBtn">채팅방 생성</button>
					 <!--모달구조  -->
					 <div id="chatModal" class="modal">
					 	<div class="modal-content">
					 		<span class="close">닫기</span>
					 		<h5>담당자를 선택해주세요</h5>
							 <form action="${pageContext.servletContext.contextPath}/member/chatroom/createroom" method="post" id="createRoomForm" onsubmit="return setChatRoomName();">
							    <table border="1">
							        <!-- 테이블 헤더 -->
							        <tr>
							            <th>담당자명</th>
							            <th>수강과목명</th>
							            <th>선택</th> <!-- 라디오 버튼을 위한 열 -->
							        </tr>
							
							
							        <!-- 리스트 항목을 반복해서 출력 -->
							        <c:forEach items="${enrollList}" var="cEnroll" varStatus="status">
							        <!-- 이전에 출력된 adminNo 값을 저장할 변수 -->
							        <c:set var="previousAdminNo" value="${enrollList[status.index - 1].syclass.adminNo}"/>
							            <tr>
							                <!-- 담당자명 출력 -->
							                <td>
							                    <c:out value="${cEnroll.syclass.managerName}"/>
							                </td>
							                <!-- 수강과목명 출력 -->
							                <td>
							                    <c:out value="${cEnroll.syclass.className}"/>
							                </td>
							                <!-- 라디오 버튼 -->
							                <td>
							                    <c:choose>
												    <c:when test="${cEnroll.syclass.adminNo != previousAdminNo && !fn:contains(countOneSet, cEnroll.syclass.adminNo)}">
												        <input type="radio" name="adminNo" value="${cEnroll.syclass.adminNo}" />
												        <c:set var="previousAdminNo" value="${cEnroll.syclass.adminNo}"/>
												    </c:when>
												    <c:otherwise>
												    </c:otherwise>
												</c:choose>
							                </td>
							            </tr>
							        </c:forEach>
							    </table>
							
							    <!-- 제출 버튼 -->
							    <input type="submit" value="생성하기">
							</form>
					 	</div>
					 </div>
					 
					 <!-- 채팅방 목록 보기 -->
					<div class="card">
						<div class="card-body w-auto scrollable-div">

							<ul class="list-unstyled mb-0">
							<c:forEach items="${chatRoomInfos}"  var="room">
								<li class="p-2 border-bottom bg-body-tertiary"
								data-chat-room-no="${room.chatRoomNo}"
								onclick="selectChatRoom('${room.chatRoomNo}','${room.receiverNo}',this,'${room.memberProfileUrl }')"
								 ><a class="custom d-flex justify-content-between">
										<div class="d-flex flex-row">
												<c:choose>
								            		<c:when test="${not empty room.memberProfileUrl }">
										                <img src="${room.memberProfileUrl}" 
										                alt="Profile Image" 
										                class="rounded-circle d-flex align-self-center me-3 shadow-1-strong"
										                width="60" height="60">
								            		</c:when>
								            		<c:otherwise>
								            			<i class="bi bi-person-circle fs-1 rounded-circle d-flex align-self-center me-3 shadow-1-strong"></i>
								            		</c:otherwise>
								            	</c:choose>
											<div class="pt-1">
												<p class="fw-bold mb-0"><c:out value="${room.chatRoomName}"/></p>
												<p class="d-inline-block text-truncate small text-muted" style="max-width: 150px;"><c:out value="${room.message}"/></p>
											</div>
										</div>
										<div class="pt-1">
											<p class="small text-muted mb-1">
											<c:out value="${room.regDateTime}"/></p>
											<span id="cntMessages" class="badge bg-danger float-end"><c:out value="${room.unReadCount}"/></span>
										</div>
								</a></li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div> 
				
				<!--메시지 보내고 보이는 공간  -->
                <div class="chat-placeholder" id="chatPlaceholder">
                    <h4>채팅방을 선택해주세요</h4>
                </div>
				<div class="col-md-8 chat-box w-100" id="chatBox">
				<div class="d-flex align-items-start">
				<div class="w-100 h-100 col-md-6 col-lg-7 col-xl-8 p-3 border --bs-light-border-subtle rounded-3">
					<!--메시지가 추가되는 공간  -->
					<ul class="list-unstyled" id="chat">
					</ul>
						<div id="sendDiv" class="active">
						<li class="list-unstyled bg-white mb-3">
							<div data-mdb-input-init class="form-outline">
								<textarea class="form-control bg-body-tertiary mb-4"
									id="messageInput" rows="4"></textarea>
								<label class="form-label" for="messageInput">메시지</label>
							</div>
						</li>
						<button type="button" data-mdb-button-init data-mdb-ripple-init
							class="btn btn-info btn-rounded float-end" id="sendButton">보내기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- 푸터 연결 -->
	<%@ include file="../../common/footer.jsp"%>
	
	
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.umd.min.js"
></script>	
<script>

//모달과 버튼을 변수에 저장합니다.
var chatModal = document.getElementById("chatModal");
var btn = document.getElementById("openModalBtn");
var span = document.getElementsByClassName("close")[0];

//버튼을 클릭하면 모달을 열어줍니다.
btn.onclick = function() {
	chatModal.style.display = "block";
}

//<span> (닫기 버튼)을 클릭하면 모달을 닫아줍니다.
span.onclick = function() {
	chatModal.style.display = "none";
}

//모달 밖을 클릭하면 모달을 닫아줍니다.
window.onclick = function(event) {
    if (event.target === profileModal) {
    	profileModal.style.display = 'none';
    }
    
    if (event.target == chatModal) {
   	 chatModal.style.display = "none";
    }
};

document.addEventListener('DOMContentLoaded', function() {
    // 모든 tr 요소를 선택합니다.
    var rows = document.querySelectorAll('tr');

    // 각 tr 요소를 순회합니다.
    rows.forEach(function(row) {
        // 현재 tr의 3번째 td 요소를 찾습니다.
        var thirdCell = row.querySelector('td:nth-child(3)');

        // 3번째 열에 라디오 버튼이 있는지 확인합니다.
        if (thirdCell && !thirdCell.querySelector('input[type="radio"]')) {
            // 라디오 버튼이 없다면 배경색을 옅은 회색으로 변경합니다.
            row.style.backgroundColor = '#f0f0f0'; // 옅은 회색
        }
    });
    
    var result = '${result}';
    if (result === '0') {			//이미 채팅방이 존재함
        alert("이미 채팅방이 존재합니다.");
    } else if (result === '1') {	// 잘 만들어짐
        alert("채팅방이 생성되었습니다.");
    }
    
    /* 온 채팅의 개수가 0이면 숫자 span이 보이지 않게 하기  */
    const cntMessagesElements = document.querySelectorAll('#cntMessages');
    
    cntMessagesElements.forEach(function(spanElement) {
        if (spanElement.innerText === "0") {
            // 값이 0이면 요소를 숨깁니다.
            spanElement.style.display = 'none';
        }
    });

});

function setChatRoomName() {
    var form = document.getElementById('createRoomForm');
    var selectedRadio = form.querySelector('input[name="adminNo"]:checked');
    if (selectedRadio) {
/*         var adminName = selectedRadio.getAttribute('data-admin-name');
        var chatRoomNameInput = form.querySelector('input[name="chatRoomName"]');
        chatRoomNameInput.value = adminName; */
    } else {
        alert('담당자를 선택해 주세요.');
        return false; // 폼 제출을 방지
    }
    return true; // 폼을 정상적으로 제출
}



</script>

<script>
<!--처음 채팅방에 들어왔을 때 메시지 전송하는 컨테이너 보이지 않게 하기  -->
document.addEventListener('DOMContentLoaded', function () {
	var chatBox = document.getElementById("chatBox");
	chatBox.style.visibility = "hidden";
});
</script>


<!--채팅방을 누르면 해당 채팅방에서 나눈 메시지 보이게 하는 함수  -->
<script type="text/javascript">
// 로그인한 사용자 정보 (서버에서 JSP에 전달된 경우)
const loginMemberNo = "${loginMember.memberNo}";
const loginMemberName = "${loginMember.memberName}";
const loginMemberProfileUrl = "${loginMember.memberProfileUrl}"
	
let currentChatRoomNo = null; // 현재 선택된 채팅방의 chatRoomNo
let currentReceiverNo = null;
let currentmemberProfileUrl = null;
//채팅방 클릭 시 호출되는 함수
function selectChatRoom(chatRoomNo,receiverNo,liElement,memberProfileUrl) {
	/* 채팅방을 누르면 숫자span이 사라지게 하기 */
    const cntMessagesElement = liElement.querySelector('#cntMessages');
    cntMessagesElement.style.display = 'none';
    currentmemberProfileUrl = memberProfileUrl;
    console.log('상대방의 프로필:' + currentmemberProfileUrl);
    
    currentChatRoomNo = chatRoomNo;
    currentReceiverNo = receiverNo;
    console.log('Selected Chat Room No:', currentChatRoomNo);
    console.log('상대방의 No:' + receiverNo);
    
    $.ajax({
        url: '/member/chatroom/chats/' + currentChatRoomNo,
        method: 'GET',
        dataType: 'json',
        success: function(data) {
        	displayMessages(data);
        },
        error: function(error) {
            console.error('AJAX 오류:', error);
        }
    });
    
 // JSON 데이터를 HTML로 변환하여 표시하는 함수
    function displayMessages(messages) {
        var chatContainer = $('#chat');
        chatContainer.empty(); // 기존 내용을 제거
        
        console.log(messages);
        console.log("로그인한 사람의 NO : "+loginMemberNo);
        
        var chatBox = document.getElementById("chatBox");
        chatBox.style.visibility = "visible";
        var chatPlaceholder = document.getElementById("chatPlaceholder");
        chatPlaceholder.style.display = "none";
        
        
        $.each(messages, function(index, message) {
        	
        	if(message.memberNo === Number(loginMemberNo)){//나-오른쪽에 와야 햐는 사람

        		var messageItem = $('<li>', { class: 'd-flex justify-content-end mb-6'})
        	    .append($('<div>', { class: 'card w-100' })
        	        .append($('<div>', { class: 'card-header d-flex justify-content-between p-3' })
        	            .append($('<p>', { class: 'fw-bold mb-0' }).text(message.memberName)) // 송신자 이름
        	            .append($('<p>', { class: 'text-muted small mb-0' })
        	                .append($('<i>', { class: 'far fa-clock' }).text(message.regDateTime)) // 타임스탬프
        	            )
        	        )
        	        .append($('<div>', { class: 'card-body' })
        	            .append($('<p>', { class: 'mb-0' }).text(message.message)) // 메시지 내용
        	        )
        	    );
        	    if (loginMemberProfileUrl) { // URL이 유효한 경우
        	        messageItem.append($('<img>', {
        	            src: loginMemberProfileUrl, // 다른 사람 이미지 URL
        	            alt: 'Profile Image',
        	            class: 'rounded-circle d-flex align-self-start ms-3 shadow-1-strong', // 왼쪽 여백
        	            width: '60',
        	            height: '60'
        	        }));
        	    } else { // URL이 null이거나 빈 값인 경우
        	        messageItem.append($('<i>', {
        	            class: 'bi bi-person-circle fs-1 rounded-circle d-flex align-self-center me-3 shadow-1-strong'
        	        }));
        	    }
        		
        	}else {/* 남-왼쪽에 와야 하는 사람  */
        		// li 요소 생성
        		var messageItem = $('<li>', { class: 'd-flex justify-content-start mb-6' });

        		// 프로필 이미지 또는 아이콘 추가
        		if (currentmemberProfileUrl) { // URL이 유효한 경우
        		    messageItem.append($('<img>', {
        		        src: currentmemberProfileUrl, // 다른 사람 이미지 URL
        		        alt: 'avatar',
        		        class: 'rounded-circle d-flex align-self-start me-3 shadow-1-strong', // 왼쪽 여백
        		        width: '60',
        		        height: '60'
        		    }));
        		} else { // URL이 null이거나 빈 값인 경우
        		    messageItem.append($('<i>', {
        		        class: 'bi bi-person-circle fs-1 rounded-circle d-flex align-self-center me-3 shadow-1-strong'
        		    }));
        		}

        		
        		messageItem.append($('<div>', { class: 'card w-100'})
        	        .append($('<div>', { class: 'card-header d-flex justify-content-between p-3' })
        	            .append($('<p>', { class: 'fw-bold mb-0' }).text(message.memberName)) // 송신자 이름
        	            .append($('<p>', { class: 'text-muted small mb-0' })
        	                .append($('<i>', { class: 'far fa-clock' }).text(message.regDateTime)) // 타임스탬프
        	            )
        	        )
        	        .append($('<div>', { class: 'card-body' })
        	            .append($('<p>', { class: 'mb-0' }).text(message.message)) // 메시지 내용
        	        )
        	    );
        	
/*         		var messageItem = $('<li>', { class: 'd-flex justify-content-start mb-6'})
        	    .append($('<img>', {
        	        src: 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp', // 다른 사람 이미지 URL
        	        alt: 'avatar',
        	        class: 'rounded-circle d-flex align-self-start me-3 shadow-1-strong', // 왼쪽 여백
        	        width: '60'
        	    }))
        	    .append($('<div>', { class: 'card w-100'})
        	        .append($('<div>', { class: 'card-header d-flex justify-content-between p-3' })
        	            .append($('<p>', { class: 'fw-bold mb-0' }).text(message.memberName)) // 송신자 이름
        	            .append($('<p>', { class: 'text-muted small mb-0' })
        	                .append($('<i>', { class: 'far fa-clock' }).text(message.regDateTime)) // 타임스탬프
        	            )
        	        )
        	        .append($('<div>', { class: 'card-body' })
        	            .append($('<p>', { class: 'mb-0' }).text(message.message)) // 메시지 내용
        	        )
        	    );
 */

        	}
        	
        	// 메시지 아이템을 채팅 공간에 추가
            chatContainer.append(messageItem);
        });
    }
}


</script>
<script>




const chat = document.getElementById('chat');
const messageInput = document.getElementById('messageInput');
const sendButton = document.getElementById('sendButton');

// WebSocket 연결 설정
const ws = new WebSocket('ws://localhost:8080/ws');

ws.onopen = () => {
    console.log('서버에 연결되었습니다.');
};

ws.onmessage = (event) => {
    // 서버로부터 받은 메시지를 화면에 표시
    // 상대방이 나한테 보낸 메시지(서버에서 나와 상대방 세션을 모두 가지고 있어서 내가 보낸 메시지도 여기로 옴)
    const messageData = JSON.parse(event.data);

    console.log(messageData);
   	console.log("메시지 보낸 사람의 NO:" + messageData.memberNo);
   	console.log(typeof messageData.memberNo); // 자료형 확인-int
   	console.log("로그인한 사람의 NO : " + loginMemberNo);
   	console.log(typeof loginMemberNo); // 자료형 확인-String
    console.log("두 사람의 No가 같은지 확인 " + (messageData.memberNo === Number(loginMemberNo)));
   	
    
    
   	if(messageData.memberNo === Number(loginMemberNo)){//나-오른쪽에 와야 햐는 사람
    	console.log("오른쪽에 오는 사람");
		const message = document.createElement('li');
	    message.classList.add('d-flex', 'justify-content-end', 'mb-6');

	    
	    const messageCard = document.createElement('div');
	    messageCard.classList.add('card', 'w-100');

	    const cardHeader = document.createElement('div');
	    cardHeader.classList.add('card-header', 'd-flex', 'justify-content-between', 'p-3');

	    const senderName = document.createElement('p');
	    senderName.classList.add('fw-bold', 'mb-0');
	    senderName.textContent = messageData.memberName;

	    const timestamp = document.createElement('p');
	    timestamp.classList.add('text-muted', 'small', 'mb-0');
	    timestamp.innerHTML = `<i class="far fa-clock"></i>`;
	    timestamp.textContent = messageData.regDateTime;
	    
	    let profile;

	    if (loginMemberProfileUrl) {
	        // URL이 null이 아닌 경우 <img> 요소를 생성
	        profile = document.createElement('img');
	        profile.src = loginMemberProfileUrl;
	        profile.alt = "avatar";
	        profile.classList.add('rounded-circle', 'd-flex', 'align-self-start', 'me-3', 'shadow-1-strong');
	        profile.width = 60;
	        profile.height = 60;
	    } else {
	        // URL이 null인 경우 <i> 요소를 생성
	        profile = document.createElement('i');
	        profile.classList.add('bi', 'bi-person-circle', 'fs-1', 'rounded-circle', 'd-flex', 'align-self-center', 'me-3', 'shadow-1-strong');
	    }

	    cardHeader.appendChild(senderName);
	    cardHeader.appendChild(timestamp);

	    const cardBody = document.createElement('div');
	    cardBody.classList.add('card-body');

	    const messageText = document.createElement('p');
	    messageText.classList.add('mb-0');
	    messageText.textContent = messageData.message;

	    cardBody.appendChild(messageText);
	    messageCard.appendChild(cardHeader);
	    messageCard.appendChild(cardBody);

	    message.appendChild(messageCard);
	    message.appendChild(profile);
	    chat.appendChild(message);

		
	}else {/* 남-왼쪽에 와야 하는 사람  */
		console.log("왼쪽에 오는 사람");
		const message = document.createElement('li');
	    message.classList.add('d-flex', 'justify-content-start', 'mb-6');

	    let profile;

	    if (messageData.memberProfileUrl) {
	        // URL이 null이 아닌 경우 <img> 요소를 생성
	        profile = document.createElement('img');
	        profile.src = messageData.memberProfileUrl;
	        profile.alt = "avatar";
	        profile.classList.add('rounded-circle', 'd-flex', 'align-self-start', 'me-3', 'shadow-1-strong');
	        profile.width = 60;
	        profile.height = 60;
	    } else {
	        // URL이 null인 경우 <i> 요소를 생성
	        profile = document.createElement('i');
	        profile.classList.add('bi', 'bi-person-circle', 'fs-1', 'rounded-circle', 'd-flex', 'align-self-center', 'me-3', 'shadow-1-strong');
	    }

	    const messageCard = document.createElement('div');
	    messageCard.classList.add('card', 'w-100');

	    const cardHeader = document.createElement('div');
	    cardHeader.classList.add('card-header', 'd-flex', 'justify-content-between', 'p-3');

	    const senderName = document.createElement('p');
	    senderName.classList.add('fw-bold', 'mb-0');
	    senderName.textContent = messageData.memberName;

	    const timestamp = document.createElement('p');
	    timestamp.classList.add('text-muted', 'small', 'mb-0');
	    timestamp.innerHTML = `<i class="far fa-clock"></i>`;
	    timestamp.textContent = messageData.regDateTime;
	    
	    cardHeader.appendChild(senderName);
	    cardHeader.appendChild(timestamp);

	    const cardBody = document.createElement('div');
	    cardBody.classList.add('card-body');

	    const messageText = document.createElement('p');
	    messageText.classList.add('mb-0');
	    messageText.textContent = messageData.message;

	    cardBody.appendChild(messageText);
	    messageCard.appendChild(cardHeader);
	    messageCard.appendChild(cardBody);

	    message.appendChild(profile);
	    message.appendChild(messageCard);
	    chat.appendChild(message);



	}
	
    chat.scrollTop = chat.scrollHeight;
};



sendButton.addEventListener('click', () => {
    const messageContent = messageInput.value;
    if (messageContent) {
        
		const messageData = {
            chatRoomNo: currentChatRoomNo,  
            memberNo:  loginMemberNo,  
            memberName: loginMemberName,  
            message: messageContent,
            receiverNo: currentReceiverNo,
            memberProfileUrl: loginMemberProfileUrl
        };

        // JSON 형식으로 메시지 데이터를 문자열로 변환하여 서버로 전송
        ws.send(JSON.stringify(messageData));
        
        chat.scrollTop = chat.scrollHeight;
        document.getElementById('messageInput').value = '';
    }
});

messageInput.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') {
    	e.preventDefault();
        sendButton.click();
    }
});

ws.onclose = () => {
    console.log('서버 연결이 끊어졌습니다.');
};

ws.onerror = (error) => {
    console.error('WebSocket error:', error);
};
</script>



</body>
</html>