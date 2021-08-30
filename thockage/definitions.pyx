from config import config


cdef class Modes():
    cdef public selected_mode 
    cdef public available_modes 

    def __cinit__(self):
        self.selected_mode= config.get("modes").get("default")
        self.available_modes = config.get("modes")

    cpdef change_mode(self, mode):
        self.selected_mode = config.get("modes").get(mode)


modes = Modes()