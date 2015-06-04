from kivent_core.rendering.cmesh cimport CMesh
from staticmemgamesystem cimport StaticMemGameSystem, MemComponent
from kivent_core.rendering.batching cimport BatchManager
from kivent_core.rendering.vertex_format cimport KEVertexFormat
from kivent_core.memory_handlers.membuffer cimport Buffer
from kivent_core.rendering.vertmesh cimport VertexModel
from cpython cimport bool


ctypedef struct RenderStruct:
    unsigned int entity_id
    unsigned int texkey
    unsigned int batch_id
    void* model
    void* renderer
    int vert_index
    int ind_index
    bint render


cdef class RenderComponent(MemComponent):
    pass


cdef class Renderer(StaticMemGameSystem):
    cdef BatchManager batch_manager
    cdef object update_trigger
    cdef void* _batch_entity(self, unsigned int entity_id, 
        RenderStruct* component_data) except NULL
    cdef void* _unbatch_entity(self, unsigned int entity_id, 
        RenderStruct* component_data) except NULL
    cdef void* _init_component(self, unsigned int component_index, 
        unsigned int entity_id, bool render, VertexModel model, 
        unsigned int texkey) except NULL
    cdef void* setup_batch_manager(self, Buffer master_buffer) except NULL


cdef class PhysicsRenderer(Renderer):
    pass

cdef class ColorRenderer(Renderer):
    pass