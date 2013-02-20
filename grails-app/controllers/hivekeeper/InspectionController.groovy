package hivekeeper

import org.springframework.dao.DataIntegrityViolationException

class InspectionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inspectionInstanceList: Inspection.list(params), inspectionInstanceTotal: Inspection.count()]
    }

    def create() {
        [inspectionInstance: new Inspection(params)]
    }

    def save() {
		params.each { param ->
			// noop
		}
		def newInspection = new Inspection(params)

		if (newInspection.validate()) {
			newInspection.save()
		}
		else {
			log.warn("Cannot save: " + newInspection.errors)
		}
		
		render(view: "show", model: [inspectionInstance: newInspection])
    }

    def show(Long id) {
        def inspectionInstance = Inspection.get(id)
        if (!inspectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspection.label', default: 'Inspection'), id])
            redirect(action: "list")
            return
        }

        [inspectionInstance: inspectionInstance]
    }

    def edit(Long id) {
        def inspectionInstance = Inspection.get(id)
        if (!inspectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspection.label', default: 'Inspection'), id])
            redirect(action: "list")
            return
        }

        [inspectionInstance: inspectionInstance]
    }

    def update(Long id, Long version) {
        def inspectionInstance = Inspection.get(id)
        if (!inspectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspection.label', default: 'Inspection'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inspectionInstance.version > version) {
                inspectionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inspection.label', default: 'Inspection')] as Object[],
                          "Another user has updated this Inspection while you were editing")
                render(view: "edit", model: [inspectionInstance: inspectionInstance])
                return
            }
        }

        inspectionInstance.properties = params

        if (!inspectionInstance.save(flush: true)) {
            render(view: "edit", model: [inspectionInstance: inspectionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'inspection.label', default: 'Inspection'), inspectionInstance.id])
        redirect(action: "show", id: inspectionInstance.id)
    }

    def delete(Long id) {
        def inspectionInstance = Inspection.get(id)
        if (!inspectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inspection.label', default: 'Inspection'), id])
            redirect(action: "list")
            return
        }

        try {
            inspectionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inspection.label', default: 'Inspection'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inspection.label', default: 'Inspection'), id])
            redirect(action: "show", id: id)
        }
    }
}
