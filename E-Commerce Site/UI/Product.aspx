<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="E_Commerce_Site.UI.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product</title>
    <%--<link rel="stylesheet" href="../css/product.css" />--%>
    <link href="../css/zoom.css" rel="stylesheet" />
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

        <div class="wrapper">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

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
                        <asp:Image ID="userImage" runat="server" ImageUrl="~/images/error.png" AlternateText="User image" />
                    </div>
                    <!-- User detatails toggle -->
                    <div class="user-details" id="userDetails" runat="server">
                        <div class="user-section">
                            <asp:Image ID="userImage2" runat="server" ImageUrl="~/images/error.png" AlternateText="UserImage" />
                            <br />
                            <asp:Label ID="lblUserName" runat="server" Text="User name"></asp:Label>
                        </div>

                        <div class="btn-section">
                            <asp:Button ID="btnProfile" runat="server" Text="Profile" CssClass="profile" OnClick="btnProfile_Click" />
                            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout" OnClick="btnLogout_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="Profile.aspx" target="_blank">Profile</a></li>
                    <li><a href="Contact.aspx" target="_blank">Contact</a></li>
                    <li><a href="About.aspx" target="_blank">About</a></li>
                    <li><a href="Cart.aspx" target="_blank">Cart</a></li>
                    <li><a href="Product.aspx" target="_blank">Product</a></li>
                    <li><a href="HomePage.aspx">Home</a></li>
                </ul>
            </div>


            <div class="body-content">
                <asp:UpdatePanel ID="up1" runat="server">
                    <ContentTemplate>
                        <asp:Repeater ID="rpProduct" runat="server" OnItemCommand="repeaterButtonClick">
                            <ItemTemplate>
                                <asp:HiddenField ID="hiddenField" runat="server" Value='<%# Eval("Product_ID")%>' />
                                <div class="product-details">
                                    <div class="item">
                                        <img src='<%# Eval("ImageUrl") %>' alt="Product Image" runat="server" />
                                        <div class="item-overlay top">
                                        </div>
                                    </div>

                                    <div class="description">
                                        <p class="pro-name">Product Name: <%# Eval("Product_Name")%></p>
                                        <p class="pro-code">Product Code: <%# Eval("ProductCode")%></p>
                                        <p class="pro-desc">Product Description</p>
                                        <p class="pro-desc2"><%# Eval("Description")%></p>
                                        <p class="pro-price">Price: <%# Eval("Price") %></p>
                                    </div>

                                    <div class="event">
                                        <asp:Button ID="btnCart" CommandName="btnAddToCart" CssClass="btn" runat="server" Text="Add To Cart" />
                                        <a class="btn-view-product" href="Product.aspx?id=<%# Eval("Product_ID")%>" target="_blank">Order</a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>

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

            $(".toggle").click(function () {
                $(".user-details").animate({
                    height: 'hide'
                });
            });
        });
    </script>
</body>
</html>
