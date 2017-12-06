using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                    userImage.ImageUrl = Session["UserImage"].ToString();
                    userImage2.ImageUrl = Session["UserImage"].ToString();
                }
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
    }
}
