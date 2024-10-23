<div align="center">
<h2> 🏫 송여인(SongYeoIn) 🏫</h2>
v1. Local에서 실행되는 <b>Oracle</b><br/>
v2. docker로 사용하는 <b>MySQL, AWS</b> 배포 진행<br>
v3. <b>Spring Boot, React</b> 변경 후 배포
</div>

<br/>
<br/>

# 1. Project Overview (프로젝트 개요)
- JAVA&Spring 백엔드 개발자 교육과정 수강 중 센터의 담당 직원과 수강생 간의   <span style="background-color:#fff5b1"> **분화된 소통 방식 및 수기 작성 방식을 보완**</span> 하고자 ‘SongYeoIn’ 웹서비스를 기획 및 개발하게 되었습니다.


<br/>
<br/>

# 2. Team Members (팀원 및 팀 소개)
| 👑김예인 | 😎김도연 | 😁김예린 | 🤗이유진 | 😉최소연 |
|:------:|:------:|:------:|:------:|:------:|
| <img src="https://github.com/user-attachments/assets/554ff8cb-8961-4692-9f89-1430b00eadd3" alt="김예인" height="170" width="170"> | <img src="https://github.com/user-attachments/assets/509ee1f7-b34b-4ce5-8a34-3c88eb17be25" alt="김도연" height="170"  width="170"> | <img src="https://github.com/user-attachments/assets/01710d80-3d29-4134-99cc-fb640817e664" alt="김예린" height="170"  width="170"> | <img src="https://github.com/user-attachments/assets/510cfbc3-cd21-4c95-a362-3003e1770467" alt="이유진" height="170"  width="170"> |<img src="https://github.com/user-attachments/assets/614f82c8-6f6e-47b3-b78f-ee3b6bea7d75" alt="최소연" height="170"  width="170">
|<ul align="left"><li>반관리</li><li>시간표</li><li>출석</li></ul>| <ul align="left"><li>프론트</li><li>동아리</li></ul> | <ul align="left"><li>교육일지</li><li>교육일정</li></ul> | <ul align="left"><li>회원</li><li>공지사항</li><li>익명게시판</li></ul> | <ul align="left"><li>채팅</li><li>프로필 등록</li></ul>
| [brightyein](https://github.com/brightyein) | [kimdoyeon304](https://github.com/kimdoyeon304) | [yeeeeeeer](https://github.com/yeeeeeeer) | [YJ-2](https://github.com/YJ-2) | [RACHEL-2929](https://github.com/RACHEL-2929)

<br/>
<br/>

# 3. Key Features (주요 기능)
- **회원가입 및 로그인**:
  - 회원가입 시 DB에 유저정보가 등록되며 승인된 회원만 로그인이 가능합니다.

- **담당 직원의 반, 수강생, 시간표, 출석 관리**:
  - 관리자가 반과 요일 별 시간표를 개설할 시 DB에 반 정보가 등록됩니다.
  - 시간표 데이터 기반으로 출석이 자동으로 오픈됩니다.
  - 매일 자정에 출석 데이터가 없는 출석에 대해 ‘결석' 처리가 됩니다.

- **교육일지 파일 업로드 및 다운로드**:
  - 교육일지 업로드 및 다운로드가 가능하며 캘린더를 통해 교육일정을 조회할 수 있습니다.

- **동아리실 신청 및 승인 처리**:
  - 수강생은 동아리 강의실을 신청할 수 있으며 관리자는 신청된 강의실을 승인 및 미승인 처리할 수 있습니다.

- **동아리 일지 파일 업로드 및 다운로드**:
  - 동아리 활동 일지를 제출할 수 있으며 제출된 동아리 활동 일지를 다운로드 받을 수 있습니다.

- **담당 직원과 수강생 간의 1:1 채팅 기능**:
  - 개설된 채팅방을 통해 웹소켓으로 실시간 채팅이 가능합니다.

- **공지 사항, 익명게시판 기능**:
  - 공지사항은 다중 파일 업로드가 가능합니다.
  - 익명게시판은 게시글에 좋아요, 대댓글 작성이 가능합니다.

<br/>
<br/>

# 4. Technology Stack (기술 스택)
## 4.1 Frontend
<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"><img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"><img src="https://img.shields.io/badge/Javascript-F7DF1E?style=for-the-badge&logo=Javascript&logoColor=white"><img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white"/>

<br/>

## 4.2 Backend
<img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=Java&logoColor=white"><img src="https://img.shields.io/badge/11-878787?style=for-the-badge">
<img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"><img src="https://img.shields.io/badge/5.3.9-878787?style=for-the-badge">
<img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"><img src="https://img.shields.io/badge/21.3.0-878787?style=for-the-badge">
<img src="https://img.shields.io/badge/mongoDB-47A248?style=for-the-badge&logo=MongoDB&logoColor=white"><img src="https://img.shields.io/badge/5.0.28-878787?style=for-the-badge">
<img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"><img src="https://img.shields.io/badge/9.0-878787?style=for-the-badge">
<img src="https://img.shields.io/badge/Apache%20Maven-C71A36?style=for-the-badge&logo=Apache%20Maven&logoColor=white">

<br/>

## 4.3 Cooperation
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"><img src="https://img.shields.io/badge/Github-181717?style=for-the-badge&logo=Github&logoColor=white">



<br/>

# 5. Project Structure (프로젝트 구조)
```plaintext
📦SongYeoIn
 ┣ 📂src/main/java
 ┃ ┣ 📂com.syi.project.config
 ┃ ┣ 📂com.syi.project.controller
 ┃ ┣ 📂com.syi.project.mapper
 ┃ ┣ 📂com.syi.project.model
 ┃ ┗ 📂com.syi.project.service
 ┣ 📂src/main/resources
 ┃ ┣ 📂com.syi.project.mapper
 ┃ ┗ 📜log4j.xml
 ┃ ┗ 📜log4jdbc.log4j2.properties
 ┣ 📂src/test/java
 ┃ ┣ 📂mapper
 ┃ ┣ 📂persistence
 ┃ ┗ 📂service
 WEB
 ┣ 📂src/main/webapp
 ┃ ┣ 📂WEB-INF
 ┃ ┃ ┣ 📂spring
 ┃ ┃ ┃ ┣ 📂appServlet
 ┃ ┃ ┃ ┃ ┣ 📜security-context.xml
 ┃ ┃ ┃ ┃ ┣ 📜servlet-context.xml 
 ┃ ┃ ┃ ┗ 📜root-context.xml
 ┃ ┃ ┣ 📂views
 ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┣ 📂journal
 ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┣ 📂board
 ┃ ┃ ┃ ┃ ┣ 📂chatroom
 ┃ ┃ ┃ ┃ ┣ 📂member
 ┃ ┃ ┃ ┃ ┣ 📂notice
 ┃ ┃ ┃ ┃ ┣ 📂class
 ┃ ┃ ┃ ┃ ┃ ┣ 📂attendance
 ┃ ┃ ┃ ┃ ┃ ┣ 📂club
 ┃ ┃ ┃ ┣ 📂member
 ┃ ┃ ┃ ┃ ┣ 📂attendance
 ┃ ┃ ┃ ┃ ┣ 📂board
 ┃ ┃ ┃ ┃ ┣ 📂chatroom
 ┃ ┃ ┃ ┃ ┣ 📂club
 ┃ ┃ ┃ ┃ ┣ 📂notice
 ┃ ┃ ┃ ┗ 📜index.jsp
 ┃ ┃ ┗ 📜web.xml
 ┗ 📜pom.xml
```

<br/>
<br/>


# 6. Development Workflow (개발 워크플로우)
## 브랜치 전략 (Branch Strategy)
우리의 브랜치 전략은 Git Flow를 기반으로 하며, 다음과 같은 브랜치를 사용합니다.

- Main Branch
  - 배포 가능한 안정적인 브랜치로 직접적인 커밋은 없습니다.
  - 향후 릴리즈를 위한 준비 단계입니다.

- Develop Branch
  - 모든 기능 개발이 통합되고 테스트되는 브랜치입니다.
  - 충분히 안정적이면 Main 브랜치로 병합됩니다.
  
- feature/{function} Branch
  - 기능별 브랜치로 모든 기능 개발은 이 브랜치에서 이루어집니다.
  - 기능 개발이 완료되면 Develop 브랜치로 병합됩니다.


<br/>
<br/>


# 7. 커밋 컨벤션
## 기본 구조
```
feat : 새로운 기능 추가
fix : 버그 수정
docs : 문서 수정
style : 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
refactor : 코드 리펙토링
test : 테스트 코드, 리펙토링 테스트 코드 추가
```

<br/>
