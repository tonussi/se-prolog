class SistemaExpecialistaException(Warning):
    pass
class NaoExisteEsseFilmeException(SistemaExpecialistaException):
    pass
class FilmeDesconhecidoException(SistemaExpecialistaException):
    pass
class GeneroDesconhecidoException(SistemaExpecialistaException):
    pass
