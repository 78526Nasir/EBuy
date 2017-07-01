using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace E_Commerce_Site
{
    public partial class Login : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ECDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void LoginButtonClickPerformed(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql_query = "Select * from Account where username=@un and password=@pw";

                SqlCommand command = new SqlCommand(sql_query, connection);
                connection.Open();
                command.Parameters.AddWithValue("@un", txtUsername.Text);
                command.Parameters.AddWithValue("@pw", txtPassword.Text);

                SqlDataReader dataReader=command.ExecuteReader();
                if (dataReader.Read())
                {
                    Response.Redirect("~/index.aspx");
                }else
                {
                    lblStatus.Text = "Username or password not matched !";
                    
                }

            }
        }
    }
}