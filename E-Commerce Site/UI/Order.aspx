<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="E_Commerce_Site.UI.Order" MasterPageFile="~/UI/Index.Master" %>

<asp:Content ID="orderMiddle" runat="server" ContentPlaceHolderID="cphMiddle">
    <p class="p-title o-title">Ordered Product</p>
</asp:Content>

<asp:Content ID="orderBody" runat="server" ContentPlaceHolderID="cphBody">
    <asp:UpdatePanel ID="upOrderProduct" runat="server">
        <ContentTemplate>
            <asp:Panel ID="OrderBody" runat="server">
                <div class="order-body-container">
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

</asp:Content>
