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
        static string connectionString = ConfigurationManager.ConnectionStrings["ECDB"].ConnectionString;
        public static SqlConnection connectDB()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            return con;
        }

        public static Boolean insert(string username, string fullName, string email, string dob, int age, string religion, string password, string gender)
        {
            using (SqlConnection con = connectDB())
            {
                string insert_query = "INSERT INTO [USER] VALUES(@username, @fullName, @email, @dob, @age, @religion,@password, @gender)";
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

        public static Boolean select(string username, string password)
        {
            using (SqlConnection con = connectDB())
            {
                string select_query = "SELECT * FROM [USER] WHERE username=@username AND password=@password";
                SqlCommand cmd = new SqlCommand(select_query, con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        /// <summary>
        /// Generic method for creating SqlParameter
        /// </summary>
        /// <param name="parameterName"></param>
        /// <param name="value"></param>
        /// <returns>return SqlParameter object</returns>

        public static SqlParameter addParameter(string parameterName, object value)
        {
            SqlParameter parameter = new SqlParameter(parameterName, value);
            return parameter;
        }

        /// <summary>
        /// Generic method for execute any store procedure
        /// whether the sp for insert, update , select or delete
        /// it will work genericlly for all type of store procedure
        /// </summary>
        /// <param name="procedureName"></param>
        /// <param name="parameters"></param>
        /// <returns>return DataTable object</returns>
        public static DataTable executeDTByProcedure(string procedureName, SqlParameter[] parameters)
        {
            using (SqlConnection con = connectDB())
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = procedureName;
                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters);
                }
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
    }
}
