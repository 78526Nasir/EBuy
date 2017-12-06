<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="E_Commerce_Site.UI.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Buy</title>
    <link rel="stylesheet" href="../css/homePage.css" />
    <script src="../script/jQuery-3.2.1.js"></script>

    <script type="text/javascript">
        var isAuthUser=<%=flag%>;

        function isAuthenticated() {
            if(isAuthUser===1){
                var btn=document.getElementById("btnLogin");
                btn.style.display="none";
                var div = document.getElementById("userDetails");
                div.style.display="none";
            }

            if(isAuthUser===0){
                var img=document.getElementById("userImage");
                var div = document.getElementById("userDetails");
                div.style.display="none";
                img.style.display="none";
                
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      
        <div class="container">
            <!-- header -->
            <div class="header">
                <div class="left-header">
                    <a href="HomePage.aspx">
                        <h1>E-Buy</h1>
                    </a>
                    <asp:TextBox ID="txtSearch" name="search" CssClass="txt-search" runat="server" placeholder="Search.."></asp:TextBox>
                </div>

                <div class="middle-header">
                    <asp:Label ID="UserName" runat="server" CssClass="username"></asp:Label>
                </div>

                <div class="right-header">
                    <div class="btn-section">
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn-login" Text="Login" OnClick="btnLogin_Click" />
                    </div>
                    <div class="user-img-section">
                        <asp:Image ID="userImage" runat="server" ImageUrl="" AlternateText="User image" />
                    </div>
                    <!-- User detatails toggle -->
                    <div class="user-details" id="userDetails" runat="server">
                        <div class="user-section">
                            <asp:Image ID="userImage2" runat="server" ImageUrl="" AlternateText="UserImage" />
                            <br />
                            <asp:Label ID="lblUserName" runat="server" Text="User name"></asp:Label>
                        </div>

                        <div class="btn-section">
                            <asp:Button ID="btnProfile" runat="server" Text="Profile" CssClass="profile" />
                            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout" OnClick="btnLogout_Click" />
                        </div>
                    </div>
                </div>

            </div>

            <!-- Menu -->
            <div class="menu">
                <ul>
                    <li><a href="Profile.aspx" target="_blank">My account</a></li>
                    <li><a href="Contact.aspx" target="_blank">Contact</a></li>
                    <li><a href="About.aspx" target="_blank">About</a></li>
                    <li><a href="Product.aspx" target="_blank">Product</a></li>
                    <li><a href="HomePage.aspx">Home</a></li>
                </ul>
            </div>

            <!-- Content -->
            <div class="content">
                
            </div>

        </div>
    </form>

    <script>
        isAuthenticated();
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".user-img-section").click(function () {
                $(".user-details").animate({
                    height: 'toggle'
                });
            });

            $(".content").click(function () {
                $(".user-details").animate({
                    height: 'hide'
                });
            });
        });
    </script>

</body>
</html>

