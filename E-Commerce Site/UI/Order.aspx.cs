using BusinessAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Site.UI
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserWholeRecord"] != null)
                {
                    if (Request.QueryString["id"] != null)
                    {
                        string productID = Request.QueryString["id"].ToString();
                        GetProductsByProdctId(Convert.ToInt32(productID));
                    }
                    else
                    {
                        Panel p = OrderBody;
                        p.Style.Add("display", "none");

                        p = pCPOD;
                        p.Style.Add("display", "none");

                        lblMessage.Text = "You do not select any product for Order!";
                    }
                }
                else
                {
                    Panel p = OrderBody;
                    p.Style.Add("display", "none");

                    p = pCPOD;
                    p.Style.Add("display", "none");

                    lblMessage.Text = "You do not select any product for Order!";
                }
            }
        }

        private void GetProductsByProdctId(int productId)
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            DataTable dt = ecb.GetProductsByProductID(productId);

            if (dt.Rows.Count > 0)
            {
                lblProductName.Text = dt.Rows[0]["Product_Name"].ToString();
                lblProductCode.Text = dt.Rows[0]["ProductCode"].ToString();
                Session["price"] = Convert.ToInt32(dt.Rows[0]["Price"].ToString());
                lblTotalPrice.Text = Session["price"].ToString();

                DataTable userDt = (DataTable)Session["UserWholeRecord"];
                txtCustomerName.Text = userDt.Rows[0]["fullname"].ToString();

                int quantity = Convert.ToInt32(dt.Rows[0]["Quantity"].ToString());

                InitializeDropDownList(quantity);
            }

        }

        private void InitializeDropDownList(int q)
        {
            for (int i = 0; i < q; i++)
            {
                ddlProductQuantity.Items.Add(new ListItem { Text = (i + 1).ToString(), Value = (i + 1).ToString() });
            }
        }

        protected void ddlProductQuantity_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProductQuantity.SelectedIndex == -1)
            {
                lblTotalPrice.Text = Session["price"].ToString();
            }
            else
            {
                int multiplies = ddlProductQuantity.SelectedIndex;
                lblTotalPrice.Text = (Convert.ToInt32(Session["price"]) * multiplies).ToString();
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            DataTable userDt = (DataTable)Session["UserWholeRecord"];
            int customerID = Convert.ToInt32(userDt.Rows[0]["user_id"]);

            CustomerOrderDetails cod = new CustomerOrderDetails
            {
                CustomerID = customerID,
                ProductID = Convert.ToInt32(Request.QueryString["id"].ToString()),
                Address = txtAddress.InnerText,
                PhoneNumber = txtPhoneNumber.Text,
                Quantity = ddlProductQuantity.SelectedValue.Equals("-1") ? 1 : ddlProductQuantity.SelectedIndex,
                TotalPrice = Convert.ToDouble(lblTotalPrice.Text)
            };

            ECommerceBusiness ecb = new ECommerceBusiness
            {
                CODObj = cod
            };

            ecb.AddNewCustomerOrderDetails();

            Panel panel = OrderBody;
            panel.Style.Add("display", "none");

            panel = pCPOD;
            panel.Style.Add("display", "none");

            lblMessage.Text = "Your order will be placed within 24 hours!";
            lblMessage.Style.Add("display", "block");
        }
    }
}