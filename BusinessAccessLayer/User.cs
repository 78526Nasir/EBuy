using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessLayer;


namespace BusinessAccessLayer
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
        private string _salt;
        private string _hash;

        /// <summary>
        /// Constructor for retrive record against username
        /// </summary>
        /// <param name="username"></param>
        public User(string username)
        {
            _username = username;
        }
        /// <summary>
        /// Constructor for Login purpose
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        public User(string username, string saltedHash)
        {
            _username = username;
            _hash = saltedHash;
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
            _email = email;
            _dob = dob;
            _age = calculateAge(dob);
            _religion = religion;
            _password = password;
            _gender = gender;
        }

        public void setHashAndSalt(string hash, string salt)
        {
            _hash = hash;
            _salt = salt;
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

        // To Do
        //public void setPassword(string password)
        //{
        //    _password = password;
        //}

        public string getPassword()
        {
            return _password;
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
        public string getSalt()
        {
            return _salt;
        }
        public string getHash()
        {
            return _hash;
        }

        /// <summary>
        /// Finding Age from given Date of Birth
        /// </summary>
        /// <param name="dob"></param>
        /// <returns>Age</returns>
        private int calculateAge(string dob)
        {
            DateTime dateOfBirth = Convert.ToDateTime(dob);
            DateTime Now = DateTime.Now;
            int Years = new DateTime(DateTime.Now.Subtract(dateOfBirth).Ticks).Year - 1;
            return Years;
        }

        public bool login()
        {
            ECommerceBusiness ecb = new ECommerceBusiness
            {
                UserObj = this
            };

            return ecb.selectUser();
        }

        public bool registration()
        {
            ECommerceBusiness ecb = new ECommerceBusiness
            {
                UserObj = this
            };

            ecb.addNewUser();

            return true;
        }
    }
}