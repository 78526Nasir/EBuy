using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessLayer;
using System.Text;
using System.Data;

namespace BusinessAccessLayer
{
    public class User
    {
        private string _fullName;
        private string _password;
        private string _gender;
        private string _religion;
        private string _email;
        private string _dob;
        private int _age;
        private string _image;
        private string _addressLineOne;
        private string _addressLineTwo;
        private string _country;
        private string _city;
        private string _district;
        private string _salt;
        private string _hash;

        public string Username { get; set; }
        public string GlobalUniqueIDForResetPassword { get; set; }
        public bool UserNameInUse { get; set; }

        /// <summary>
        /// Constructor for initialize property "on the fly";
        /// </summary>
        public User()
        {

        }

        /// <summary>
        /// Constructor for resetting password through email
        /// </summary>
        public User(StringBuilder email)
        {
            _email = email.ToString();
        }

        /// <summary>
        /// Constructor for Change Password
        /// </summary>
        /// <param name="gUID">Global Unique Identifier</param>
        /// <param name="password">New password</param>
        /// <param name="salt">Salt for new password</param>
        /// <param name="hash">hash for new password</param>
        public User(string gUID, string password, string salt, string hash)
        {
            GlobalUniqueIDForResetPassword = gUID;
            _password = password;
            _salt = salt;
            _hash = hash;
        }

        /// <summary>
        /// Constructor for retrive record against username
        /// for Password Hashing and Salting purpose
        /// </summary>
        /// <param name="username"></param>
        public User(string username)
        {
            Username = username;
        }

        /// <summary>
        /// Constructor for Login purpose
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        public User(string username, string saltedHash)
        {
            Username = username;
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
        public User(string username, string fullName, string password, string gender, string religion, string email, string dob, string image)
        {
            Username = username;
            _fullName = fullName;
            _email = email;
            _dob = dob;
            _age = calculateAge(dob);
            _religion = religion;
            _password = password;
            _gender = gender;
            _image = image;
        }

        public void setHashAndSalt(string hash, string salt)
        {
            _hash = hash;
            _salt = salt;
        }
        public void setUsername(string username)
        {
            Username = username;
        }
        public string getUsername()
        {
            return Username;
        }
        public void setFullName(string fullName)
        {
            _fullName = fullName;
        }
        public string getFullName()
        {
            return _fullName;
        }
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
        public void setImage(string image)
        {
            _image = image;
        }
        public string getImage()
        {
            return _image;
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
        public DataTable login()
        {
            ECommerceBusiness ecb = new ECommerceBusiness
            {
                UserObj = this
            };

            return ecb.SelectUser();
        }
        public bool registration()
        {
            ECommerceBusiness ecb = new ECommerceBusiness
            {
                UserObj = this
            };

            ecb.AddNewUser();

            return true;
        }
    }
}