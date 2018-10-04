<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style>
        .w3-card {
            margin: 0 auto;
            margin-top: -80px;
            height: 600px;
            width: 400px;
            text-align: center;
        }
        .w3-input, .w3-select {
            width: 300px;
            margin: 0 auto;
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
                    <i class="fa fa-address-card w3-margin-bottom w3-jumbo" style="color: gray"></i><br />
                    <asp:TextBox ID="TxtName" CssClass="w3-input" placeholder="Name" runat="server"></asp:TextBox><br />
               
                    <asp:TextBox ID="TxtLastName" CssClass="w3-input" placeholder="LastName" runat="server"></asp:TextBox><br />
               
                    <asp:TextBox ID="EmailText" CssClass="w3-input" placeholder="Email" runat="server" TextMode="Email"></asp:TextBox><br />
               
                    <asp:TextBox ID="PasswordText" CssClass="w3-input" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox><br />
               
                    <asp:TextBox ID="TxtPhone" CssClass="w3-input" placeholder="Phone" runat="server" TextMode="Number"></asp:TextBox><br />
                    <asp:Label ID="Label5" runat="server" style="color: gray" Text="Country: Only avaible for Colombia" ></asp:Label><br /><br />
               
                     <asp:DropDownList ID="City" CssClass="w3-select" style="color: gray" runat="server">
                                <asp:ListItem Value="0">-Select City-</asp:ListItem>
                                <asp:ListItem>Barranquilla</asp:ListItem>
                                <asp:ListItem>Bello</asp:ListItem>
                                <asp:ListItem>Bogotá</asp:ListItem>
                                <asp:ListItem>Bucaramanga</asp:ListItem>
                                <asp:ListItem>Buenaventura</asp:ListItem>
                                <asp:ListItem>Cali</asp:ListItem>
                                <asp:ListItem>Cartagena</asp:ListItem>
                                <asp:ListItem>Cúcuta</asp:ListItem>
                                <asp:ListItem>Ibagué</asp:ListItem>
                                <asp:ListItem>Manizales</asp:ListItem>
                                <asp:ListItem>Medellin</asp:ListItem>
                                <asp:ListItem>Monteria</asp:ListItem>
                                <asp:ListItem>Neiva</asp:ListItem>
                                <asp:ListItem>Pasto</asp:ListItem>
                                <asp:ListItem>Pereira</asp:ListItem>
                                <asp:ListItem>Santa Marta</asp:ListItem>
                                <asp:ListItem>Soacha</asp:ListItem>
                                <asp:ListItem>Soledad</asp:ListItem>
                                <asp:ListItem>Valledupar</asp:ListItem>
                                <asp:ListItem>Villavicencio</asp:ListItem>
                     </asp:DropDownList>
                     <br /><br />
                    <asp:FileUpload ID="FileUpload1" runat="server" style="color: gray"  /><br /><br />
                    <asp:Button ID="BtnRegister" CssClass="w3-button" runat="server" Text="Register" OnClick="BtnRegister_Click" />
                </div>
              <!--<span class="w3-jumbo w3-hide-small" style="color: tomato;">Register</span><br/>-->
                
               
            </div>
        </div>
    </div>
    </form>
</body>
</html>
