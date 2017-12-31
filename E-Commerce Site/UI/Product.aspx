<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="E_Commerce_Site.UI.Product" MasterPageFile="~/UI/Index.Master" %>

<asp:Content ID="middleContent" runat="server" ContentPlaceHolderID="cphMiddle">
    <p class="p-title">Product</p>
</asp:Content>


<asp:Content ID="bodyContent" runat="server" ContentPlaceHolderID="cphBody">
    <div class="p-body-content">
        <asp:UpdatePanel ID="up1" runat="server">
            <ContentTemplate>
                <asp:Repeater ID="rpProduct" runat="server"  OnItemDataBound="repeaterItemDataBound" OnItemCommand="repeaterButtonClick">
                    <ItemTemplate>
                        <asp:HiddenField ID="hiddenField" runat="server" Value='<%# Eval("Product_ID")%>' />
                        <div class="product-details">
                            <div class="item">
                                <img id="ProductImage" src='<%# Eval("ImageUrl") %>' alt="Product Image" runat="server" />
                                <div class="item-overlay top">
                                </div>
                            </div>

                            <div class="right-side">
                                <div class="description">
                                    <p class="pro-name">Product Name: <%# Eval("Product_Name")%></p>
                                    <p class="pro-code">Product Code: <%# Eval("ProductCode")%></p>
                                    <p class="pro-desc">Product Description</p>
                                    <p class="pro-desc2"><%# Eval("Description")%></p>
                                    <p class="pro-price">Price: <%# Eval("Price") %></p>
                                </div>

                                <div class="event">
                                    <asp:Button ID="btnOrderProduct" CommandName="OrderProduct" CssClass="btn btn-order" Text="Order" runat="server" />
                                    <asp:Button ID="btnCart" CommandName="btnAddToCart" CssClass="btn btn-cart" runat="server" Text="Add To Cart" />
                                    <asp:Button ID="btnRemoveFromCart" CommandName="btnRemove" CssClass="btn btn-remove" runat="server" Text="Remove From Cart" />
                                </div>

                                <div id="footerDiv" runat="server" class="p-footer">
                                    <asp:Label ID="lblCart" CssClass="p-cart" runat="server">
                                                        Carted Product
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
