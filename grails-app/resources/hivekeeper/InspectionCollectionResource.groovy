package hivekeeper

import static org.grails.jaxrs.response.Responses.*

import javax.ws.rs.Consumes
import javax.ws.rs.GET
import javax.ws.rs.Produces
import javax.ws.rs.Path
import javax.ws.rs.PathParam
import javax.ws.rs.POST
import javax.ws.rs.core.Response

@Path('/api/inspection')
@Consumes(['application/xml','application/json'])
@Produces(['application/xml','application/json'])
class InspectionCollectionResource {

    def inspectionResourceService
    
    @POST
    Response create(Inspection dto) {
        created inspectionResourceService.create(dto)
    }

    @GET
    Response readAll() {
        ok inspectionResourceService.readAll()
    }
    
    @Path('/{id}')
    InspectionResource getResource(@PathParam('id') Long id) {
        new InspectionResource(inspectionResourceService: inspectionResourceService, id:id)
    }
        
}
