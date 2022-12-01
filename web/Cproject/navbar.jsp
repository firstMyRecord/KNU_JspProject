<%@ page contentType="text/html; charset=utf-8"%>
<style>
	.r-txt{text-align: right;}
</style>
<body class="pt-5"> <!--navbar를 fixedtop을 했을 때 다른 컨텐츠를 잡아 먹는 것을 방지 -->
<nav class="navbar navbar-dark bg-dark fixed-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="./index.jsp">
			<img src="./resources/images/logo.png" width="30" height="24" class="d-inline-block align-text-top ">  컴공친구
	    </a>
		<div class="d-md-block jsutify-content-end">
			<!--로그인 버튼 -->
			<a class="btn btn-outline-light" href="./loginmain.jsp" role="button">Sign in</a>
		  
		  	<!--로그인 상태의 이미지 드롭다운-->
	     	<!--<div class="dropdown">
		    <a href="#" class="d-flex align-items-center text-white text-decoration-none" id="login-dropdown" data-bs-toggle="dropdown" aria-expanded="false">
		    	<img src="./resources/images/person-circle.png" alt="" width="32" height="32" class="rounded-circle me-2">
		    </a>
		    <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="login-dropdown">
		    	<li><a class="dropdown-item" href="#">Profile</a></li>
		        <li><hr class="dropdown-divider"></li>
		        <li><a class="dropdown-item" href="#">Sign out</a></li>
		    </ul>
		  	</div>-->
	  
			<!-- collapse 아이콘 관련 -->  
	    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbars" aria-controls="navbars" aria-expanded="false" aria-label="Toggle navigation">
	        	<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navbars">
			<ul class="navbar-nav me-auto mb-2">
				<li class="nav-item">
					<a class="nav-link active r-txt" aria-current="page" href="./index.jsp">Home</a>
				</li>
				<li class="nav-item r-txt dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">프로그램 추천</a>
						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdown01">
							<li><a class="dropdown-item r-txt" href="recommend.jsp">전공 선택</a></li>
							<li><a class="dropdown-item r-txt" href="program_list.jsp">사용프로그램 선택</a></li>
						</ul>
				</li>
				<li class="nav-item r-txt dropdown">
					<a class="nav-link dropdown-toggle r-txt" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">사용 설명서</a>
						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdown01">
							<li><a class="dropdown-item r-txt" href="manual.jsp">페이지 설명 및 부품설명</a></li>
						</ul>
				</li>
				<li class="nav-item r-txt">
			    	<a class="nav-link" href="freeboard_list.jsp">커뮤니티 게시판</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
<p>
</body>