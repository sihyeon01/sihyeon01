<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.MemberBean" %>
<% 
	String id = null, grade=" ";
	if(session.getAttribute("id") != null) id = (String)session.getAttribute("id");
	if(session.getAttribute("grade") != null) id = (String)session.getAttribute("grade");   //보류
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SHINNA</title>
<link href = "images/logo1.png" rel = "icon" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/index.css" />
<style>
body{
	background-color:white;
}
#center{
	text-align:center;
	margin:0px auto;
}

.map {
	margin-top:150px;
}

</style>
</head>
<body oncontextmenu="return false" ondragstart="return false">
<!-- nav -->
	<div class="container pb-5 mb-5 clearfix">
		<nav class="navbar navbar-expand-sm navbar-light bg-white fixed-top">
			<a href="index.do"><img class="hei pl-4 ml-4" src="images/logo1.png" /></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse ani" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="menu"><a href="#">신나호텔</a>
						<ul class="sub">
							<li><a href="introduce.do">호텔소개</a></li>
							<li><a href="hotelmap.do">호텔안내</a></li>
						</ul>
					</li>
					<li class="menu"><a href="#">호텔객실</a>
						<ul class="sub pb-2">
							<li><a href="standard.do">스탠다드</a></li>
							<li><a href="suite.do">스위트</a></li>
							<li><a href="grand.do">그랜드</a></li>
							<li><a href="event.do">이벤트</a></li>
							<li><a href="promotion.do">프로모션</a></li>
						</ul>
					</li>
					<li class="menu"><a href="#">고객문의</a>
						<ul class="sub">
							<li><a href="reviewList.do">게시판</a></li>
						</ul>
					</li>
					<li class="menu"><a href="#">부대시설</a>
						<ul class="sub">
							<li><a href="fa_ca.do">카페</a></li>
							<li><a href="fa_lo.do">라운지</a></li>
							<li><a href="fa_re.do">레스토랑</a></li>
							<li><a href="fa_sa.do">샤워장</a></li>
							<li><a href="fa_sw.do">수영장</a></li>
							<li><a href="fa_fi.do">휘트니스</a></li>
						</ul>
					</li>
				</ul>
			</div>
				
			<div class="collapse navbar-collapse anis" id="navbarSupportedContent">
				<div class="navbar-nav drs">
					<div class="dropdown mb-4 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">신나호텔</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-3" href="introduce.do">호텔소개</a>
							<a class="dropdown-item pt-3 pb-2" href="hotelmap.do">호텔안내</a>
						</div>
					</div>
					<div class="dropdown mb-4 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">호텔객실</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-3" href="standard.do">스탠다드</a>
							<a class="dropdown-item pt-3 pb-3" href="suite.do">스위트</a>
							<a class="dropdown-item pt-3 pb-3" href="grand.do">그랜드</a>
							<a class="dropdown-item pt-3 pb-3" href="event.do">이벤트</a>
							<a class="dropdown-item pt-3 pb-2" href="promotion.do">프로모션</a>
						</div>
					</div>
					<div class="dropdown mb-4 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">고객문의</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-2" href="reviewList.do">게시판</a>
						</div>
					</div>
					<div class="dropdown mb-2 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown" 
							aria-haspopup="true" aria-expanded="false">부대시설</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-3" href="fa_ca.do">카페</a>
							<a class="dropdown-item pt-2 pb-3" href="fa_lo.do">라운지</a>
							<a class="dropdown-item pt-3 pb-3" href="fa_re.do">레스토랑</a>
							<a class="dropdown-item pt-3 pb-3" href="fa_sa.do">샤워장</a>
							<a class="dropdown-item pt-3 pb-2" href="fa_sw.do">수영장</a>
							<a class="dropdown-item pt-3 pb-3" href="fa_fi.do">휘트니스</a>
						</div>
					</div>
				</div>
			</div>
									<!-- 로그인 탭 -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto rig">
				<% 
					if(id == null ) {
				%>
					<li class="nav-item" style="width:100%;">
						<a href="Login.do" class="text-left" style="margin-left: 40px; margin-right: 5px; width:100%; min-width: 100%; margin-top: 13px;">로그인</a>
					</li>
					<li class="nav-item" style="width:100%;">
						<a href="Join.do" class="text-left" style="margin-left: 33px; margin-right: 25px; width:100%; min-width: 100%; margin-top: 13px;">회원가입</a>
					</li>
				<% 
					} else {
				%>
					<li class="nav-item " style="width:100%; ">
						<div class="dropdown lang">
	    					<button class="text-left btn btn-white dropdown-toggle" type="button"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false" style="width:100%; "><img src="images/dia.png" style="width:27px; height:27px;"><%= grade %> <%= id %>님 </button>
	    					<div class="dropdown-menu langs" aria-labelledby="dropdownMenuButton" style="width: 100%; min-width: 100%;">
	   	 						<a class="dropdown-item" href="Logout.do">로그아웃</a>
	   	 		<%
	   	 			if(session.getAttribute("id").toString().equals("shinna604")) {
	   	 				out.println("<a class='dropdown-item' href='checkMemberList.do'>예약관리</a>");
	   	 				out.println("<a class='dropdown-item' href='memberList.do'>회원관리</a>");
	   	 			} else {
	   	 				out.println("<a class='dropdown-item' href='check.do'>예약확인</a>");
	   	 				out.println("<a class='dropdown-item' href='JoinDelete.do'>회원탈퇴</a>");
	   	 			}
	   	 		%>
	    						
	    					</div>
		    			</div>
	    			</li>
		    	<% 
		    		}
				%>
					<li class="nav-item" style="width: 100%;">
						<div class="dropdown lang mt-2 ml-1">
							<button class="text-left btn btn-white dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false" style="width: 100%;"><img src="images/ji.png" class="mr-1" style="width:20px; height:20px;">&nbsp;한국어</button>
							<div class="dropdown-menu langs" aria-labelledby="dropdownMenuButton" style="width: 100%; min-width: 100%;">
								<a class="dropdown-item" href="#">English</a>
								<a class="dropdown-item" href="#">日本語</a> 
								<a class="dropdown-item" href="#">简体中文</a> 
							</div>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<br>
	
