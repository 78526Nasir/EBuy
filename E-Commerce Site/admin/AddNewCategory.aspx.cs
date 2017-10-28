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

        /// <summary>
        /// Intialize Category and ECommerceBusiness object dynamically at runtime;
        /// Avoid using constructor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void addButtonClickPerformed(object sender, EventArgs e)
        {
            /*
             * check whether user fill all the required filed or not 
             * server-site validation
            */
            if (IsValid)
            {
                Category category = new Category
                {
                    CategoryName = txtCategoryName.Text,
                    CategoryDescription = taDescription.InnerText,
                };

                ECommerceBusiness ecb = new ECommerceBusiness
                {
                    CategoryObj = category
                };
                
                ecb.addNewCategory();
                resetForm();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Confirmation", "alert('Successfully added a new category into database')", true);
            }
        }

        private void resetForm()
        {
            txtCategoryName.Text = string.Empty;
            taDescription.InnerText = string.Empty;
        }
    }
}


/*

<script type="text/javascript">
     function myFunction() {
         //some code here
         alert('Function called successfully!');
     }
</script>



protected void btnServerSide_Click(object sender, EventArgs e)
{
    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "myFunction();", true);            
} 
*/
