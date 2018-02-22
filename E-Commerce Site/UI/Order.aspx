<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="E_Commerce_Site.UI.Order" MasterPageFile="~/UI/Index.Master" %>

<asp:Content ID="orderMiddle" runat="server" ContentPlaceHolderID="cphMiddle">
    <p class="p-title o-title">Ordered Product</p>
</asp:Content>

<asp:Content ID="orderBody" runat="server" ContentPlaceHolderID="cphBody">
    <asp:UpdatePanel ID="upOrderProduct" runat="server">
        <ContentTemplate>
            <asp:Panel ID="OrderBody" runat="server">
                <div class="order-body-container">
                    <div id="orderProductList" runat="server">
                        <asp:Repeater ID="ListedProduct" runat="server" OnItemCommand="repeaterItemCommand">
                            <ItemTemplate>
                                <div class="col-md-3 card c-p-card list-of-order" style="margin: 0px;">
                                    <asp:HiddenField ID="hiddenField" runat="server" Value='<%# Eval("Product_ID")%>' />
                                    <asp:HiddenField ID="hfGUID" runat="server" Value='<%# Eval("GUID")%>' />

                                    <div class="link">
                                        <div class="middle">
                                            <asp:Image ID="img" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' />
                                        </div>

                                        <div class="overlay">
                                        </div>

                                        <a href="Product.aspx?id=<%# Eval("GUID")%>" target="_blank">View Product</a>
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
                                        <asp:Button ID="btnCancelOrderProduct" CommandName="CancelOrder" CssClass="c-p-btn btn-full btn-cancel" runat="server" Text="Cancel Order" />
                                    </div>
                                </div>

                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <div class="o-p-details">
                        <table class="table1">
                            <tr>
                                <td>
                                    <label class="order-label1">Product Code</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblProductCode" runat="server" CssClass="order-label2">Product Code</asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label class="order-label1">Product Name</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblProductName" runat="server" CssClass="order-label2">Product Name</asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label class="order-label1">Order Quntity</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlProductQuantity" AutoPostBack="true" runat="server" CssClass="ddl-p-q" OnSelectedIndexChanged="ddlProductQuantity_SelectedIndexChanged">
                                        <asp:ListItem Text="Select Order Quantity" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label class="order-label1">Total Price</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblTotalPrice" runat="server" CssClass="order-label2 bold"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="upCheckOut" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pCPOD" runat="server">
                <div class="checkout">
                    <p class="cpod-title">Customer Product Order Details</p>
                    <table class="table2">
                        <tr>
                            <td>
                                <asp:Label ID="lblCustomerName" runat="server" CssClass="o-c-label">Customer Name</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCustomerName" runat="server" Enabled="false" CssClass="o-c-textbox disable"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblAddress" runat="server" CssClass="o-c-label">Customer Address</asp:Label>
                            </td>
                            <td>
                                <textarea id="txtAddress" runat="server" placeholder="Enter your current address" class="o-textarea"></textarea>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblPhoneNumber" runat="server" CssClass="o-c-label">Phone Number</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPhoneNumber" TextMode="Number" placeholder="Enter phone number" runat="server" CssClass="o-c-textbox"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblPaymentMethod" runat="server" CssClass="o-c-label">Payment Method</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="o-ddl-pm">
                                    <asp:ListItem Text="Choose a payment method" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="Cash on delivary" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Payment Gateway" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>

                    <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn-p-o" OnClick="btnPlaceOrder_Click" />
                </div>
            </asp:Panel>

            <div class="cart-message-container o-m-c">
                <asp:Label ID="lblMessage" CssClass="cart-label" runat="server"></asp:Label>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
