<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="E_Commerce_Site.UI.Product" MasterPageFile="~/UI/Index.Master" %>

<asp:Content ID="middleContent" runat="server" ContentPlaceHolderID="cphMiddle">
    <p class="p-title">Product</p>
</asp:Content>


<asp:Content ID="bodyContent" runat="server" ContentPlaceHolderID="cphBody">
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

</asp:Content>


<%--<!DOCTYPE html>

    <form id="form1" runat="server">

        <div class="wrapper">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

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

</body>
</html>--%>
