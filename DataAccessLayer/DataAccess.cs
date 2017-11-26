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
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                return con;
            }
            catch(Exception ex)
            {
                return new SqlConnection();
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
                DataTable dt = new DataTable();

                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }catch(Exception e)
                {
                    return null;
                }

                return dt;
            }
        }
    }
}
