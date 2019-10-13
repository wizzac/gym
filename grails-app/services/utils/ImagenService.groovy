package utils

import nomenclador.Imagen
import security.Usuario
import org.apache.commons.codec.binary.Base64
import grails.transaction.Transactional

@Transactional
class ImagenService {

        nomenclador.Imagen saveBase64Image(String base64, String pathBase, String pathImagen, String name, Usuario loggedUser) {
        new File(pathBase + pathImagen).mkdirs()

        if(base64.contains("base64,")){
            base64 = base64.split("base64,")[1]
        }

        byte[] imageByteArray = Base64.decodeBase64(base64)
        new File(pathBase + pathImagen + name).withOutputStream {OutputStream stream ->
            stream.write(imageByteArray);
        }

        Imagen imagen = new Imagen()
        imagen.nombre = name
        imagen.path = pathImagen + name
        imagen.vigenciaDesde = new Date()
        imagen.usuario = loggedUser
        imagen.save(flush: true)

        return imagen
    }
}
