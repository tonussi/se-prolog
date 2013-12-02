# encoding:utf-8

class EmergenciaException(Warning):
    pass

class MuitoFrioException(EmergenciaException):
    pass

class MuitoQuenteException(EmergenciaException):
    pass
