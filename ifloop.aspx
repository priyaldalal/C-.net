<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loopajax1.aspx.cs" Inherits="WebApplication1.loopajax1" %>


<html>
<head runat="server">
    <title></title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



</head>
<body>
    <form id="form1" runat="server">
        <div>
            Your number :  
        <input id="number" type="number" value="number" />

            <input id="btn" type="button" value="enter value" onclick="ifloop()" />
        </div>
    </form>
    <script type="text/javascript">
        
        function ifloop() {
            $.ajax({
                type: "POST",
                url: "loopajax1.aspx/IfExample",
                data: JSON.stringify({ number: $("#number").val() }),
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
</body>
</html>
