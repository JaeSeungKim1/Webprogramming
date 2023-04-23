<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<title>:: 매월 주차 구하기 ::</title>

</head>
<body>
    <h1>프로젝트 관리</h1>
    <hr/>
    <div>

        <span>
            시작일&nbsp;:&nbsp;
            <select onChange="changeConditionPeriod(this);" id="start-year">
                <option value="2018">2018</option>
                <option value="2019">2019</option>
                <option value="2020">2020</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
                <option value="2025">2025</option>
            </select>
            &nbsp;년&nbsp;&nbsp;

            <select onChange="changeConditionPeriod(this);" id="start-month">
                <option value="1">01</option>
                <option value="2">02</option>
                <option value="3">03</option>
                <option value="4">04</option>
                <option value="5">05</option>
                <option value="6">06</option>
                <option value="7">07</option>
                <option value="8">08</option>
                <option value="9">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
            </select>
            &nbsp;월&nbsp;&nbsp;
            <select class="choiceDay" id="start-day"></select>
            &nbsp;일
        </span>
		<br>
        &nbsp;&nbsp;
        &nbsp;&nbsp;
		<br>
		<form action="">
        <ul>
			<li>
            종료일&nbsp;:&nbsp;
		
            <select onChange="changeConditionPeriod(this);" id="end-year">
                <option value="2018">2018</option>
                <option value="2019">2019</option>
                <option value="2020">2020</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
                <option value="2025">2025</option>
            </select>

            &nbsp;년&nbsp;&nbsp;

            <select onChange="changeConditionPeriod(this);" id="end-month">
                <option value="1">01</option>
                <option value="2">02</option>
                <option value="3">03</option>
                <option value="4">04</option>
                <option value="5">05</option>
                <option value="6">06</option>
                <option value="7">07</option>
                <option value="8">08</option>
                <option value="9">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
            </select>

            &nbsp;월&nbsp;&nbsp;

            <select class="choiceDay" id="end-day"></select>

            &nbsp;일
            <br><br>
        </ul>>
		
		</form>
   			<div style="text-align:left;">
    			<button id="invite-btn" onclick="updateProject()" style="margin-top: 10px;">수정하기</button>
    			<div id="invite-url" style="display:none;"></div>
			</div>
						
    </div>
    
   <script type="text/javascript">

    document.addEventListener("DOMContentLoaded", function() {
        const stdDays = document.querySelector("span:nth-child(1)");     
        const endDays = document.querySelector("span:nth-child(2)");   
        let stdFirstDate = null;    
        let endFirstDate = null;  
        let stdLastDate = null;    
        let endLastDate = null;   

        if(nullPointerException(getParameter("stdDate")) == false && nullPointerException(getParameter("endDate")) == false) {
		   const toDate = new Date();
            stdFirstDate = new Date(toDate.getFullYear(), (toDate.getMonth() + 1));
            stdLastDate = new Date(stdFirstDate.getFullYear(), (stdFirstDate.getMonth() + 1), 1); 
            stdLastDate.setDate(0);    

            endFirstDate = new Date(toDate.getFullYear(), (toDate.getMonth() + 1));
            endLastDate = new Date(endFirstDate.getFullYear(), (endFirstDate.getMonth() + 1), 1);  
            endLastDate.setDate(0);  
        }
        else {
            const stdDate = getParameter("stdDate");
            stdFirstDate = new Date(
                  Number(stdDate.substring(0, 4))
                , Number(stdDate.substring(6, 8))
                , Number(stdDate.substring(4, 6))
            );
            stdLastDate = new Date(stdFirstDate.getFullYear(), stdFirstDate.getMonth(), 1);  
            stdLastDate.setDate(0);  

            const endDate = getParameter("endDate");
            endFirstDate = new Date(
                  Number(endDate.substring(0, 4))
                , Number(endDate.substring(4, 6))
                , Number(endDate.substring(6, 8))
            );
            endLastDate = new Date(endFirstDate.getFullYear(), endFirstDate.getMonth(), 1);  
            endLastDate.setDate(0);   
        }
        for(let year = 0; stdDays.querySelector("select:nth-child(1)").length > year; year++) {
            if(stdDays.querySelector("select:nth-child(1)").options[year].value == stdFirstDate.getFullYear()) {
                stdDays.querySelector("select:nth-child(1)").options[year].selected = true;
            }
            if(endDays.querySelector("select:nth-child(1)").options[year].value == stdFirstDate.getFullYear()) {
                endDays.querySelector("select:nth-child(1)").options[year].selected = true;
            }
        }

        for(let month = 0; stdDays.querySelector("select:nth-child(2)").length > month; month++) {
            if(stdDays.querySelector("select:nth-child(2)").options[month].value == stdFirstDate.getMonth()) {
                stdDays.querySelector("select:nth-child(2)").options[month].selected = true
            }
            if(endDays.querySelector("select:nth-child(2)").options[month].value == endFirstDate.getMonth()) {
                endDays.querySelector("select:nth-child(2)").options[month].selected = true;
            }
        }

        for(let date = 1; stdLastDate.getDate() >= date; date++) {
            if(stdFirstDate.getDate() == date) {
                stdDays.querySelector("select:nth-child(3)").innerHTML
                    += "<option value='" + date + "' selected>" + autoLeftPad(date, 2) + "</option>";

            } else {
                stdDays.querySelector("select:nth-child(3)").innerHTML
                    += "<option value='" + date + "'>" + autoLeftPad(date, 2) + "</option>";
            }
        }

        for(let date = 1; endLastDate.getDate() >= date; date++) {
            if((nullPointerException(getParameter("endDate")) == true) ? endFirstDate.getDate() : endLastDate.getDate() == date) {
                endDays.querySelector("select:nth-child(3)").innerHTML
                    += "<option value='" + date + "' selected>" + autoLeftPad(date, 2) + "</option>";
            } else {
                endDays.querySelector("select:nth-child(3)").innerHTML
                    += "<option value='" + date + "'>" + autoLeftPad(date, 2) + "</option>";
            }
        }
    });

    function changeConditionPeriod(cal) {
        const searchDays = cal.parentNode;
        const checkDate = searchDays.querySelector("select:nth-child(3)").value;
        let lastDate = new Date(

              searchDays.querySelector("select:nth-child(1)").value

            , searchDays.querySelector("select:nth-child(2)").value

            , 1

        );

        lastDate.setDate(0);
        searchDays.querySelector("select:nth-child(3)").innerHTML = "";

        for(let date = 1; lastDate.getDate() >= date; date++) {
            if(checkDate == date) {
                searchDays.querySelector("select:nth-child(3)").innerHTML
                    += "<option value='" + date + "' selected>" + autoLeftPad(date, 2) + "</option>";
            } else {
                searchDays.querySelector("select:nth-child(3)").innerHTML
                    += "<option value='" + date + "'>" + autoLeftPad(date, 2) + "</option>";
            }
        }
        if(checkDate > lastDate.getDate()) {
            searchDays.querySelector("select:nth-child(3) > option:last-child").selected = true;
        }
    }
    function autoLeftPad(num, digit) {
        if(String(num).length < digit) { num = new Array(digit - String(num).length + 1).join("0") + num; }
        return num;
    }
    function nullPointerException(worth) {
        if(
               worth == "" 
            || worth == null 
            || worth == undefined 
            || (worth != null && typeof worth == "object" && !Object.keys(worth).length == "")
        ) {
            return false;
        } else {

            return true;
        }
    }
    var getParameter = function(param) {
        let returnValue;
        let url = location.href;
        let parameters = (url.slice(url.indexOf("?") + 1, url.length)).split("&");
        for(let i = 0; i < parameters.length; i++) {
            let varName = parameters[i].split("=")[0];
            if (varName.toUpperCase() == param.toUpperCase()) {
                returnValue = parameters[i].split("=")[1];
                return decodeURIComponent(returnValue);
            }
        }
    };
    let startDate = "";
    let endDate = "";

    function updateProject() {
      const startYear = document.querySelector("#start-year").value;
      const startMonth = document.querySelector("#start-month").value;
      const startDay = document.querySelector("#start-day").value;
      startDate = `${startYear}-${startMonth}-${startDay}`;

      const endYear = document.querySelector("#end-year").value;
      const endMonth = document.querySelector("#end-month").value;
      const endDay = document.querySelector("#end-day").value;
      endDate = `${endYear}-${endMonth}-${endDay}`;
    
      console.log("시작일:", startDate);
      console.log("종료일:", endDate);
      
      //location.href='../NewFile.do?startYear='+startYear+'&startMonth='+startMonth+'&startDay='+startDay+
    		//  '&endYear='+endYear+'&endMonth='+endMonth+'&endDay='+endDay;
      location.href='../updateDdate.do?startYear='+startYear+'&startMonth='+startMonth+'&startDay='+startDay+'&endYear='
    		  +endYear+'&endMonth='+endMonth+'&endDay='+endDay;
    }

</script> 
			


</body>
</html> 