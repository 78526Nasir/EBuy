using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;
using System.Data;

namespace E_Commerce_Site.admin
{
    public partial class NewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllCategories();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }

        private void getAllCategories()
        {
            ECommerceBusiness ecb = new ECommerceBusiness();
            DataTable dt = ecb.getAllCategories();
            if (dt.Rows.Count > 0)
            {
                ListItem item = new ListItem("Select Category", "-1");
                ddlProductCategory.DataSource = dt;
                ddlProductCategory.DataBind();
                ddlProductCategory.Items.Insert(0, item);
            }
        }

        
    }
}