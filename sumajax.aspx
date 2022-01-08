<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="WebApplication1.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        function CallClientToServer() {
            $.ajax({
                type: "POST",
                url: "WebForm5.aspx/CalculateSum",
                data: JSON.stringify({ Num1: $("#txtFirstNumber").val(), Num2: $("#txtSecondNumber").val() }),
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
    <form id="form1">
        <div>
            <table>
                <tr>
                    <td>Enter First Number:</td>
                    <td>
                        <input type="text" id="txtFirstNumber" />
                </tr>
                <tr>
                    <td>Enter Second Number:</td>
                    <td>
                        <input type="text" id="txtSecondNumber" />
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="button" id="btnSave" onclick="CallClientToServer();" value="Save"/>
                        <div id="dvMsg"></div>
                    </td>
                </tr>
            </table>
        </div>
    </form>

</body>
</html>
