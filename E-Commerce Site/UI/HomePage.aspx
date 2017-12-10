<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="E_Commerce_Site.UI.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Buy</title>

    <link rel="stylesheet" href="../css/homePage.css" />
    <link href="../css/cards.css" rel="stylesheet" />

    <script src="../script/jQuery-3.2.1.js"></script>
    <%--<script src="../script/bootstrap.min.js"></script>--%>

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

            <div class="toggle">
                <!-- Menu -->
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

                <!-- Content -->
                <div class="content">
                    <div class="left-panel">
                        <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <ul>
                                    <li class="li-label-e">Electronics</li>
                                    <li>
                                        <hr />
                                    </li>
                                    <li>
                                        <asp:LinkButton Text="Mobile" runat="server" OnClick="LinkButtonClick" /></li>
                                    <li>
                                        <asp:LinkButton Text="Computer" runat="server" OnClick="LinkButtonClick" /></li>
                                    <li>
                                        <asp:LinkButton Text="Laptop" runat="server" OnClick="LinkButtonClick" /></li>
                                    <li>
                                        <asp:LinkButton Text="Tablet" runat="server" OnClick="LinkButtonClick" /></li>
                                    <li>
                                        <asp:LinkButton Text="Television" runat="server" OnClick="LinkButtonClick" /></li>
                                    <li>
                                        <asp:LinkButton Text="Watch" runat="server" OnClick="LinkButtonClick" /></li>

                                    <li class="li-label-v">Vehicles</li>
                                    <li>
                                        <hr />
                                    </li>
                                    <li>
                                        <asp:LinkButton Text="Car" runat="server" OnClick="LinkButtonClick" /></li>
                                    <li>
                                        <asp:LinkButton Text="Bike" runat="server" OnClick="LinkButtonClick" /></li>
                                    <li>
                                        <asp:LinkButton Text="Cycle" runat="server" OnClick="LinkButtonClick" /></li>

                                    <li class="li-label-f">Furnitures</li>
                                    <li>
                                        <hr />
                                    </li>
                                    <li>
                                        <asp:LinkButton Text="Chair" runat="server" OnClick="LinkButtonClick" /></li>
                                    <li>
                                        <asp:LinkButton Text="Dinning Table" runat="server" OnClick="LinkButtonClick" /></li>
                                    <li>
                                        <asp:LinkButton Text="Computer Desk" runat="server" OnClick="LinkButtonClick" /></li>
                                    <li>
                                        <asp:LinkButton Text="Bed" runat="server" OnClick="LinkButtonClick" /></li>

                                </ul>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <div class="right-panel">

                        <div class="slideshow-container">

                            <div class="mySlides fade">
                                <div class="numbertext"></div>
                                <a href="Product.aspx?id=7" target="_blank">
                                    <img runat="server" src="../slider_images/hero_large%20copy.jpg" style="width: 100%; margin-top: -20px" />
                                </a>
                                <div class="text">Apple Watch Series 3</div>
                            </div>

                            <div class="mySlides fade">
                                <div class="numbertext"></div>
                                <a href="Product.aspx?id=1" target="_blank">
                                    <img runat="server" src="../slider_images/Nokia_6.jpg" style="width: 100%; margin-top: -20px" />
                                </a>
                                <div class="text">Nokia 6</div>
                            </div>

                            <div class="mySlides fade">
                                <div class="numbertext"></div>
                                <a href="Product.aspx?id=8" target="_blank">
                                    <img runat="server" src="../slider_images/hero%20honda.jpg" style="width: 100%; margin-top: -50px" />
                                </a>
                                <div class="text">Hero Honda DE789</div>
                            </div>

                            <div class="mySlides fade">
                                <div class="numbertext"></div>
                                <a href="Product.aspx?id=4" target="_blank">
                                    <img runat="server" src="../slider_images/iphone-X.jpg" style="width: 100%" />
                                </a>
                                <div class="text">iPhone X</div>
                            </div>

                            <div class="mySlides fade">
                                <div class="numbertext"></div>
                                <a href="Product.aspx?id=2" target="_blank">
                                    <img runat="server" src="../slider_images/samsung_j5_c.jpg" style="width: 100%" />
                                </a>
                                <div class="text">Samsung Galaxy J5</div>
                            </div>

                            <div class="mySlides fade">
                                <div class="numbertext"></div>
                                <a href="Product.aspx?id=9" target="_blank">
                                    <img runat="server" src="../slider_images/yamaha_fz.jpg" style="width: 100%;" />
                                </a>
                                <div class="text">Yamaha FZ</div>
                            </div>

                            <div class="mySlides fade">
                                <div class="numbertext"></div>
                                <a href="Product.aspx?id=18" target="_blank">
                                    <img runat="server" src="../slider_images/iphone%208.jpg" style="width: 100%; margin-top: -20px" />
                                </a>
                                <div class="text">iPhone 8</div>
                            </div>

                            <div class="mySlides fade">
                                <div class="numbertext"></div>
                                <a href="Product.aspx?id=27" target="_blank">
                                    <img runat="server" src="../slider_images/ferrari.jpg" style="width: 100%; margin-top: -10px;" />
                                </a>
                                <div class="text">Ferrari F40</div>
                            </div>

                            <div class="mySlides fade">
                                <div class="numbertext"></div>
                                <a href="Product.aspx?id=6" target="_blank">
                                    <img runat="server" src="../slider_images/macbook.jpg" style="width: 100%" />
                                </a>
                                <div class="text">Apple Macbook Air 3</div>
                            </div>

                            <div class="mySlides fade">
                                <div class="numbertext"></div>
                                <a href="Product.aspx?id=3" target="_blank">
                                    <img runat="server" src="../slider_images/note%204.jpg" style="width: 100%; margin-top: -20px" />
                                </a>
                                <div class="text">Samsung Galaxy Note 4</div>
                            </div>

                            <div class="mySlides fade">
                                <div class="numbertext"></div>
                                <a href="Product.aspx?id=11" target="_blank">
                                    <img runat="server" src="../slider_images/computer_desk.png" style="width: 100%; margin-top: -20px" />
                                </a>
                                <div class="text">Computer Desk</div>
                            </div>

                            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                            <a class="next" onclick="plusSlides(1)">&#10095;</a>

                        </div>

                        <br />

                        <div style="text-align: center">
                            <span class="dot" onclick="currentSlide(1)"></span>
                            <span class="dot" onclick="currentSlide(2)"></span>
                            <span class="dot" onclick="currentSlide(3)"></span>
                            <span class="dot" onclick="currentSlide(4)"></span>
                            <span class="dot" onclick="currentSlide(5)"></span>
                        </div>

                        <div class="body-content">
                            <asp:UpdatePanel ID="up2" runat="server">
                                <ContentTemplate>
                                    <asp:Repeater ID="rpProduct" runat="server" OnItemCommand="repeaterButtonClick">
                                        <ItemTemplate>
                                            <div class="col-md-3 card">
                                                <asp:HiddenField ID="hiddenField" runat="server" Value='<%# Eval("Product_ID")%>' />
                                                <div class="link">
                                                    <div class="middle">
                                                        <asp:Image ID="img" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' />
                                                    </div>

                                                    <div class="overlay">
                                                    </div>

                                                    <a href="Product.aspx?id=<%# Eval("Product_ID")%>" target="_blank">View Product</a>
                                                </div>

                                                <div class="title">
                                                    <asp:Label ID="lblName" runat="server"><%# Eval("Product_Name") %></asp:Label>
                                                </div>

                                                <div class="info">
                                                    <div class="desc">
                                                        <asp:Label ID="lblDesc" runat="server"><%# Eval("Description") %></asp:Label>
                                                    </div>

                                                    <div class="price-tag">
                                                        <asp:Label ID="lblPrice" runat="server">Price: <%# Eval("Price") %></asp:Label>
                                                    </div>
                                                </div>

                                                <div class="event-section">
                                                    <asp:Button ID="btnCart" CommandName="btnAddToCart" CssClass="btn" runat="server" Text="Add To Cart" />
                                                    <a class="btn-view-product" href="Product.aspx?id=<%# Eval("Product_ID")%>" target="_blank">View Product</a>
                                                </div>

                                                <asp:Label ID="lblCart" CssClass="cart" runat="server">
                                                    Added to cart
                                                </asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>

                        <div class="footer">
                            <div class="f-left">
                                <p>Contact With Us</p>
                                <ul>
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact</a></li>
                                    <li><a href="#">Terms and conditions</a></li>
                                    <li><a href="#">Privacy</a></li>
                                </ul>
                            </div>

                            <div class="f-middle">
                                <p>Social Link</p>
                                <ul>
                                    <li><a href="#">Facebook</a></li>
                                    <li><a href="#">LinkedIn</a></li>
                                    <li><a href="#">Gmail</a></li>
                                    <li><a href="#">Youtube</a></li>
                                </ul>
                            </div>

                            <div class="f-right">
                                <p>Our partners</p>
                                <ul>
                                    <li><a href="#">Samsung</a></li>
                                    <li><a href="#">Nokia</a></li>
                                    <li><a href="#">Apple</a></li>
                                    <li><a href="#">Yamaha</a></li>
                                    <li><a href="#">TATA</a></li>
                                    <li><a href="#">Otobi</a></li>
                                    <li><a href="#">Rolex</a></li>
                                    <li><a href="#">Sony</a></li>
                                </ul>
                            </div>

                            <div class="copyright">
                                <p>This project is designed and developed by <a href="https://www.github.com/78526Nasir" target="_blank">Nasir Islam Sujan</a> &copy; 2017</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content end here -->
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

    <script type="text/javascript">
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) {slideIndex = 1}    
            if (n < 1) {slideIndex = slides.length}
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";  
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block";  
            dots[slideIndex-1].className += " active";
        }

        //var slideIndex = 0;
        //showSlides();

        //function showSlides() {
        //    var i;
        //    var slides = document.getElementsByClassName("mySlides");
        //    for (i = 0; i < slides.length; i++) {
        //        slides[i].style.display = "none"; 
        //    }
        //    slideIndex++;
        //    if (slideIndex > slides.length) {slideIndex = 1} 
        //    slides[slideIndex-1].style.display = "block"; 
        //    setTimeout(showSlides, 5000); 
        //}
    </script>
</body>
</html>


