<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="E_Commerce_Site.UI.Cart" MasterPageFile="~/UI/Index.Master" %>

<asp:Content ID="cartMiddle" runat="server" ContentPlaceHolderID="cphMiddle">
    <p class="p-title c-title">Carted Products</p>
</asp:Content>

<asp:Content ID="cartBody" runat="server" ContentPlaceHolderID="cphBody">

    <div class="c-p-container">
        <%--OnItemDataBound="repeaterItemDataBound" OnItemCommand="repeaterItemCommand"--%>
        <div class="c-p-body">
            <asp:Repeater ID="rpCartedProduct" runat="server">
                <ItemTemplate>
                    <div class="col-md-3 card c-p-card first">
                        <asp:HiddenField ID="hiddenField" runat="server" Value='<%# Eval("Product_ID")%>' />
                        <div class="c-p-link">
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

                        <div class="c-p-info">
                            <div class="desc">
                                <asp:Label ID="lblDesc" runat="server"><%# Eval("Description") %></asp:Label>
                            </div>

                            <div class="c-p-price-tag">
                                <asp:Label ID="lblPrice" runat="server">Price: <%# Eval("Price") %></asp:Label>
                            </div>
                        </div>

                        <div class="c-p-event-section">
                            <asp:Button ID="btnRemoveFromCart" CommandName="RemoveCart" CssClass="c-p-btn" runat="server" Text="Remove From Cart" />
                            <asp:Button ID="btnAddToCart" CommandName="AddToCart" CssClass="c-p-btn" runat="server" Text="Add To Cart" />
                            <a class="c-p-btn-view-product" href="Product.aspx?id=<%# Eval("Product_ID")%>" target="_blank">View Product</a>
                        </div>

                        <asp:Label ID="lblCart" CssClass="cart" runat="server">
                                                        Added to cart
                        </asp:Label>
                    </div>

                </ItemTemplate>
            </asp:Repeater>

            <div class="cart-message-container">
                <asp:Label ID="lblMessage" CssClass="cart-label" runat="server"></asp:Label>
            </div>

        </div>
    </div>
</asp:Content>
