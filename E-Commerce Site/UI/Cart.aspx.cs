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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserWholeRecord"] != null)
                {
                    DataTable dt = (DataTable)Session["UserWholeRecord"];
                    int userID = Convert.ToInt32(dt.Rows[0]["user_id"].ToString());
                    GetCartedProducts(userID);
                }
                else
                {
                    lblMessage.Text = "You do not cart any product yet!";
                }
            }
        }

        private void GetCartedProducts(int userID)
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            DataTable dt = ecb.GetAllCartedProducts(userID);

            if (dt.Rows.Count > 0)
            {
                rpCartedProduct.DataSource = dt;
                rpCartedProduct.DataBind();

            }else
            {
                rpCartedProduct.DataSource = dt;
                rpCartedProduct.DataBind();
                lblMessage.Text = "You do not have any carted product!";
            }
        }

        protected void repeaterItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("RemoveFromCart"))
            {
                HiddenField hf = (HiddenField)e.Item.FindControl("hiddenField");
                int productID = Convert.ToInt32(hf.Value);

                ECommerceBusiness ecb = new ECommerceBusiness();
                DataTable dt = (DataTable)Session["UserWholeRecord"];

                int userID = Convert.ToInt32(dt.Rows[0]["user_id"].ToString());

                ecb.DeleteCartedProduct(productID, userID);
                GetCartedProducts(userID);

            }
            else if (e.CommandName.Equals("ViewProduct"))
            {
                HiddenField hf = (HiddenField)e.Item.FindControl("hiddenField");
                string productID = hf.Value;

                Response.Redirect("Product.aspx?id=" + productID);

            }else if (e.CommandName.Equals("OrderProduct"))
            {
                HiddenField hf = (HiddenField)e.Item.FindControl("hiddenField");
                string productID = hf.Value;

                Response.Redirect("Order.aspx?id=" + productID);
            }
        }

        private void AddToCart(string productID)
        {
            DataTable dt = (DataTable)Session["UserWholeRecord"];

            BusinessAccessLayer.Cart cart = new BusinessAccessLayer.Cart
            {
                ProductID = Convert.ToInt32(productID),
                UserID = Convert.ToInt32(dt.Rows[0]["user_id"].ToString())
            };

            ECommerceBusiness ecb = new ECommerceBusiness
            {
                CartObj = cart
            };

            ecb.AddToCart();
        }
    }
}