using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace DataAccessLayer
{
    public class DataAccess
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ECDB"].ConnectionString;
        public SqlConnection connectDB()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                return con;
            }
        }
        public Boolean insert(string username, string fullName, string email, string dob, int age, string religion, string password, string gender)
        {
            using (SqlConnection con = connectDB())
            {
                string insert_query = "INSERT INTO USER VALUES(@username, @fullName, @email, @dob, @age, @religion,@password, @gender)";
                SqlCommand cmd = new SqlCommand(insert_query, con);

                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@fullName", fullName);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@dob", dob);
                cmd.Parameters.AddWithValue("@age", age);
                cmd.Parameters.AddWithValue("@religion", religion);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@gender", gender);
                
                cmd.ExecuteNonQuery();

                return true;

            }


        }

        public Boolean select(string username, string password)
        {
            using(SqlConnection con = connectDB())
            {
                string select_query = "SELECT * FROM USER WHERE username=@username AND password=@password";
                SqlCommand cmd = new SqlCommand(select_query, con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    return true;
                }else
                {
                    return false;
                }
                    
            }
            
        }
    }
}
