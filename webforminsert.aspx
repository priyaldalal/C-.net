<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CURDPriyal.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="style.css">

    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->

    <script src="jquery.js"></script>
    <script type="text/javascript">
        function CallClientToServer() {
            $.ajax({
                type: "POST",
                url: "WebForm1.aspx/Save",
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
</head>
<body>

    <div class="container">
        <form id="form1" runat="server">

            <label for="fname">First Name</label>
            <input type="text" id="fname" name="firstname" placeholder="Your name..">

            <label for="lname">Last Name</label>
            <input type="text" id="lname" name="lastname" placeholder="Your last name..">

            <label for="lname">Email</label>
            <input type="email" id="email" name="email" placeholder="Your email..">

            <!--<label for="country">Country</label>
    <select id="country" name="country">
      <option value="australia">Australia</option>
      <option value="canada">Canada</option>
      <option value="usa">USA</option>
    </select>-->

            <label for="subject">Subject</label>
            <textarea id="subject" name="subject" placeholder="Write something.." style="height: 200px"></textarea>

            <input type="submit" value="Submit" onclick="CallClientToServer();" />

        </form>
    </div>

</body>
</html>
