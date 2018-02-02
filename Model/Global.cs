using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Security.Cryptography;

namespace TAAPs.Model
{
    public class Global
    {
        public static string GenerateSalt(int Size)
        {
            //Generate a cryptographic random number using the crytographic service provider
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] buff = new byte[Size];

            rng.GetBytes(buff); //fill the array with cryptographically strong values

            //return a Base 64 string representation of the random number
            return Convert.ToBase64String(buff);
        }

        public static string GeneratePasswordHash(string _password, string _salt)
        {
            string _SaltAndPassword = string.Concat(_password, _salt);
            string _hashedpwd = FormsAuthentication.HashPasswordForStoringInConfigFile(_SaltAndPassword, "SHA1");

            return _hashedpwd;
        }
    }
}