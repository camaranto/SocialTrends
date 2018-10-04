<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <!--<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.18.1/build/cssreset/cssreset-min.css"/>-->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style>
        .w3-card {
            margin: 0 auto;
            height: 310px;
            width: 350px;
            text-align: center;
        }
        .w3-input {
            width: 300px;
            margin: 0 auto;
        }
        .li-register {
            color: gray;
            text-decoration: none;
        }
            .li-register:hover {
                color: #222121;
            }
        .w3-button {
            color:gray;
            font-size: 20px;
        }
        .w3-card, .w3-button {
            box-shadow:0 2px 5px 0 rgba(0,0,0,0.20),0 2px 10px 0 rgba(0,0,0,0.16);
        }
    </style>

</head>
<body>

    <form id="form1" runat="server">
    <div>
        <div class="w3-container" style="padding:128px 16px" id="about">
            <div class="w3-row-padding w3-center" style="margin-top:64px">
               <div class="w3-card">
                    <i class="fa fa-user-circle-o w3-margin-bottom w3-jumbo" style="color: gray"></i><br />
                    <!--<span class="w3-jumbo w3-hide-small" style="color: gray;">Login</span><br/>-->
                    <br/>
                    <asp:TextBox ID="EmailText" placeholder="Email" CssClass="w3-input" runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="PasswordText" placeholder="Password" CssClass="w3-input" runat="server" TextMode="Password"></asp:TextBox><br />
                    <asp:Button ID="Button1" runat="server" CssClass="w3-button" Text="Login" OnClick="Button1_Click" /><br />
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="li-register" href="Register.aspx">Register</asp:LinkButton>
                </div>
                
                
            </div>
        </div>
    </div>
    </form>
</body>
</html>
