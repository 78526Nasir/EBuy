<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="E_Commerce_Site.UI.Cart" MasterPageFile="~/UI/Index.Master" %>

<asp:Content ID="cartMiddle" runat="server" ContentPlaceHolderID="cphMiddle">
    <p class="p-title c-title">Carted Products</p>
</asp:Content>

<asp:Content ID="cartBody" runat="server" ContentPlaceHolderID="cphBody">
    <asp:UpdatePanel ID="upCartedProducts" runat="server">
        <ContentTemplate>
            <div class="c-p-container">
                <div class="c-p-body">
                    <asp:Repeater ID="rpCartedProduct" runat="server" OnItemCommand="repeaterItemCommand">
                        <ItemTemplate>
                            <div class="col-md-3 card c-p-card">
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

                                <div class="event-section c-p-event-section">
                                    <asp:Button ID="btnViewProduct" CommandName="ViewProduct" CssClass="c-p-btn btn-view" runat="server" Text="View Product" />
                                    <asp:Button ID="btnRemoveFromCart" CommandName="RemoveFromCart" CssClass="c-p-btn c-p-btn-remove" runat="server" Text="Remove From Cart" />
                                    <asp:Button ID="btnOrderProduct" CommandName="OrderProduct" CssClass="c-p-btn btn-full" runat="server" Text="Order" />
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="cart-message-container">
                        <asp:Label ID="lblMessage" CssClass="cart-label" runat="server"></asp:Label>
                    </div>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
