using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;

namespace E_Commerce_Site.admin
{
    public partial class AddNewCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void addButtonClickPerformed(object sender, EventArgs e)
        {
            ECommerceBusiness ecb = new ECommerceBusiness
            {
                categoryName = txtCategoryName.Text,
                categoryDescription = taDescription.InnerText
            };

            ecb.addNewCategory();
            txtCategoryName.Text = string.Empty;
            taDescription.InnerText = string.Empty;
        }
    }
}