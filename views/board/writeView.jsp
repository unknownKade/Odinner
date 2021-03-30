<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<style>
:root {
    --main-color: #8cbc14;
    --white-color: #efefef;
    --brown-color: #6d3a00;
}


label {
    font-weight: bold;
}

section.container {
    display: grid;
    place-items: center;
}

form {
    width: 50vw;
    text-align: left;
    padding: 5vh 5vw;
    border: #ededed solid 1px;
}

h1 {
    text-align: center;
}

.content_step_btn {
    display: flex;
    justify-content: center;
}

.content_add_step {
    margin: 0 10px;
    justify-self: center;
    width: 100px;
}

.write_meta>div,
.write_select>div,
.write_content>div {
    display: flex;
    align-items: center;
    width: 100%;
    padding: 5px;
}

.write_select {
    display: grid;
    grid-template-columns: 50% 50%;
}

.write_content label:not(.file_tumbnail),
.write_meta label:not(.file_thumbnail),
.write_tip label {
    display: flex;
    justify-self: flex-start;
    width: 20%;
}

.write_select label {
    display: flex;
    justify-self: flex-start;
    width: 40%;
}

.write_meta input {
    width: 80%;
}

.write_ingredient textarea,
.write_tip textarea {
    width: 100%;
}

.write_select select {
    width: 60%;
}

.write_meta textarea,
.write_tip textarea {
    width: 80%;
    resize: none;
    min-height: 40px;
}

.write_content textarea {
    width: 70%;
    height: 80px;
    resize: none;
}

.file_input {
    width: 80px;
    height: 80px;
    overflow: hidden;
}
input[type="file"]{
    display: none;
}

.file_input img{
    width: 100%;
    height: 100%;
    color: var(--main-color);
    object-fit: cover;
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>
    <script>
        $(document).ready(function () {
            let i = 0;
            let reader = new FileReader;

            $(".content_add_step").click(addStep);

            $(".content_delete_step").click(function () {
                $(".content-step:last").remove();
                i--;
            });

          
            $(".recipe-step-img").change(function (){
                if(this.files && this.files[0]) {
                    reader.onload = function(data) {
                       $(".file_input img").attr("src", data.target.result);                        
                    }
                    reader.readAsDataURL(this.files[0]);
                 }
            });
          
            function addStep() {
                i++;
                var e = $(".content_step:first").clone().insertBefore($(".content_step_btn"));
                e.find('label[for="content"]').html("step" + i)
                e.find('textarea').attr("name", "content["+ (i-1) + "]");
                e.find('input').attr("name", "imgFile["+ (i-1) + "]");
                
                ;
            }
            addStep();
        });

    </script>
    <title>레시피</title>
</head>

<body>
    <div>
        <%@include file="nav.jsp" %>
    </div>

    <section class="container">
        <form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
            <h1>레시피</h1>
            <c:if test="${member.userId != null}">
                <div class="write_meta">
                    <div class="write_title">
                        <label for="title">음식이름</label>
                        <input type="text" id="title" name="title" title="제목을 입력하세요." />
                    </div>
                    <div class="write_mainImg">
                        <label>썸네일</label>
                        <span class="file_input">
                            <label class="file_thumbnail">
                                <img src="/resources/images/recipe_image/add.svg"/>
                                <input type="file" name="mainFile" class="recipe-step-img" />
                            </label>
                        </span>
                    </div>
                    <div class="write_ingredient">
                        <label for="ingredient">재료</label>
                        <textarea class="ingredient" name="ingredient" placeholder="예) 양배추,고추장 1 큰 술"></textarea>
                    </div>
                </div>
                <div class="write_select">
                    <div class="form-group">
                        <label for="menu">분류</label>
                        <select id="menu" name="menu" class="custom-select cc_cursor">
                            <option selected value="0">분류를 선택해주세요</option>
                            <option>한식</option>
                            <option>중식</option>
                            <option>일식</option>
                            <option>양식</option>
                            <option>분식</option>
                            <option>간식</option>
                            <option>퓨전</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="lev">난이도</label>
                        <select id="lev" name="lev" class="custom-select cc_cursor">
                            <option selected value="0">난이도를 선택해주세요</option>
                            <option>찐고수</option>
                            <option>고수도전</option>
                            <option>평범한 실력</option>
                            <option>어린아이</option>
                            <option>똥손가능</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="time">소요시간</label>
                        <select id="time" name="time" class="custom-select cc_cursor" style=>
                            <option selected value="0">소요시간을 선택해주세요</option>
                            <option>5분이내</option>
                            <option>10분이내</option>
                            <option>30분이내</option>
                            <option>1시간이내</option>
                            <option>2시간이내</option>
                            <option>5시간이내</option>
                            <option>10시간이내</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="serving">인원</label>
                        <select id="people" name="serving" class="custom-select cc_cursor">
                            <option selected value="0">인원수를 선택해주세요</option>
                            <option>1인분</option>
                            <option>2인분</option>
                            <option>4인분</option>
                            <option>6인분</option>
                            <option>10인분</option>
                            <option>30인분이상</option>
                        </select>
                    </div>
                </div>
                <!-- Content--------------->
                <div class="write_content">
                    <div class="content_step">
                        <label for="content"></label>
                        <textarea id="content" name=""></textarea>
                        <div class="file_input">
                            <label class="file_thumbnail">
                            	<img src="/resources/images/recipe_image/add.svg"/>
                                <input type="file" name="" class="recipe-step-img" />                                
                            </label>
                        </div>
                    </div>
                    <div class="content_step_btn">
                        <button type="button" class="content_add_step">추가</button>
                        <button type="button" class="content_add_step">삭제</button>
                    </div>
                </div>
                <!-- ContentEnd------------>
                <div class="write_meta">
                    <div class="write_tip">
                        <label for="tip">나만의 꿀팁</label>
                        <textarea name="tip" placeholder="예)고기는 전날 양념해두면 잡내를 잡을 수 있습니다"></textarea>
                    </div>
                    <div class="write_writer">
                        <label for="writer">작성자</label>
                        <input type="text" id="writer" name="writer" title="작성자를 입력하세요." value="${member.userId}" />
                    </div>
                </div>
                <button class="btn btn-primary" type="submit" id="recipe_write">작성 완료</button>
            </c:if>
            <!-- Not logged in ------------>
            <c:if test="${member.userId == null}">
                <p>로그인 후에 작성하실 수 있습니다.</p>
            </c:if>
        </form>
    </section>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</body>

</html>