package utils

import grails.transaction.Transactional
import org.apache.commons.codec.binary.Base64

import java.security.SecureRandom
import java.text.Normalizer

@Transactional
class StringService {
    static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    static SecureRandom rnd = new SecureRandom();

    String randomString( int len ){
        StringBuilder sb = new StringBuilder( len );
        for( int i = 0; i < len; i++ )
            sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
        return sb.toString();
    }

    String caracteresValidos( String origen ){

        StringBuilder destino = new StringBuilder();
        origen=origen.toUpperCase()
        for( int i = 0; i < origen.length(); i++ )
            if(AB.indexOf(origen.charAt(i).toString())>=0){
                destino.append(origen.charAt(i))
            }
        return destino.toString();
    }

    String encrypt(String text) {
        try {
            byte[] encodedBytes = Base64.encodeBase64(text.getBytes());
            String encrypted = new String(encodedBytes)

            return encrypted
        }
        catch (Exception e) {
            log.error("failed to encrypt text." + e.getMessage())
        }
    }

    String decrypt(String text) {
        String textData = text
        byte[] encodedBytes = textData.getBytes()
        String decrypted = new String(Base64.decodeBase64(encodedBytes))

        return decrypted;
    }

    String removeDiacritics(String self) {
        Normalizer
                .normalize(self, Normalizer.Form.NFD)
                .replaceAll(/\p{InCombiningDiacriticalMarks}+/, '')
    }

    String fixForPath(String text){
        text = removeDiacritics(text)
        text = text.replaceAll(' ', '_')

        return text
    }

    String removeLeadingZeros(String text){
        return text.replaceFirst(/^0+(?!$)/, "")
    }

    String fixEmail(String email){
        return email.replace("&#64;", "@")
    }
}
