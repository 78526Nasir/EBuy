using BusinessAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace E_Commerce_Site
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            ExceptionLogger.Log(ex);

            var exception = (HttpException)ex;
            int httpCode = exception.GetHttpCode();

            Server.ClearError();           

            if (!Response.IsRequestBeingRedirected)
            {
                if (httpCode == 404)
                {
                    Response.Redirect("~/Errors_UI/PageNotFoundError.aspx");
                }
                else
                {
                    Response.Redirect("~/Errors_UI/Error.aspx");
                }
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}