using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;

namespace E_Commerce_Site.Libraries
{
    public class HashingAndSalting
    {
        /// <summary>
        /// Create a unique 128 bit salt;
        /// Generating salt by using a secure algorithm
        /// "Pseudo Random Number Generator"
        /// </summary>
        /// <returns></returns>
        public static byte[] createSalt()
        {
            byte[] salt = new byte[128 / 8];
            using (var range = RandomNumberGenerator.Create())
            {
                range.GetBytes(salt);
            }
            return salt;
        }
        /// <summary>
        /// Generate saltedHash;
        /// Use KeyDerivation algorithm;
        /// Iterate 10000 times
        /// </summary>
        /// <param name="password"></param>
        /// <returns></returns>
        public static string createSaltedHash(string password)
        {
            byte[] salt = createSalt();
            string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(password, salt, KeyDerivationPrf.HMACSHA1, 10000, 256 / 8));
            return hashed;
        }

        public static string createSaltedHash(string password, out string saltValue)
        {
            byte[] salt = createSalt();
            saltValue = Convert.ToBase64String(salt);
            string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(password, salt, KeyDerivationPrf.HMACSHA1, 10000, 256 / 8));
            return hashed;
        }

        public static string createSaltedHash(string password, string salt)
        {
            byte[] saltingValue = Convert.FromBase64String(salt);
            string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(password, saltingValue, KeyDerivationPrf.HMACSHA1, 10000, 256 / 8));
            return hashed;
        }
    }
}