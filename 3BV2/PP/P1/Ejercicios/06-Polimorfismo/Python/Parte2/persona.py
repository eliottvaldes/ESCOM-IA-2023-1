from abc import ABC, abstractmethod

class Persona(ABC):

    @abstractmethod
    def get_id(self):
        pass

    @abstractmethod
    def get_nombre(self):
        pass

    @abstractmethod
    def get_curp(self):
        pass

    @abstractmethod
    def get_domicilio(self):
        pass
