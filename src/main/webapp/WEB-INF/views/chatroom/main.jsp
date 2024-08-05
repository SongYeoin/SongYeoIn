<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<!-- MDB -->

<style>
/*전체 크기 늘리기  */
.content{
	padding:100px;

    position: relative; /* 자식 div의 절대 위치 기준을 설정 */
}

.total-content{
	width: 100%;  /* section의 전체 너비 */
    height: 100%; /* section의 전체 높이 */
    box-sizing: border-box; /* 패딩과 테두리의 크기를 포함하여 총 크기를 계산 */
}



/*card-body div 태그 밑으로 내리기  */
.down-card{
	

}


a.custom{
	 text-decoration: none !important;
}
</style>
</head>
<body>
	<!-- 메뉴바 연결 -->
	<%@ include file="../common/header.jsp"%>	s
	<section class="content">
		<div class="total-content container py-5">

			<div class="row">

				<div class=" col-md-6 col-lg-5 col-xl-4 mb-4 mb-md-0">

					<h5 class="font-weight-bold mb-3 text-center text-lg-start">Member</h5>

					<div class="card">
						<div class="down-card card-body">

							<ul class="list-unstyled mb-0">
								<li class="p-2 border-bottom bg-body-tertiary"><a href="#!"
									class="custom d-flex justify-content-between">
										<div class="d-flex flex-row">
											<img
												src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-8.webp"
												alt="avatar"
												class="rounded-circle d-flex align-self-center me-3 shadow-1-strong"
												width="60">
											<div class="pt-1">
												<p class="fw-bold mb-0">John Doe</p>
												<p class="small text-muted">Hello, Are you there?</p>
											</div>
										</div>
										<div class="pt-1">
											<p class="small text-muted mb-1">Just now</p>
											<span class="badge bg-danger float-end">1</span>
										</div>
								</a></li>
								<li class="p-2 border-bottom"><a href="#!"
									class="custom d-flex justify-content-between">
										<div class="d-flex flex-row">
											<img
												src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-1.webp"
												alt="avatar"
												class="rounded-circle d-flex align-self-center me-3 shadow-1-strong"
												width="60">
											<div class="pt-1">
												<p class="fw-bold mb-0">Danny Smith</p>
												<p class="small text-muted">Lorem ipsum dolor sit.</p>
											</div>
										</div>
										<div class="pt-1">
											<p class="small text-muted mb-1">5 mins ago</p>
										</div>
								</a></li>
								<li class="p-2 border-bottom"><a href="#!"
									class="custom d-flex justify-content-between">
										<div class="d-flex flex-row">
											<img
												src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-2.webp"
												alt="avatar"
												class="rounded-circle d-flex align-self-center me-3 shadow-1-strong"
												width="60">
											<div class="pt-1">
												<p class="fw-bold mb-0">Alex Steward</p>
												<p class="small text-muted">Lorem ipsum dolor sit.</p>
											</div>
										</div>
										<div class="pt-1">
											<p class="small text-muted mb-1">Yesterday</p>
										</div>
								</a></li>
								<li class="p-2 border-bottom"><a href="#!"
									class="custom d-flex justify-content-between">
										<div class="d-flex flex-row">
											<img
												src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-3.webp"
												alt="avatar"
												class="rounded-circle d-flex align-self-center me-3 shadow-1-strong"
												width="60">
											<div class="pt-1">
												<p class="fw-bold mb-0">Ashley Olsen</p>
												<p class="small text-muted">Lorem ipsum dolor sit.</p>
											</div>
										</div>
										<div class="pt-1">
											<p class="small text-muted mb-1">Yesterday</p>
										</div>
								</a></li>
								<li class="p-2 border-bottom"><a href="#!"
									class="custom d-flex justify-content-between">
										<div class="d-flex flex-row">
											<img
												src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-4.webp"
												alt="avatar"
												class="rounded-circle d-flex align-self-center me-3 shadow-1-strong"
												width="60">
											<div class="pt-1">
												<p class="fw-bold mb-0">Kate Moss</p>
												<p class="small text-muted">Lorem ipsum dolor sit.</p>
											</div>
										</div>
										<div class="pt-1">
											<p class="small text-muted mb-1">Yesterday</p>
										</div>
								</a></li>
								<li class="p-2 border-bottom"><a href="#!"
									class="custom d-flex justify-content-between">
										<div class="d-flex flex-row">
											<img
												src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-5.webp"
												alt="avatar"
												class="rounded-circle d-flex align-self-center me-3 shadow-1-strong"
												width="60">
											<div class="pt-1">
												<p class="fw-bold mb-0">Lara Croft</p>
												<p class="small text-muted">Lorem ipsum dolor sit.</p>
											</div>
										</div>
										<div class="pt-1">
											<p class="small text-muted mb-1">Yesterday</p>
										</div>
								</a></li>
								<li class="p-2"><a href="#!"
									class="custom d-flex justify-content-between">
										<div class="d-flex flex-row">
											<img
												src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
												alt="avatar"
												class="rounded-circle d-flex align-self-center me-3 shadow-1-strong"
												width="60">
											<div class="pt-1">
												<p class="fw-bold mb-0">Brad Pitt</p>
												<p class="small text-muted">Lorem ipsum dolor sit.</p>
											</div>
										</div>
										<div class="pt-1">
											<p class="small text-muted mb-1">5 mins ago</p>
											<span class="text-muted float-end"><i
												class="fas fa-check" aria-hidden="true"></i></span>
										</div>
								</a></li>
							</ul>

						</div>
					</div>

				</div>

				<div class="col-md-6 col-lg-7 col-xl-8">

					<ul class="list-unstyled">
						<li class="d-flex justify-content-between mb-4"><img
							src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
							alt="avatar"
							class="rounded-circle d-flex align-self-start me-3 shadow-1-strong"
							width="60">
							<div class="card">
								<div class="card-header d-flex justify-content-between p-3">
									<p class="fw-bold mb-0">Brad Pitt</p>
									<p class="text-muted small mb-0">
										<i class="far fa-clock"></i> 12 mins ago
									</p>
								</div>
								<div class="card-body">
									<p class="mb-0">Lorem ipsum dolor sit amet, consectetur
										adipiscing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua.</p>
								</div>
							</div></li>
						<li class="d-flex justify-content-between mb-4">
							<div class="card w-100">
								<div class="card-header d-flex justify-content-between p-3">
									<p class="fw-bold mb-0">Lara Croft</p>
									<p class="text-muted small mb-0">
										<i class="far fa-clock"></i> 13 mins ago
									</p>
								</div>
								<div class="card-body">
									<p class="mb-0">Sed ut perspiciatis unde omnis iste natus
										error sit voluptatem accusantium doloremque laudantium.</p>
								</div>
							</div> <img
							src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-5.webp"
							alt="avatar"
							class="rounded-circle d-flex align-self-start ms-3 shadow-1-strong"
							width="60">
						</li>
						<li class="d-flex justify-content-between mb-4"><img
							src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
							alt="avatar"
							class="rounded-circle d-flex align-self-start me-3 shadow-1-strong"
							width="60">
							<div class="card">
								<div class="card-header d-flex justify-content-between p-3">
									<p class="fw-bold mb-0">Brad Pitt</p>
									<p class="text-muted small mb-0">
										<i class="far fa-clock"></i> 10 mins ago
									</p>
								</div>
								<div class="card-body">
									<p class="mb-0">Lorem ipsum dolor sit amet, consectetur
										adipiscing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua.</p>
								</div>
							</div></li>
						<li class="bg-white mb-3">
							<div data-mdb-input-init class="form-outline">
								<textarea class="form-control bg-body-tertiary"
									id="textAreaExample2" rows="4"></textarea>
								<label class="form-label" for="textAreaExample2">Message</label>
							</div>
						</li>
						<button type="button" data-mdb-button-init data-mdb-ripple-init
							class="btn btn-info btn-rounded float-end">Send</button>
					</ul>

				</div>

			</div>

		</div>
	</section>
	<!-- 푸터 연결 -->
	<%@ include file="../common/footer.jsp"%>
	
	
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.umd.min.js"
></script>	

</body>
</html>