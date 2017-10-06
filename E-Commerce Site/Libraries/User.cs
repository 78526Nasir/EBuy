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

        /*
         * Constructor for Creating General user 
         */
        public User(string fullName, string gender, string religion, int age)
        {
            _fullName = fullName;
            _gender = gender;
            _religion = religion;
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

        /*
            // to do Password get method
            * Left for security issue! authentication 
            * todo Hash and salt
        */
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
        

    }
}