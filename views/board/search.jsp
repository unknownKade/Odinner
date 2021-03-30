<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>재료로 음식 찾기</title>
</head>

<body>
	<div>
		<%@include file="nav.jsp" %>
	</div>
   
   <br>
   <br>
   <br>
   <p id="pp"><b><span id="big">오</span>늘 <span id="big">디너</span>&nbsp;뭐 해먹지?</b></p><br><br>
   
         <form name = "foodForm" action = "/board/list" method = "GET">
         <button id="searchBtn" type="submit" class="search_food" width="150px;" height="150px;" >
         <img class="radius"  src="<spring:url value='/resources/images/food_image/search_3.png'/>">
         
         </button>
         </form>
         
   <pre>
   점심에 이어 저녁 메뉴까지도 고민하지 마세요!
   원하는 식재료들 조합으로 음식메뉴를 추천해드립니다.
   
   <span id="small">먹고싶은 식재료를 드래그하여 접시안에 담으세요.</span>
   </pre>
   <div align="center">
    <!-- 여기 -->
   <div id="plate" class="ui-widget-content ui-state-default" align="center">
</div><br><br><br>
   <br style="clear:both">

<label for="center"  class="col-sm-2 control-label"></label>
<div id="cen" class="ui-widget ui-helper-clearfix">
 
<ul id="food" class="food ui-helper-reset ui-helper-clearfix" >
  <li class="ui-widget-content ui-corner-tr" id="밀가루">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/flour.svg'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="쌀">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/rice.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="빵" >
    <img class="ui-widget-header"  width="92px" height="72px" src="<spring:url value='/resources/images/food_image/bread.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="고등어">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/fish_2.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="연어">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/salmon.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="새우">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/shrimp.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="돼지고기">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/pork.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="소고기">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/beef.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="닭가슴살">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/chest.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="햄">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/ham.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="양상추">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/vegetable.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="고추">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/pepper.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="달걀">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/egg.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="당근">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/carrot.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="옥수수">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/corn.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="양파">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/onion.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="우유">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/milk.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="치즈">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/cheese.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="아보카도">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/abo.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="사과">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/apple.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="딸기">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/strawberry.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="토마토">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/tomato.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="오이">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/cucumber.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="김치">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/kimchi.png'/>">
  </li>
</ul>

</div>

 

          <!-- 검색창 부분 -->         
            </div>
          <%@include file="footer.jsp" %>

          
</body>
</html>