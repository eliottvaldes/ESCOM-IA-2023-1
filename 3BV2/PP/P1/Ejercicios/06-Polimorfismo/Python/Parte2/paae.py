from persona import Persona

class PAAE(Persona):
    def __init__(self, id, nombre, curp, domicilio):
        self.id = id
        self.nombre = nombre
        self.curp = curp
        self.domicilio = domicilio

    def get_id(self):
        return self.id

    def get_nombre(self):
        return self.nombre

    def get_curp(self):
        return self.curp

    def get_domicilio(self):
        return self.domicilio
