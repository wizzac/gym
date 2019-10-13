package utils

import grails.transaction.Transactional

import java.security.MessageDigest
import java.security.NoSuchAlgorithmException
import java.security.SecureRandom

@Transactional
class CryptoService {

    String getSHA1SecurePassword(String passwordToHash, byte[] salt) {
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            if (salt) {
                md.update(salt);
            }
            byte[] bytes = md.digest(passwordToHash.getBytes());
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        return generatedPassword;
    }

    byte[] getSalt() throws NoSuchAlgorithmException {
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return salt;
    }

    String getSaltedSHA1Password(String password){
        byte[] salt = getSalt()
        return getSHA1SecurePassword(password, salt)
    }
}
