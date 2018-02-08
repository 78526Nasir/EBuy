using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DataBaseExceptionLogger
    {

        /// <summary>
        /// Logging the Exception into a StringBuilder object.
        /// And then store it to the Widdows Event Viewr
        /// </summary>
        /// <param name="exception">the actual exception</param>
        public static void Log(Exception exception)
        {
            StringBuilder sbExceptionMessage = new StringBuilder();

            do
            {
                sbExceptionMessage.Append("********************" + " Exception Log - " + DateTime.Now + " *********************");
                sbExceptionMessage.Append(Environment.NewLine+Environment.NewLine);

                sbExceptionMessage.Append("Exception Type" + Environment.NewLine);
                sbExceptionMessage.Append(exception.GetType().Name);

                sbExceptionMessage.Append("Message" + Environment.NewLine);
                sbExceptionMessage.Append(exception.Message + Environment.NewLine + Environment.NewLine);

                sbExceptionMessage.Append("Stack Trace" + Environment.NewLine);
                sbExceptionMessage.Append(exception.StackTrace + Environment.NewLine + Environment.NewLine);

                // if the exception has inner exception
                exception = exception.InnerException;

            } while (exception != null);

            if (EventLog.SourceExists("DotNET"))
            {
                EventLog eventLog = new EventLog("EBuy");
                eventLog.Source = "DotNET";
                eventLog.WriteEntry(sbExceptionMessage.ToString(), EventLogEntryType.Error);
            }
        }
    }
}
