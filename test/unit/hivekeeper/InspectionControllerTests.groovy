package hivekeeper



import org.junit.*
import grails.test.mixin.*

@TestFor(InspectionController)
@Mock(Inspection)
class InspectionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/inspection/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.inspectionInstanceList.size() == 0
        assert model.inspectionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.inspectionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.inspectionInstance != null
        assert view == '/inspection/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/inspection/show/1'
        assert controller.flash.message != null
        assert Inspection.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/inspection/list'

        populateValidParams(params)
        def inspection = new Inspection(params)

        assert inspection.save() != null

        params.id = inspection.id

        def model = controller.show()

        assert model.inspectionInstance == inspection
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/inspection/list'

        populateValidParams(params)
        def inspection = new Inspection(params)

        assert inspection.save() != null

        params.id = inspection.id

        def model = controller.edit()

        assert model.inspectionInstance == inspection
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/inspection/list'

        response.reset()

        populateValidParams(params)
        def inspection = new Inspection(params)

        assert inspection.save() != null

        // test invalid parameters in update
        params.id = inspection.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/inspection/edit"
        assert model.inspectionInstance != null

        inspection.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/inspection/show/$inspection.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        inspection.clearErrors()

        populateValidParams(params)
        params.id = inspection.id
        params.version = -1
        controller.update()

        assert view == "/inspection/edit"
        assert model.inspectionInstance != null
        assert model.inspectionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/inspection/list'

        response.reset()

        populateValidParams(params)
        def inspection = new Inspection(params)

        assert inspection.save() != null
        assert Inspection.count() == 1

        params.id = inspection.id

        controller.delete()

        assert Inspection.count() == 0
        assert Inspection.get(inspection.id) == null
        assert response.redirectedUrl == '/inspection/list'
    }
}
