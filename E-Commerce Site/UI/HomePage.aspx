<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="E_Commerce_Site.UI.HomePage" MasterPageFile="~/UI/Index.Master" %>

<asp:Content ID="homePageSearchBar" ContentPlaceHolderID="cphMiddle" runat="server">
    <asp:TextBox ID="txtSearch" name="search" CssClass="txt-search" runat="server" placeholder="Search.."></asp:TextBox>
</asp:Content>

<asp:Content ID="homePageBodyContent" ContentPlaceHolderID="cphBody" runat="server">

    <div class="left-panel">

        <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <ul>
                    <li class="li-label-e">Electronics</li>
                    <li><hr /></li>
                    <li><asp:LinkButton Text="Mobile" runat="server" OnClick="LinkButtonClick" /></li>
                    <li><asp:LinkButton Text="Computer" runat="server" OnClick="LinkButtonClick" /></li>
                    <li><asp:LinkButton Text="Laptop" runat="server" OnClick="LinkButtonClick" /></li>
                    <li><asp:LinkButton Text="Tablet" runat="server" OnClick="LinkButtonClick" /></li>
                    <li><asp:LinkButton Text="Television" runat="server" OnClick="LinkButtonClick" /></li>
                    <li><asp:LinkButton Text="Watch" runat="server" OnClick="LinkButtonClick" /></li>
                    <li class="li-label-v">Vehicles</li>
                    <li><hr /></li>
                    <li><asp:LinkButton Text="Car" runat="server" OnClick="LinkButtonClick" /></li>
                    <li><asp:LinkButton Text="Bike" runat="server" OnClick="LinkButtonClick" /></li>
                    <li><asp:LinkButton Text="Cycle" runat="server" OnClick="LinkButtonClick" /></li>
                    <li class="li-label-f">Furnitures</li>
                    <li><hr /></li>
                    <li><asp:LinkButton Text="Chair" runat="server" OnClick="LinkButtonClick" /></li>
                    <li><asp:LinkButton Text="Dinning Table" runat="server" OnClick="LinkButtonClick" /></li>
                    <li><asp:LinkButton Text="Computer Desk" runat="server" OnClick="LinkButtonClick" /></li>
                    <li><asp:LinkButton Text="Bed" runat="server" OnClick="LinkButtonClick" /></li>
                </ul>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div class="right-panel">

        <!-- Image Slideshow -->
        <div class="slideshow-container">

            <div class="mySlides fade">
                <div class="numbertext"></div>
                <a href="Product.aspx?id=4" target="_blank">
                    <img runat="server" src="../slider_images/iphone-X.jpg" style="width: 100%" />
                </a>
                <div class="text">iPhone X</div>
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
                <a href="Product.aspx?id=7" target="_blank">
                    <img runat="server" src="../slider_images/hero_large%20copy.jpg" style="width: 100%; margin-top: -20px" />
                </a>
                <div class="text">Apple Watch Series 3</div>
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

        <!-- Redering all products from database -->
        <div class="body-content">
            <asp:UpdatePanel ID="up2" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="rpProduct" runat="server" OnItemDataBound="repeaterItemDataBound" OnItemCommand="repeaterButtonClick">
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
                <p>Partners</p>
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

            <div class="f-right-most">
                <p>Other Partners</p>
                <ul>
                    <li><a href="#">Ferrari</a></li>
                    <li><a href="#">Hero Honda</a></li>
                    <li><a href="#">LG</a></li>
                    <li><a href="#">Omega</a></li>
                    <li><a href="#">Dell</a></li>
                    <li><a href="#">hp</a></li>
                    <li><a href="#">Pacific Cycle</a></li>
                </ul>
            </div>

            <div class="copyright">
                <p>This project is designed and developed by <a href="https://www.github.com/78526Nasir" target="_blank">Nasir Islam Sujan</a> &copy; 2017</p>
            </div>
        </div>
    </div>

</asp:Content>