<!-- 소개 영역 -->
<section class="container map"> 
		<div class="text-center ">
			<h1 class="font-weight-bold h2">SHINNA 오시는 길</h1><br>
			<hr><br>
			<div class = "map__size-base">
				<img src="images/shinna.jpg" style="width:90%;">
			</div>
		</div>
		<ul>
			<li class="mt-5 mb-3 font-weight-bold" style="font-size:20px;">SHINNA HOTEL 주소</li>
			<li class="mb-3 ml-3">: 제주특별자치도 서귀포시 중문관광로 72번길 75 (우) 63535 </li>
			<li class="mb-5"></li>
			<li class="mb-3 font-weight-bold" style="font-size:20px;">SHINNA HOTEL 전화</li>
			<li class="mb-3 ml-3">: 대표전화  064-735-5114 </li>
			<li class="mb-5"></li>
		</ul>
		<ul class="d-flex">
			<li class="" style="width: 300px; min-width: 300px;">
				<nav class="navbar">
					<div class="navbar-nav">
						<div class="dropdown mb-4 lang">
							<button class="btn btn-white dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								style="width: 300px; min-width: 300px;" aria-haspopup="true"
								aria-expanded="false">제주공항 → 신나호텔</button>
							<div class="dropdown-menu langs"
								aria-labelledby="dropdownMenuButton"
								style="width: 100%; min-width: 100%;">
								<ul class="navbar-nav text-center">
									<li class="nav-item mb-2">운행시간 : 06:30 ~ 23:30</li>
									<li class="nav-item mb-2">운행간격 : 15분</li>
									<li class="nav-item mb-2">탑승장소 : 도착장 5번 Gate</li>
									<li class="nav-item mb-2">소요시간 : 약 50분</li>
								</ul>
							</div>
						</div>
					</div>
				</nav>
			</li>
			<li class="" style="width: 300px; min-width: 300px;">
				<nav class="navbar">
					<div class="navbar-nav">
						<div class="dropdown mb-4 lang">
							<button class="btn btn-white dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								style="width: 300px; min-width: 300px;" aria-haspopup="true"
								aria-expanded="false">신나호텔 → 제주공항</button>
							<div class="dropdown-menu langs"
								aria-labelledby="dropdownMenuButton"
								style="width: 100%; min-width: 100%;">
								<ul class="navbar-nav text-center">
									<li class="nav-item mb-2">운행시간 : 06:30 ~ 22:30</li>
									<li class="nav-item mb-2">운행간격 : 15분</li>
									<li class="nav-item mb-2">탑승장소 : 제주신나호텔 1층 정문 앞</li>
									<li class="nav-item mb-2">소요시간 : 약 50분</li>
								</ul>
							</div>
						</div>
					</div>
				</nav>
			</li>
		</ul>
</section>

<!-- footer -->
	<footer class="footer">
		<div class="footer-above" style="background: #F1E3C4;">
			<div class="container pt-4">
				<div class="row">
					<div class="col-4 mb-5 text-center">
						<h3 style="font-size: 1.5rem; color: #D45751;">SINNA</h3><br>
						<h6 style="font-size: 1rem; color: #BB5954;">HOTELS &amp; RESORTS</h6>
					</div>
					<div class="col-4 mb-5 text-left">
						<h5 style="color: #BB5954; font-size: 1rem;">
							<span style="color: #D45751; font-size: 1.1rem;">TEL.</span> 064-123-4567 
							<span style="color: #D45751; font-size: 1.1rem;">FAX.</span> 064-987-6543
						</h5><br>
						<h5 style="color: #BB5954; font-size: 1rem;">
							<span style="color: #D45751; font-size: 1.1rem;">주소.</span> 제주특별자치도 서귀포시 중문관광로 72번길 75 (우) 63535
						</h5><br>
						<h5 style="color: #BB5954; font-size: 1rem;">
							<span style="color: #D45751; font-size: 1.1rem;">사업자등록번호.</span> 203-81-43363
						</h5>
					</div>
					<div class="col-4 mb-5 text-center">
						<h3 style="color:#BB5954; font-size: 1rem;">SNS</h3><br>
						<a href="#"><img src="images/face.jpg" style="width: 30px;"/></a>
						<a href="#"><img src="images/ins.jpg" style="width: 30px;"/></a>
						<a href="#"><img src="images/you.jpg" style="width: 30px;"/></a>
					</div>
				</div>
			</div>
		</div>	
		<div class="footer-below pt-2 pb-3" style="background: #332B20;">
			<div class="container text-center">
				<div style="color: #9AB1B0; font-size: 1rem;">Copyright &copy; 2020. All rights reserved</div>
			</div>
		</div>
	</footer>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<script src="js/index.js"></script>
</body>
</html>