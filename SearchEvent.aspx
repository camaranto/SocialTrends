<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchEvent.aspx.cs" Inherits="SearchEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
        .search-container {
            margin: 0 auto;
            margin-top: 100px;
            width: 500px;
            height: auto;
            min-height: 500px;
        }
        .bar-search-container {
            width: 100%;
            text-align:center;
        }
        .w3-card {
            text-align: center;
            margin-top: 10px;
        }
        .input-search {
            width: 400px;
            height: 40px;
            border: 0 ;
            border-bottom : 2px solid silver;
            padding-left: 5px;
        }
        .body-search {
            margin-top: 15px;
        }
            
        .btn-search {
            font-size: 20px;
            box-shadow:0 2px 5px 0 rgba(0,0,0,0.20),0 2px 10px 0 rgba(0,0,0,0.16);
            border: 0 ;
            background-color: transparent;
        }
            .btn-search:hover {
                background-color: lightgray;
            }
        .user-img {
            max-width: 120px;
            max-height: 120px;
            height: auto;
            width: auto;
            border-radius: 100% 100% 100% 100%;
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
      <a href="#team" class="w3-bar-item w3-button"><i class="fa fa-user"></i>MY COUNT</a>
      <a href="#work" class="w3-bar-item w3-button"><i class="fa fa-th"></i>MY ROUTINE</a>
      <a href="Search.aspx" class="w3-bar-item w3-button"><i class="fa fa-search"></i>SEARCH USER</a>
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
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">MY COUNT</a>
  <a href="#team" onclick="w3_close()" class="w3-bar-item w3-button">MY ROUTINE</a>
  <a href="Search.aspx" onclick="w3_close()" class="w3-bar-item w3-button">SEARCH USER</a>
  <a href="Default.aspx" onclick="w3_close()" class="w3-bar-item w3-button">LOG OUT</a>
</nav>
    
    <!-- HERE ANY OTHER COMPONENT OF THE PAGE-->
    <form id="form1" runat="server">
    <div class="search-container">
        <div class="bar-search-container">
            <asp:TextBox ID="SearchText" CssClass="input-search" placeholder="Search" runat="server"></asp:TextBox>
            <asp:Button ID="SearchBtn" CssClass="btn-search" runat="server" Text="&#128269;" OnClick="SearchBtn_Click" />
        </div>
        <div class="body-search">
            <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>

            </HeaderTemplate>
            <ItemTemplate>
                <div class="w3-container">
                         <div class="w3-card">
                           <div class="w3-container">
                              <h3>
                                  <asp:LinkButton ID="LinkButton1"  runat="server">
                                  <asp:Label ID="Name" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                  </asp:LinkButton>
                              </h3>
                              <p class="w3-opacity">
                                  <asp:Image ID="UserImg" CssClass="user-img" ImageUrl='<%# Eval("ImageProfile") %>' runat="server" /><br />
                                  <asp:Label ID="Email" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                  <asp:Label ID="Label3" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                              </p>
                           
                            </div>
                          </div>
                  </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>
    </form>
    
<!-- Footer -->
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
