import hivekeeper.*

class BootStrap {

    def init = { servletContext ->
		new Inspection(site: "Market St Hive").save(flush: true)
    }
    def destroy = {
    }
}
