<div align="center">
<h2> 🏫 송여인(SongYeoIn) 🏫</h2>
v1. Local에서 실행되는 **Oracle**
<br>
v2. docker로 사용하는 **MySQL, AWS** 배포 진행<br>
v3. **Spring Boot, React** 변경 후 배포
</div>

<br/>
<br/>

# 1. Project Overview (프로젝트 개요)
- JAVA&Spring 백엔드 개발자 교육과정 수강 중 센터의 담당 직원과 수강생 간의   <span style="background-color:#fff5b1"> **분화된 소통 방식 및 수기 작성 방식을 보완**</span> 하고자 ‘SongYeoIn’ 웹서비스를 기획 및 개발하게 되었습니다.


<br/>
<br/>

# 2. Team Members (팀원 및 팀 소개)
| 👑김예인👑 | 😎김도연😎 | 😁김예린😁 | 🤗이유진🤗 | 😉최소연😉 |
|:------:|:------:|:------:|:------:|:------:|
| <img src="https://github.com/user-attachments/assets/3cfbff01-af9f-428a-8b3d-91d344becdfc" alt="김예인" width="150"> | <img src="https://github.com/user-attachments/assets/2f1437f6-77f3-4d1b-aa35-d961f9bcdea4" alt="김도연" width="150"> | <img src="https://github.com/user-attachments/assets/f55acd8f-d65c-41b0-9342-60d73d56c3b7" alt="김예린" width="150"> | <img src="https://github.com/user-attachments/assets/d474b1fb-cf8c-4f45-882b-6ff1a606de1b" alt="이유진" width="150"> |<img src="https://github.com/user-attachments/assets/fef85c46-3d02-4064-a62a-293046b7f9f7" alt="최소연" width="150">
| FE, BE | FE, BE | FE, BE | FE, BE | FE, BE
| [GitHub](https://github.com/brightyein) | [GitHub](https://github.com/kimdoyeon304) | [GitHub](https://github.com/yeeeeeeer) | [GitHub](https://github.com/YJ-2) | [GitHub](https://github.com/RACHEL-2929)

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

# 4. Tasks & Responsibilities (작업 및 역할 분담)
|  |  |  |
|-----------------|-----------------|-----------------|
| 김예인    |  <img src="https://github.com/user-attachments/assets/3cfbff01-af9f-428a-8b3d-91d344becdfc" alt="김예인" width="100"> | <ul><li>반관리</li><li>시간표</li><li>출석</li></ul>     |
| 김도연   |  <img src="https://github.com/user-attachments/assets/2f1437f6-77f3-4d1b-aa35-d961f9bcdea4" alt="김도연" width="100">| <ul><li>프론트</li><li>동아리</li></ul> |
| 김예린   |  <img src="https://github.com/user-attachments/assets/f55acd8f-d65c-41b0-9342-60d73d56c3b7" alt="김예린" width="100">    |<ul><li>교육일지</li><li>교육일정</li></ul>  |
| 이유진    |  <img src="https://github.com/user-attachments/assets/d474b1fb-cf8c-4f45-882b-6ff1a606de1b" alt="이유진" width="100">    | <ul><li>회원</li><li>공지사항</li><li>익명게시판</li></ul>    |
| 최소연    |  <img src="https://github.com/user-attachments/assets/fef85c46-3d02-4064-a62a-293046b7f9f7" alt="최소연" width="100">    | <ul><li>채팅</li><li>프로필 등록</li></ul>    

<br/>
<br/>

# 5. Technology Stack (기술 스택)
## 5.1 Frontend
<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white">
<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/Javascript-F7DF1E?style=for-the-badge&logo=Javascript&logoColor=white">

<br/>

## 5.2 Backend--버전?
<img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=Java&logoColor=white">
<img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
<img src="https://img.shields.io/badge/mongoDB-47A248?style=for-the-badge&logo=MongoDB&logoColor=white">
<img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white">
<img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">


<br/>

## 5.3 Cooperation
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white">
<img src="https://img.shields.io/badge/Github-181717?style=for-the-badge&logo=Github&logoColor=white">



<br/>

# 6. Project Structure (프로젝트 구조)
```plaintext
src/
├── main/
│    ├── java/          # 재사용 가능한 UI 컴포넌트
│    ├── resources/               # 커스텀 훅 모음
│    ├── webapp/               # 각 페이지별 컴포넌트
│    ├── App.js               # 메인 애플리케이션 컴포넌트
│    ├── index.js             # 엔트리 포인트 파일
│   ├── index.css            # 전역 css 파일
│   ├── firebaseConfig.js    # firebase 인스턴스 초기화 파일
│   package-lock.json    # 정확한 종속성 버전이 기록된 파일로, 일관된 빌드를 보장
│   package.json         # 프로젝트 종속성 및 스크립트 정의
├── .gitignore               # Git 무시 파일 목록
└── pom.xml                # Maven 프로젝트의 빌드 설정 및 의존성 관리 파일
└── README.md                # 프로젝트 개요 및 사용법
```

<br/>
<br/>

# 7. Development Workflow (개발 워크플로우)
## 브랜치 전략 (Branch Strategy)
우리의 브랜치 전략은 Git Flow를 기반으로 하며, 다음과 같은 브랜치를 사용합니다.

- Main Branch
  - 배포 가능한 상태의 코드를 유지합니다.
  - 모든 배포는 이 브랜치에서 이루어집니다.
  
- feat/{name} Branch
  - 팀원 각자의 개발 브랜치입니다.
  - 모든 기능 개발은 이 브랜치에서 이루어집니다.

<br/>
<br/>

# 8. Coding Convention
## 문장 종료
```
// 세미콜론(;)
console.log("Hello World!");
```

<br/>


## 명명 규칙
* 상수 : 영문 대문자 + 스네이크 케이스
```
const NAME_ROLE;
```
* 변수 & 함수 : 카멜케이스
```
// state
const [isLoading, setIsLoading] = useState(false);
const [isLoggedIn, setIsLoggedIn] = useState(false);
const [errorMessage, setErrorMessage] = useState('');
const [currentUser, setCurrentUser] = useState(null);

// 배열 - 복수형 이름 사용
const datas = [];

// 정규표현식: 'r'로 시작
const = rName = /.*/;

// 이벤트 핸들러: 'on'으로 시작
const onClick = () => {};
const onChange = () => {};

// 반환 값이 불린인 경우: 'is'로 시작
const isLoading = false;

// Fetch함수: method(get, post, put, del)로 시작
const getEnginList = () => {...}
```

<br/>

## 블록 구문
```
// 한 줄짜리 블록일 경우라도 {}를 생략하지 않고, 명확히 줄 바꿈 하여 사용한다
// good
if(true){
  return 'hello'
}

// bad
if(true) return 'hello'
```

<br/>

## 함수
```
함수는 함수 표현식을 사용하며, 화살표 함수를 사용한다.
// Good
const fnName = () => {};

// Bad
function fnName() {};
```

<br/>

## 태그 네이밍
Styled-component태그 생성 시 아래 네이밍 규칙을 준수하여 의미 전달을 명확하게 한다.<br/>
태그명이 길어지더라도 의미 전달의 명확성에 목적을 두어 작성한다.<br/>
전체 영역: Container<br/>
영역의 묶음: {Name}Area<br/>
의미없는 태그: <><br/>
```
<Container>
  <ContentsArea>
    <Contents>...</Contents>
    <Contents>...</Contents>
  </ContentsArea>
</Container>
```

<br/>

## 폴더 네이밍
카멜 케이스를 기본으로 하며, 컴포넌트 폴더일 경우에만 파스칼 케이스로 사용한다.
```
// 카멜 케이스
camelCase
// 파스칼 케이스
PascalCase
```

<br/>

## 파일 네이밍
```
컴포넌트일 경우만 .jsx 확장자를 사용한다. (그 외에는 .js)
customHook을 사용하는 경우 : use + 함수명
```

<br/>
<br/>

# 9. 커밋 컨벤션
## 기본 구조
```
type : subject

body 
```

<br/>

## type 종류
```
feat : 새로운 기능 추가
fix : 버그 수정
docs : 문서 수정
style : 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
refactor : 코드 리펙토링
test : 테스트 코드, 리펙토링 테스트 코드 추가
chore : 빌드 업무 수정, 패키지 매니저 수정
```

<br/>

## 커밋 이모지
```
== 코드 관련
📝	코드 작성
🔥	코드 제거
🔨	코드 리팩토링
💄	UI / style 변경

== 문서&파일
📰	새 파일 생성
🔥	파일 제거
📚	문서 작성

== 버그
🐛	버그 리포트
🚑	버그를 고칠 때

== 기타
🐎	성능 향상
✨	새로운 기능 구현
💡	새로운 아이디어
🚀	배포
```

<br/>

## 커밋 예시
```
== ex1
✨Feat: "회원 가입 기능 구현"

SMS, 이메일 중복확인 API 개발

== ex2
📚chore: styled-components 라이브러리 설치

UI개발을 위한 라이브러리 styled-components 설치
```

<br/>
<br/>

# 10. 컨벤션 수행 결과
<img width="100%" alt="코드 컨벤션" src="https://github.com/user-attachments/assets/0dc218c0-369f-45d2-8c6d-cdedc81169b4">
<img width="100%" alt="깃플로우" src="https://github.com/user-attachments/assets/2a4d1332-acc2-4292-9815-d122f5aea77c">
