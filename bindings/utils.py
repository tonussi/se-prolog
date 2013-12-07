# encoding:utf-8

import math

class Utils(object):

    @staticmethod

    def media(valores):

        valores.sort()

        if len(valores) == 0:
            return
        elif len(valores) % 2 == 1:
            return valores[((len(valores) + 1) / 2) - 1]
        else:
            return (float(valores[(len(valores) / 2) - 1] + valores[len(valores) / 2]) / 2)
