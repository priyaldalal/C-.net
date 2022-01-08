<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="CURDPriyal.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <link rel="stylesheet" href="stylesheet1.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function () {
            //getAlldata();
        });
        function getAlldata() {
            $.ajax({
                type: "POST",
                url: "WebForm2.aspx/getAlldata",
                data: JSON.stringify({ userid: $("#userid").val() }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $(response.d).find("tblData").each(function () {
                        $("#fname").val($(this).find("fname").text());
                        $("#lname").val($(this).find("lname").text());
                        $("#email").val($(this).find("email").text());
                        $("#subject").val($(this).find("subject").text());
                    });
                },
                failure: function (response) {

                }
            });
        }
        function CallClientToServer() {
            $.ajax({
                type: "POST",
                url: "WebForm2.aspx/Save",
                data: JSON.stringify({ fname: $("#fname").val(), lname: $("#lname").val(), email: $("#email").val(), subject: $("#subject").val() }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
        function update() {
            $.ajax({
                type: "POST",
                url: "WebForm2.aspx/update",
                data: JSON.stringify({ userid: $("#userid").val(), fname: $("#fname").val(), lname: $("#lname").val(), email: $("#email").val(), subject: $("#subject").val() }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
        function CallClientToServer() {
            $.ajax({
                type: "POST",
                url: "WebForm2.aspx/Delete",
                data: JSON.stringify({ fname: $("#fname").val(), lname: $("#lname").val(), email: $("#email").val(), subject: $("#subject").val() }),
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

    <title>Priyal CURD</title>


    <body>
        <form id="form1" runat="server">
            <div>

                <label for="fname">USERID</label>
                <input type="number" id="userid" name="userid" placeholder="Your ID.." />

                <input type="button" value="Submit" onclick="getAlldata();" /><br />

                <label for="fname">First Name</label>
                <input type="text" id="fname" name="firstname" placeholder="Your name.." />

                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lastname" placeholder="Your last name.." />

                <label for="lname">Email</label>
                <input type="email" id="email" name="email" placeholder="Your email.." />

                <!--<label for="country">Country</label>
    <select id="country" name="country">
      <option value="australia">Australia</option>
      <option value="canada">Canada</option>
      <option value="usa">USA</option>
    </select>-->

                <label for="subject">Subject</label>
                <textarea id="subject" name="subject" placeholder="Write something.." style="height: 200px"></textarea>

                <input type="button" value="Submit" onclick="update();" />


            </div>
        </form>
    </body>
</html>
