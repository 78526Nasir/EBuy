using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Site.admin
{
    public partial class Profile : System.Web.UI.Page
    {
        public int flag;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["AdminSession"] != null)
                {
                    txtUsername.Text = Session["Username"].ToString();
                    txtFullName.Text = Session["Fullname"].ToString();
                    txtPassword.Text = Session["Password"].ToString();
                    lblAdminName.Text = Session["Fullname"].ToString();
                    imgAdmin.ImageUrl = Session["Image"].ToString();
                    flag = 0;
                }
                else
                {
                    flag = 1;
                    Response.Redirect("~/admin/Login.aspx");
                }
            }
        }
    }
}