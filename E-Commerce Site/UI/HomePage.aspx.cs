using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;
using System.Data;
using System.Web.UI.HtmlControls;

namespace E_Commerce_Site.UI
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                if (!IsPostBack)
                {
                    DataTable dt = (DataTable)Session["UserWholeRecord"];
                    int userID =Convert.ToInt32(dt.Rows[0]["user_id"].ToString());

                    CartedList(userID);
                    GetProducts("all");
                }
            }else
            {
                if (!IsPostBack)
                {
                    CartedList(-1);
                    GetProducts("all");
                }
            }

        }

        private void CartedList(int userID)
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            Application["CartList"] = ecb.SelectAllCartedProduct(userID);
        }
        private void GetProducts(string category)
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            DataTable dt;

            if (category.Equals("all"))
            {
                dt = ecb.GetAllProducts();
            }
            else
            {
                dt = ecb.GetProducts(category);
            }

            if (dt.Rows.Count > 0)
            {
                rpProduct.DataSource = dt;
                rpProduct.DataBind();
                //up1.Update();
            }

        }

        protected void LinkButtonClick(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string categoryName = btn.Text;
            GetProducts(categoryName);
        }


        protected void repeaterItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (Session["UserWholeRecord"] != null)
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hf = (HiddenField)e.Item.FindControl("hiddenField");
                    string productID = hf.Value;

                    IsCartedProduct(e, productID);
                }
            }
        }

        private void IsCartedProduct(RepeaterItemEventArgs e, string productID)
        {
            DataTable dt = (DataTable)Application["CartList"];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["Product_ID"].ToString().Equals(productID))
                {
                    Label cart = (Label)e.Item.FindControl("lblCart");
                    cart.Style.Add("visibility", "visible");
                    Button btn = (Button)e.Item.FindControl("btnCart");
                    btn.Text = "Added to cart";
                    btn.Style.Add("background", "#ccc");
                    btn.Style.Add("border", "none");
                    btn.Style.Add("color", "#666");
                    btn.Style.Add("cursor", "default");
                    btn.Style.Add("box-shadow", "none");
                    btn.Enabled = false;
                }
            }

        }
        protected void repeaterButtonClick(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("btnAddToCart"))
            {
                if (Session["UserWholeRecord"] != null)
                {
                    DisableButton(e);

                    HiddenField hf = (HiddenField)e.Item.FindControl("hiddenField");
                    string productID = hf.Value;

                    AddToCart(productID);
                }
                else
                {
                    Response.Redirect("UserLogin.aspx");
                }
            }
            else
            {
                DisableButton(e);
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

        public void DisableButton(RepeaterCommandEventArgs e)
        {
            Label cart = (Label)e.Item.FindControl("lblCart");
            cart.Style.Add("visibility", "visible");
            Button btn = (Button)e.Item.FindControl("btnCart");
            btn.Text = "Added to cart";
            btn.Style.Add("background", "#ccc");
            btn.Style.Add("border", "none");
            btn.Style.Add("color", "#666");
            btn.Style.Add("cursor", "default");
            btn.Style.Add("box-shadow", "none");
            btn.Enabled = false;
        }
    }
}
