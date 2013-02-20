package hivekeeper

import org.grails.jaxrs.provider.DomainObjectNotFoundException

class InspectionResourceService {
    
    def create(Inspection dto) {
        dto.save()
    }

    def read(def id) {
        def obj = Inspection.get(id)
        if (!obj) {
            throw new DomainObjectNotFoundException(Inspection.class, id)
        }
        obj
    }
    
    def readAll() {
        Inspection.findAll()
    }
    
    def update(Inspection dto) {
        def obj = Inspection.get(dto.id)
        if (!obj) {
            throw new DomainObjectNotFoundException(Inspection.class, dto.id)
        }
        obj.properties = dto.properties 
        obj
    }
    
    void delete(def id) {
        def obj = Inspection.get(id)
        if (obj) { 
            obj.delete()
        }
    }
    
}

