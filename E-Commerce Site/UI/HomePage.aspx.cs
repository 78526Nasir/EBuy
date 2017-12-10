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
        public int flag = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                flag = 0;
            }

            if (Session["User"] != null)
            {
                if (!IsPostBack)
                {
                    UserName.Text = Session["User"].ToString();
                    lblUserName.Text = Session["User"].ToString();

                    if (!string.IsNullOrEmpty(Session["UserImage"].ToString()))
                    {
                        userImage.ImageUrl = Session["UserImage"].ToString();
                        userImage2.ImageUrl = Session["UserImage"].ToString();
                    }
                }
            }

            if (!IsPostBack)
            {
                GetProducts("all");
            }

        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("HomePage.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        //protected void txtSearch_TextChanged(object sender, EventArgs e)
        //{
        //    Response.Write("<script>alert(" + txtSearch.Text + ")</script>");
        //}


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

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void LinkButtonClick(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string categoryName = btn.Text;
            GetProducts(categoryName);
        }

        protected void repeaterButtonClick(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("btnAddToCart"))
            {
                if (Session["UserWholeRecord"] != null)
                {
                    Label cart = (Label)e.Item.FindControl("lblCart");
                    cart.Style.Add("visibility", "visible");
                    Button btn = (Button)e.Item.FindControl("btnCart");
                    btn.Text = "Added to cart";
                    btn.Style.Add("background", "#ccc");
                    btn.Style.Add("border", "none");
                    btn.Style.Add("color", "#666");
                    btn.Style.Add("cursor", "default");
                    btn.Enabled = false;

                    HiddenField hf = (HiddenField)e.Item.FindControl("hiddenField");
                    string productID = hf.Value;

                    AddToCart(productID);

                }else
                {
                    Response.Redirect("UserLogin.aspx");
                }
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
                CartObj=cart                    
            };

            ecb.AddToCart();

        }
    }
}
