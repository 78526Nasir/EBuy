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
    public partial class Partnership : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            /*
             * check whether user fill all the required filed or not 
             * server-site validation
            */
            if (IsValid)
            {
                Company company = new Company
                {
                    CompanyName = txtCompanyName.Text,
                    CompanyDescription = taCompanyDescription.InnerText,
                    PartnershipDate = txtDOB.Value
                };

                ECommerceBusiness ecb = new ECommerceBusiness
                {
                    CompanyObj = company
                };

                ecb.addNewCompany();
                resetForm();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Confirmation", "alert('Successfully added a new patnered company into database')", true);
            }
        }

        private void resetForm()
        {
            txtCompanyName.Text = string.Empty;
            taCompanyDescription.InnerText = string.Empty;
            txtDOB.Value = string.Empty;
        }
    }
}