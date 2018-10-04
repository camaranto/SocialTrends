<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Count.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    .body-conatiner {
        margin: 0 auto;
        margin-top: 100px;
        width: 100%;
        min-height: 600px;
        height: auto;
    }
    footer {
        position:absolute;
    }
    .info-container {
        margin-left: 20px;
        margin-top: 70px;
        float: left;
        width: 300px;
        height: 400px;
        box-shadow:0 2px 5px 0 rgba(0,0,0,0.20),0 2px 10px 0 rgba(0,0,0,0.16);
        text-align: center;
    }
    .profile-img {
        width: auto;
        height: auto;
        max-height: 130px;
        max-width: 130px;
        border-radius: 100%;
        margin-top: 20px;
        border: 1px solid silver;
    }
    #edit-icon {
        margin-top: 20px;
        margin-left: 250px;
    }
    w3.card {
        width: 300px;
    }
    .preferences-container {
        float: left;
        margin-left: 60px;
        margin-top: 70px;
        width: 400px;
        height: auto;
        text-align: center;
    }
    .add-btn {
        box-shadow:0 2px 5px 0 rgba(0,0,0,0.20),0 2px 10px 0 rgba(0,0,0,0.16);
        background-color: transparent;
        border:0;
    }
    .preferences-input {
        border:0;
        padding-left: 5px;
        box-shadow:0 2px 5px 0 rgba(0,0,0,0.20),0 2px 10px 0 rgba(0,0,0,0.16);
    }
    .img-user-box {
        width: 100px;
        height: 100px;
        text-align: center;
        margin: 0 auto;
        display: inline-block;
        position: relative;
        overflow: hidden;
        border-radius: 50%;
    }
    .user-img {
        max-width: 100px;
        max-height: 100px;
        height: 100%;
        width: auto;
    }
    .friends-container {
        float:left;
        margin-left: 50px;
        width: 300px;
        text-align:center;
        margin-top: 100px;
        text-align:center;
    }
    .li-friends {
        margin-bottom: 10px;
        margin-top: 10px;
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
    <div class="body-container">
        
            <div class="info-container">
                <asp:Image ID="ProfileImg" CssClass="profile-img" runat="server" /><br />
                <asp:Label ID="Name" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="LastName" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="Email" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="Phone" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="Country" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="City" runat="server" Text=""></asp:Label><br />
                <a href="EditProfile.aspx"><i class="fa fa-pencil" id="edit-icon" aria-hidden="true"></i></a>
            </div>
            <div class="preferences-container">
                <div class="bar-add">
                    <asp:TextBox ID="PreferenceText" CssClass="preferences-input" runat="server"></asp:TextBox>
                    <asp:Button ID="AddButton" CssClass="add-btn" runat="server" Text="ADD" OnClick="AddButton_Click" />
                </div>
                <div class="body-preferences">
                    <asp:Repeater ID="RepeaterPreferences" runat="server">
                    <HeaderTemplate>

                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="w3-container">
                                 <div class="w3-card">
                                   <div class="w3-container">
                                      <p class="w3-opacity">
                                          <asp:Label ID="PreferenceL" runat="server" Text='<%# Eval("Preference") %>'></asp:Label>
                                      </p>
                                    </div>
                                  </div>
                          </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        <div class="friends-container">
                <asp:LinkButton ID="Friendslink" href="Friends.aspx" CssClass="li-friends" runat="server">SEE ALL FRIENDS</asp:LinkButton>
            <asp:Repeater ID="Repeater2" runat="server">
            <HeaderTemplate>

            </HeaderTemplate>
            <ItemTemplate>
                <div class="w3-container">
                         <div class="w3-card">
                           <div class="w3-container">
                              <p class="w3-opacity">
                                  <div class="img-user-box">
                                      <asp:Image ID="UserImg" CssClass="user-img" ImageUrl='<%# Eval("ImageProfile") %>' runat="server" />
                                  </div><br />
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
