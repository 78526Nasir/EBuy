using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Site.Libraries
{
    public class User
    {
        private string _username;
        private string _password;
        private string _gender;
        private string _religion;
        private string _email;
        private int _age;

        public User(string username,string password, string gender, string religion, string email, int age)
        {
            _username = username;
            _password = password;
            _gender = gender;
            _religion = religion;
            _email = email;
            _age = age;
        }

        public void setUsername(string username)
        {
            _username = username;
        }
        public string getUsername()
        {
            return _username;
        }

        public string getGender()
        {
            return _gender;
        }

    }
}