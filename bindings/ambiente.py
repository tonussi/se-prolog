# encoding:utf-8

from utils import *

class Ambiente(object):

    def __init__(self, temp, ajuste, prolog):

        # temp = the outside temperature
        # ajuste = the ajuste percent
        # prolog: a prolog bridge"""

        self.hospedes = []

        # ajustando para o facilitar em prolog

        if temp > 100: self.temp = float(100)
        elif temp < 0: self.temp = float(0)
        else: self.temp = float(temp)

        if ajuste < 0: self.ajuste = float(0)
        elif ajuste > 100: self.ajuste = float(100)
        else: self.ajuste = float(ajuste)

        # let be
        self.tempfora = temp
        self.prolog = prolog

    def __str__(self):

        twrite, hwrite, lwrite = self.update()

        s = "Quarto:\n" + \
            "Existem " + str(len(self.hospedes)) + " hospedes nesse quarto.\n" + \
            "A Temperatura Media Preferencial: " + \
            str(self.tempmedia()) + " Celcius, \n" + \
            "A Temperatura Exterior: " + \
            str(self.tempfora) + " Celcius, \n" + \
            "Ajuste desejavel: " + str(self.ajuste) + "%\n" + \
            "Decisao do Sistema: " + \
            str(self.temp) + " Celcius, \n" + \
            "\t Sistema (prolog): " + twrite + "\n"

        return s

    def tempmedia(self):

        temps = [hospede.temp for hospede in self.hospedes]

        med = Utils.media(temps)

        if med == None: return self.tempfora

        else: return med

    def pop(self, hospede):
        if hospede in self.hospedes:
            self.hospedes.remove(hospede)

    def push(self, hospede):
        if hospede not in self.hospedes:
            self.hospedes.append(hospede)

    def update(self):

        # interagindo com intel.pro (sist. esp. em prolog)

        if len(self.hospedes) > 0:

            # lista de temperaturas

            tempquery = list(self.prolog.query("decisao_tambiente(" + str(self.tempfora) + "," + str(self.tempmedia()) + "," + "100,0," + str(self.ajuste) + ", Recomendado, Write)"))

            self.temp = float(tempquery[0]["Recomendado"])

            tempmessage = ""

            for char in tempquery[0]["Write"]:
                tempmessage += chr(char)

            return tempmessage

        else:
            if self.tempfora > 100: self.temp = float(100)
            elif self.tempfora < 0: self.temp = float(0)
            else: self.temp = self.tempfora

            return "Pronto.","Pronto.","Pronto."
