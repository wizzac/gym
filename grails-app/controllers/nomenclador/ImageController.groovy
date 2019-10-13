package nomenclador

import utils.StringService
import grails.converters.JSON
import org.apache.commons.logging.LogFactory

import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths
import java.nio.file.StandardCopyOption

class ImageController {
    static log = LogFactory.getLog(ImageController.class)

    StringService stringService

    def show() {
        String path

        if(params.path != null) {
            path = params.path.replace("\\", "/")
            log.info("Serving file " + path)
        }
        else {
            path = g.resource dir: 'images', file: 'missing-image.png'
            log.info("Image not found")
        }

        try{
            def file = new File(path)

            if (!file.exists()) {
                file = new File("/resto/staticimages/missing-image.png")
            }

            response.contentType = 'image/*'
            response.outputStream << file.bytes
            return
        } catch (Exception ex){
            ex.printStackTrace()
        }
    }

    def subirImagenTemporal(){
        def json = []
        if(session.documentoTmp == null){
            session.documentoTmp = [:]
        }
        try{
            def fileName = params.qqfilename
            def inputStream = params.qqfile.getInputStream()

            //String thumbnailPath = g.resource(dir: 'images', file: 'not_available-generic.png', absolute: true)
            json = [success: true]//, thumbnailUrl: thumbnailPath]

            int index = fileName.lastIndexOf(".")
            String name = fileName.substring(0, index)
            String extension = fileName.substring(index)

            Path destination = Paths.get(stringService.fixForPath(grailsApplication.config.resto.default.pathDocumentosTmp + "/" + name + "_" + new Date().format("ddMMyyyyHHmmss") + extension))
            Path moveDestination = Paths.get(stringService.fixForPath(grailsApplication.config.resto.default.path.base + grailsApplication.config.resto.default.pathDocumentosTmp + "/" + name + "_" + new Date().format("ddMMyyyyHHmmss") + extension))

            new File(moveDestination.toString()).mkdirs()
            Files.copy(inputStream, moveDestination, StandardCopyOption.REPLACE_EXISTING)

            nomenclador.Imagen imagen = new Imagen()
            imagen.nombre = name + extension
            imagen.path = destination.toString()
            imagen.usuario = session.loggedUser
            imagen.vigenciaDesde = new Date()

            imagen.save(flush: true)

            log.info("""Guardando Imagen: ${imagen}.""")

            session.documentoTmp.put(params.docKey, imagen.id)
        }
        catch(Exception e){
            log.error(e.printStackTrace())
            json = [success: false]
        }

        render json as JSON
    }

    def showArchivo = {
        Imagen archivoInstance = Imagen.get(params.id)
        def path = grailsApplication.config.resto.default.path.base + archivoInstance.path
        File archivo = new File(path)

        response.outputStream << archivo.bytes
        response.outputStream.flush();
    }

    def showArchivoPath = {
        def path = grailsApplication.config.resto.default.path.base + params.path
        File archivo = new File(path)
//        response.setHeader("Content-Disposition", "Attachment;Filename=\"${archivo.name}\"")
        response.outputStream << archivo.bytes
        response.outputStream.flush();
    }

}
