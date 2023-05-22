<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../commonvar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
    </style>
</head>
<script>
    $(function () {
        if ($("#m_name").val() == "" || $("#m_email").val() == "") {
            location.replace("signin");
        }
    });
</script>
<body>
${m_email}
${m_name}
<input type="hidden" id="m_email" value="${m_email}">
<input type="hidden" id="m_name" value="${m_name}">
<div>
    개인회원 비밀번호 찾기
    <div>
        회원님의 비밀번호를 재설정해주세요
        <table class="table">
            <tr>
                <td>
                    <strong>비밀번호</strong>
                    <input type="password" id="m_pass" required placeholder="8~16자리/영문 대소문자, 숫자, 특수문자 조합">
                    <span id="passokicon"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>비밀번호확인</strong>
                    <input type="password" id="passchk" placeholder="8~16자리/영문 대소문자, 숫자, 특수문자 조합">
                    <span id="passchkicon"></span>
                </td>
            </tr>
        </table>
        <button type="button" id="submitbtn" disabled>변경하기</button>
    </div>
    <div>
        <button type="button">로그인</button>
        <button type="button">아이디 찾기</button>
        <button type="button">회원가입</button>
    </div>
</div>
<script>
    let passvalid = false;
    let passcheck = false;

    //pass check
    function updatePasswordStatus() {
        let pass = $("#m_pass").val();
        let passMatch = $("#passchk").val();
        let valid = validPass(pass);

        if (valid) {
            $("#passokicon").html("<i class='bi bi-check' style='color:green;'></i>" +
                "<span>사용 가능한 비밀번호에요</span>");
            passvalid = true;
        } else {
            $("#passokicon").html("<i class='bi bi-x' style='color:red;'></i>" +
                "<span>8~16자리 영문 대소문자, 숫자, 특수문자의 조합으로 만들어주세요</span>");
            passvalid = false;
        }

        if (pass != passMatch) {
            $("#passchkicon").html("<i class='bi bi-x' style='color:red;'></i>" +
                "<span>비밀번호와 일치하지 않아요</span>");
            passcheck = false;
        } else {
            $("#passchkicon").html("<i class='bi bi-check' style='color:green;'></i>" +
                "<span>비밀번호와 일치해요</span>");
            passcheck = true;
        }

        if (pass == "" && passMatch == "") {
            $("#passchkicon").html("");
        }
    }

    $("#m_pass").keyup(function () {
        updatePasswordStatus();
    });

    $("#passchk").keyup(function () {
        updatePasswordStatus();
    });

    function validPass(pass) {
        let passPattern = /^[a-zA-Z0-9!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]+$/;
        return pass.length >= 8 && pass.length <= 16 && passPattern.test(pass);
    }

    $(document).on("mouseover keyup", function () {
        if (passvalid && passcheck) {
            $("#submitbtn").prop("disabled", false);
        }
    });

    $("#submitbtn").click(function () {
        if (!passvalid || !passcheck) {
            alert("비밀번호 확인");
            return false;
        } else {
            let m_pass = $("#m_pass").val();
            let m_email = $("#m_email").val();
            let m_name = $("#m_name").val();

            console.log(m_email);
            console.log(m_name);
            console.log(m_pass);
            if (m_email == "" || m_name == "") {
                location.replace("signin");
            } else {
                $.ajax({
                    type: "get",
                    url: "updatepass",
                    data: {"m_email": m_email, "m_name": m_name, "m_pass": m_pass},
                    dataType: "text",
                    success: function () {
                        alert("비밀번호가 변경되었습니다");
                    }
                });
            }
        }
    });
</script>
</body>
</html>
