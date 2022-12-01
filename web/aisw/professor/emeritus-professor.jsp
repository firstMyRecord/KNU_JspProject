<%@ page language='java' pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>명예교수 | Al소프트웨어학과</title>
	<%@include file="../../link.txt"%>
</head>
<body class=" aisw-site pc temp08">
	<%@include file="../../menu.jsp"%>



<div class="container">
	<p class="h2 font-weight-bold">명예교수</p>
	<br>

<nav class="navbar navbar-light bg-light">
<a class="navbar-brand"></a>
	<form class="form-inline" action="https://aisw.kangwon.ac.kr/aisw/professor/emeritus-professor.do?" method="get">
			<input type="hidden" name="mode" value="list">
			<input type="hidden" name="searchKey" id="search_key" value="name">
			<div class="form-group mr-sm-2">
      			<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        			<option selected>이름</option>
      			</select>
    		</div>
			<div class="form-group mr-sm-2">
				<input type="text" class="form-control" id="search_val" name="srSearchVal" value="" placeholder="검색어를 입력해 주세요">
  			</div>
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	</form>
</nav>


<div class="row">
	<div class="col-sm-6">
		<div class="text-center">					
			<div class="b-img-box">
				<img alt="정란" width="190" height="245" src="../../../../../aisw.kangwon.ac.kr/app/common/attach/image/thumb_%25EC%25A0%2595%25EB%259E%2580%25EA%25B5%2590%25EC%2588%2598%25EB%258B%2598.png"  onerror="this.src='../../_res/knu/_share/img/board/img-faculty-default.gif'" />
			</div>
			<div class="h5">
				<p>
					<a class="b-name" href="emeritus-professorb54eb54e.html?mode=view&amp;key=$cms$IwdgzGAMQ&amp;" title="자세히 보기">
						정란
					</a>
				</p>						
			</div>
		</div>
		<div class="text-left">
			<ul class="nav flex-column">							 
				<li class="nav-item">
					<span>연구분야 : </span><span>소프트웨어공학/데이터베이스/알고리즘</span>
				</li>
				<li class="nav-item">
				    <span>이메일 : </span>
				    <a href="mailto:jungran@kangwon.ac.kr" title="메일보내기">jungran@kangwon.ac.kr</a>
			    </li>
			    <br>
			    <li class="nav-item">
					<a class="alert alert-info" href="emeritus-professorb54eb54e.html?mode=view&amp;key=$cms$IwdgzGAMQ&amp;" title="더보기">더보기</a>
				</li>
			</ul>			
		</div>						
	</div>
			
		
	<div class="col-sm-6">
		<div class="text-center">
			<div class="b-img-box">
				<img alt="진광윤" width="190" height="245" src="../../../../../aisw.kangwon.ac.kr/app/common/attach/image/thumb_%25EC%25A7%2584%25EA%25B4%2591%25EC%259C%25A4%25EA%25B5%2590%25EC%2588%2598%25EB%258B%2598.png"  onerror="this.src='../../_res/knu/_share/img/board/img-faculty-default.gif'" />
			</div>
			<div class="h5">
				<p>	
					<a class="b-name" href="emeritus-professorad9fad9f.html?mode=view&amp;key=$cms$IwdgzGxA&amp;" title="자세히 보기">
						진광윤
					</a>	
				</p>		
			</div>
			<div class="text-left">
				<ul class="nav flex-column">
					<li class="nav-item">
						<span>연구분야 : </span><span>운영체제/소프트웨어공학/시스템소프트웨어/데이터통신</span>
					</li>
				    <li class="nav-item">
				        <span>이메일 : </span>
				        <a href="mailto:kyjin@kangwon.ac.kr" title="메일보내기">kyjin@kangwon.ac.kr</a>
			        </li>
			        <br>
			        <li class="nav-item">
						<a class="alert alert-info" href="emeritus-professorad9fad9f.html?mode=view&amp;key=$cms$IwdgzGxA&amp;" title="더보기">더보기</a>
					</li>
				</ul>						
			</div>						
		</div>
	</div>
</div>
			
</div>



    
<br>
	<%@ include file="../../footer.jsp" %>
</body>
</html>

			