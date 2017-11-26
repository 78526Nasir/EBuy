using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Site.admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        public int flag;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["AdminSession"] != null)
                {
                    imgAdmin.ImageUrl = Session["Image"].ToString();
                    adminNameLink.InnerText = Session["Fullname"].ToString();
                    flag = 0;
                }
                else
                {
                    flag = 1;
                    Response.Redirect("~/admin/Login.aspx");
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/admin/Login.aspx");
        }
    }
}