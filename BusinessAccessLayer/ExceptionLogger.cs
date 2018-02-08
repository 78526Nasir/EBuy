using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using System.Data.SqlClient;

namespace BusinessAccessLayer
{
    public class ExceptionLogger
    {

        /// <summary>
        /// Logging the Exception into a StringBuilder object.
        /// And then call the LogToDataBase. 
        /// </summary>
        /// <param name="exception">the actual exception</param>
        public static void Log(Exception exception)
        {
            StringBuilder sbExceptionMessage = new StringBuilder();
            do
            {
                sbExceptionMessage.Append("********************" + " Exception Log - " + DateTime.Now + " *********************");
                sbExceptionMessage.Append(Environment.NewLine + Environment.NewLine);

                sbExceptionMessage.Append("Exception Type" + Environment.NewLine);
                sbExceptionMessage.Append(exception.GetType().Name);

                sbExceptionMessage.Append("Message" + Environment.NewLine);
                sbExceptionMessage.Append(exception.Message + Environment.NewLine + Environment.NewLine);

                sbExceptionMessage.Append("Stack Trace" + Environment.NewLine);
                sbExceptionMessage.Append(exception.StackTrace + Environment.NewLine + Environment.NewLine);

                // if the exception has inner exception
                exception = exception.InnerException;

            } while (exception != null);

            LogToDataBase(sbExceptionMessage.ToString());
        }


        /// <summary>
        /// This method will take the exception log string and 
        /// create a sql parameter object, this object 
        /// will use for Store procedure input, and finally
        /// Execute the ExecuteDTByProcedure method
        /// </summary>
        /// <param name="exceptionLog">The exception log string</param>
        private static void LogToDataBase(string exceptionLog)
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@description", exceptionLog);

            DataAccess.ExecuteDTByProcedure("SP_INSERT_LOG", parameters);
        }

    }
}
