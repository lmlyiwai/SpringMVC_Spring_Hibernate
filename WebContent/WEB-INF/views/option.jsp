<%--
  Created by IntelliJ IDEA.
  User: mengleil
  Date: 4/10/2017
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>options date</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
    <style type="text/css">
        div{
            text-align:center;
        }
    </style>
</head>
<body>
<div >
<p>please select StartDate and EndDate</p>
<script type="text/javascript">
    $(document).ready(function(){
        $("#3").click(function(){
            var start = $("#1").val()
            var end = $("#2").val()
            if (end == ""){
                if(stime == ""){
                    $("form").submit()
                } else {
                    var s = new Date(stime[0],stime[1],stime[2])
                    if (s >= new Date().getTime()){
                        alert("start time is future")
                        return false
                    } else {
                        $("form").submit()
                    }
                }
            }
            if( start != ""){
                var stime = start.split("-")
                var etime = end.split("-")
                var s = new Date(stime[0],stime[1],stime[2])
                var e = new Date(etime[0],etime[1],etime[2])
                if (s.getTime() > e.getTime() ){
                    alert("start time is more than end time")
                    return false
                } else {
                    $("form").submit()
                }
            }
        })
        $("#5").click(function() {
            var date = $("#4").val()
            console.log(date)
            $.ajax({
                type: 'POST',
                url: "/test/commit",
                data: date,
                dataType:"json",
                success: function (data) {
                    console.log("data :" + data)
                    $("#6").html(data)
                }
            })
        })
        $("#6").click(function(){
            $("#6").hide()
        })
    })
</script>
<form action="/test/hchart">
    Start Date:<input type="date" name="startDate" id="1" />
    End Date:<input type="date" name="endDate" id="2" />
    <input type="submit" value="select time" id="3">
</form>
<form>
    date:<input type="date" name="commit" id="4">
    <button type="button" id="5">commit</button>
</form>
<div id="6"></div>
</div>
</body>
</html>
