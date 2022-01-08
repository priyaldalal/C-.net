<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="WebApplication1.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="scripts/jquery-1.3.2.min.js" type="text/javascript"></script>  
<script type="text/javascript">
    function ShowCurrentTime() {
        $.ajax({
            type: "POST",
            url: "WebForm6.aspx/GetCurrentTime",
            data: ({name: ("#Name")[0].value }),  
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                alert(response.d);
            }
        });
    }
    function OnSuccess(response) {
        alert(response.d);
    }
</script> 

</head>
<body>
    <form id="form1" runat="server">
    <div>  
    Your Name :  
        <input id="name" type="text" value="Name"  />
   
    <input id="btnGetTime" type="button" value="Show Current Time" onclick="ShowCurrentTime()" />  
</div>  
    
    </form>
</body>
</html>
