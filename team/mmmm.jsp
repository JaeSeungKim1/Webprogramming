<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
    }
    header {
        background-color: #333;
        padding: 10px 20px;
        color: white;
        font-size: 20px;
    }
    .box{
		border: 1px solid black;
        padding: 10px;
        text-align: center;
        height:350px;
       
    }
    .border{
    	border: 1px solid black;
    }
    
    .tall{
    	height:800px;
    	
    }
    .div_style{
    	width: 30%;
    }
    .flex_manager{
        display: flex;
        justify-content: space-between;
        height: 100%;
    }
   
</style>
</head>
<body>
    <header>
        관리자 페이지
       
    </header>
        <div class="flex_manager">
            <div class="border div_style">1</div>
            <div class="border div_style">2</div>
            <div class="border div_style">
            <div class="box"><jsp:include page="./URL.jsp" /></div>
            <div class="box"> <jsp:include page="./Date.jsp" /> </div>
            </div>
        </div>

        <!-- <table style="width:800px; margin-left:150px;">
        <tr>
        <td rowspan="2"><div class="box tall" >  </div></td>
        <td rowspan="2"><div class="box tall"></div></td>
        <td><div class="box"><jsp:include page="./URL.jsp" /></div></td>
        </tr>
        <tr>
        <td><div class="box"> <jsp:include page="./Date.jsp" /> </div></td>
        
        </tr>
        </table> -->
    
</body>
</html>
