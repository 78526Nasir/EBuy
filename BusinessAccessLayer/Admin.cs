using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusinessAccessLayer
{
    public class Admin
    {
        public string UserName { get; set; }
        public string password;
        public string FullName { get; set; }
        public string Image { get; set; }

        // do not use any constructor. object are intialize dynamically on the fly

        public string getPassword()
        {
            return password;
        }
    }
}