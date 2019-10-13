package utils

import grails.transaction.Transactional
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

import java.lang.management.ManagementFactory
import java.lang.management.MemoryPoolMXBean
import java.lang.management.MemoryType
import java.lang.management.MemoryUsage
import java.text.SimpleDateFormat

@Transactional
class MemoryService {

    private static Log log = LogFactory.getLog(MemoryService.class)
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss")

    def checkMemory() {
        Iterator<MemoryPoolMXBean> iter = ManagementFactory.getMemoryPoolMXBeans().iterator()
        log.info(("#####################################################################"))
        log.info(("###########         M E M O R Y    R E P O R T           ############"))
        log.info(("###########              " + sdf.format(new Date()) + "             ############"))
        log.info(("#####################################################################"))
        while (iter.hasNext())
        {
            MemoryPoolMXBean item = iter.next()
            String name = item.getName()
            MemoryType type = item.getType()
            MemoryUsage usage = item.getUsage()
            MemoryUsage collections = item.getCollectionUsage()
            log.info(("# " + String.format("%20s", name) + " : " + String.format("%.2f", (usage.getUsed()/1024/1024)) + "/" + String.format("%.2f", (usage.getMax()/1024/1024)) + "   -> " + String.format("%.2f", (100*usage.getUsed()/usage.getMax())) + "%"))
        }
        log.info(("#####################################################################"))
        log.info(("#####################################################################"))
        log.info((" "))
    }
}
