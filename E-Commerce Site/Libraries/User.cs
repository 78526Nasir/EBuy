using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Site.Libraries
{
    public class User
    {
        private string _username;
        private string _fullName;
        private string _password;
        private string _gender;
        private string _religion;
        private string _email;
        private string _dob;
        private int _age;
        private string _addressLineOne;
        private string _addressLineTwo;
        private string _country;
        private string _city;
        private string _district;

        /// <summary>
        /// Constructor for general user
        /// </summary>
        /// <param name="fullName"></param>
        /// <param name="gender"></param>
        /// <param name="religion"></param>
        /// <param name="age"></param>
        public User(string fullName, string gender, string religion, int age)
        {
            _fullName = fullName;
            _gender = gender;
            _religion = religion;
            _age = age;
        }

        /// <summary>
        /// Constructor for user registration
        /// </summary>
        /// <param name="username"></param>
        /// <param name="fullName"></param>
        /// <param name="password"></param>
        /// <param name="gender"></param>
        /// <param name="religion"></param>
        /// <param name="email"></param>
        /// <param name="dob"></param>
        public User(string username, string fullName, string password, string gender, string religion, string email, string dob)
        {
            _username = username;
            _fullName = fullName;
            _password = password;
            _gender = gender;
            _religion = religion;
            _email = email;
            _dob = dob;
            _age = calculateAge(""); // TO DO
        }

        public void setUsername(string username)
        {
            _username = username;
        }
        public string getUsername()
        {
            return _username;
        }
        public void setFullName(string fullName)
        {
            _fullName = fullName;
        }
        public string getFullName()
        {
            return _fullName;
        }
        public void setPassword(string password)
        {
            _password = password;
        }

        /// <summary>
        /// TO DO 
        /// Hashing and Salting
        /// User Authentication
        /// </summary>
        /// <returns></returns>
        public string getPassword()
        {
            return "";
        }
        public void setGender(string gender)
        {
            _gender = gender;
        }
        public string getGender()
        {
            return _gender;
        }
        public void setreligion(string religion)
        {
            _religion = religion;
        }
        public string getReligion()
        {
            return _religion;
        }
        public void setEmail(string email)
        {
            _email = email;
        }
        public string getEmail()
        {
            return _email;
        }
        public void setDateOfBirth(string dob)
        {
            _dob = dob;
        }
        public string getDateOfBirth()
        {
            return _dob;
        }
        public void setAge(int age)
        {
            _age = age;
        }
        public int getAge()
        {
            return _age;
        }
        public void setAddressLineOne(string address1)
        {
            _addressLineOne = address1;
        }
        public string getAddressLineOne()
        {
            return _addressLineOne;
        }
        public void setAddressLineTwo(string address2)
        {
            _addressLineTwo = address2;
        }
        public string getAddressLineTwo()
        {
            return _addressLineTwo;
        }
        public void setCountry(string country)
        {
            _country = country;
        }
        public string getCountry()
        {
            return _country;
        }
        public void setCity(string city)
        {
            _city = city;
        }
        public string getCity()
        {
            return _city;
        }
        public void setDistrict(string district)
        {
            _district = district;
        }
        public string getDistrict()
        {
            return _district;
        }
        
        
        /// <summary>
        /// TO DO
        /// Finding Age from given Date of Birth
        /// </summary>
        /// <param name="dob"></param>
        /// <returns>Age</returns>
        private int calculateAge(string dob)
        {
            return 0;
        }
    }
}