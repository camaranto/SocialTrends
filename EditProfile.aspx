<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<style>
    body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
    body, html {
        height: 100%;
        line-height: 1.8;
    }
    .info-container {
        padding-top: 20px;
        margin: 0 auto;
        margin-top: 70px;
        height: 500px;
        width: 400px;
        text-align: center;
        box-shadow:0 2px 5px 0 rgba(0,0,0,0.20),0 2px 10px 0 rgba(0,0,0,0.16);
    }
    .w3-input, .w3-select {
        width: 300px;
        margin: 0 auto;
    }
    .w3-button {
        margin-top: 14px;
        box-shadow:0 2px 5px 0 rgba(0,0,0,0.20),0 2px 10px 0 rgba(0,0,0,0.16);
    }
    .uploader {
        margin-bottom: 10px;
    }
    
</style>
</head>
<body>
<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href="#home" class="w3-bar-item w3-button w3-wide">LOGO</a>
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
      <a href="#about" class="w3-bar-item w3-button">ABOUT</a>
      <!--<a href="#team" class="w3-bar-item w3-button"><i class="fa fa-user"></i>MY COUNT</a>-->
      <a href="#work" class="w3-bar-item w3-button"><i class="fa fa-th"></i>MY ROUTINE</a>
      <a href="Search.aspx" class="w3-bar-item w3-button"><i class="fa fa-search"></i>SEARCH USER</a>
      <!--<a href="SearchEvent.aspx" class="w3-bar-item w3-button"><i class="fa fa-search"></i>SEARCH EVENT</a>-->
      <a href="Default.aspx" class="w3-bar-item w3-button"><i class="fa fa-sign-out"></i>LOG OUT</a>
    </div>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close &times;</a>
  <!--<a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">MY COUNT</a>-->
  <a href="#team" onclick="w3_close()" class="w3-bar-item w3-button">MY ROUTINE</a>
  <a href="Search.aspx" onclick="w3_close()" class="w3-bar-item w3-button">SEARCH USER</a>
  <!--<a href="SearchEvent.aspx" onclick="w3_close()" class="w3-bar-item w3-button">SEARCH EVENT</a>-->
  <a href="Default.aspx" onclick="w3_close()" class="w3-bar-item w3-button">LOG OUT</a>
</nav>
    
    <!-- HERE ANY OTHER COMPONENT OF THE PAGE-->
    <form id="form1" runat="server">
        <div class="info-container">
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="uploader"  style="color: gray" /><br />
            <asp:TextBox ID="Name" runat="server" Text="" CssClass="w3-input" ></asp:TextBox><br />
            <asp:TextBox ID="LastName" runat="server" Text="" CssClass="w3-input"></asp:TextBox><br />
            <asp:TextBox ID="Email" runat="server" Text="" CssClass="w3-input"></asp:TextBox><br />
            <asp:TextBox ID="Phone"  runat="server" Text="" CssClass="w3-input"></asp:TextBox><br />
            <asp:Label ID="Country" runat="server" Text="Colombia"></asp:Label><br />
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
                     </asp:DropDownList><br />
            
            <asp:Button ID="SaveButton" CssClass="w3-button" runat="server" Text="SAVE" OnClick="SaveButton_Click" />
        </div>
        
    </form>

<!-- Footer 
<footer class="w3-center w3-black w3-padding-64">
  <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
  <div class="w3-xlarge w3-section">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">OURS</a></p>
</footer>
    -->
    <!-- Scripts for the menu var -->
<script>
    // Toggle between showing and hiding the sidebar when clicking the menu icon
    var mySidebar = document.getElementById("mySidebar");

    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
        } else {
            mySidebar.style.display = 'block';
        }
    }

    // Close the sidebar with the close button
    function w3_close() {
        mySidebar.style.display = "none";
    }
</script>
</body>
</html>
