using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce_Site.Libraries;

namespace E_Commerce_Site
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void registerButtonClickPerformed(object sender, EventArgs e)
        {
            Response.Redirect("~/UserLogin.aspx");
        }
 
    }
}