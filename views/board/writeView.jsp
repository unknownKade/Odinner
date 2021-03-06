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
    <title>?????????</title>
</head>

<body>
    <div>
        <%@include file="nav.jsp" %>
    </div>

    <section class="container">
        <form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
            <h1>?????????</h1>
            <c:if test="${member.userId != null}">
                <div class="write_meta">
                    <div class="write_title">
                        <label for="title">????????????</label>
                        <input type="text" id="title" name="title" title="????????? ???????????????." />
                    </div>
                    <div class="write_mainImg">
                        <label>?????????</label>
                        <span class="file_input">
                            <label class="file_thumbnail">
                                <img src="/resources/images/recipe_image/add.svg"/>
                                <input type="file" name="mainFile" class="recipe-step-img" />
                            </label>
                        </span>
                    </div>
                    <div class="write_ingredient">
                        <label for="ingredient">??????</label>
                        <textarea class="ingredient" name="ingredient" placeholder="???) ?????????,????????? 1 ??? ???"></textarea>
                    </div>
                </div>
                <div class="write_select">
                    <div class="form-group">
                        <label for="menu">??????</label>
                        <select id="menu" name="menu" class="custom-select cc_cursor">
                            <option selected value="0">????????? ??????????????????</option>
                            <option>??????</option>
                            <option>??????</option>
                            <option>??????</option>
                            <option>??????</option>
                            <option>??????</option>
                            <option>??????</option>
                            <option>??????</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="lev">?????????</label>
                        <select id="lev" name="lev" class="custom-select cc_cursor">
                            <option selected value="0">???????????? ??????????????????</option>
                            <option>?????????</option>
                            <option>????????????</option>
                            <option>????????? ??????</option>
                            <option>????????????</option>
                            <option>????????????</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="time">????????????</label>
                        <select id="time" name="time" class="custom-select cc_cursor" style=>
                            <option selected value="0">??????????????? ??????????????????</option>
                            <option>5?????????</option>
                            <option>10?????????</option>
                            <option>30?????????</option>
                            <option>1????????????</option>
                            <option>2????????????</option>
                            <option>5????????????</option>
                            <option>10????????????</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="serving">??????</label>
                        <select id="people" name="serving" class="custom-select cc_cursor">
                            <option selected value="0">???????????? ??????????????????</option>
                            <option>1??????</option>
                            <option>2??????</option>
                            <option>4??????</option>
                            <option>6??????</option>
                            <option>10??????</option>
                            <option>30????????????</option>
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
                        <button type="button" class="content_add_step">??????</button>
                        <button type="button" class="content_add_step">??????</button>
                    </div>
                </div>
                <!-- ContentEnd------------>
                <div class="write_meta">
                    <div class="write_tip">
                        <label for="tip">????????? ??????</label>
                        <textarea name="tip" placeholder="???)????????? ?????? ??????????????? ????????? ?????? ??? ????????????"></textarea>
                    </div>
                    <div class="write_writer">
                        <label for="writer">?????????</label>
                        <input type="text" id="writer" name="writer" title="???????????? ???????????????." value="${member.userId}" />
                    </div>
                </div>
                <button class="btn btn-primary" type="submit" id="recipe_write">?????? ??????</button>
            </c:if>
            <!-- Not logged in ------------>
            <c:if test="${member.userId == null}">
                <p>????????? ?????? ???????????? ??? ????????????.</p>
            </c:if>
        </form>
    </section>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</body>

</html>