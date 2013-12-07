# encoding:utf-8

class Hospede(object):

    def __init__(self, pid, temp):

        # pid : id

        self.pid = pid

        # temp : temperatura

        self.temp = temp

    def __str__(self):
        return "Hospede[" + str(self.pid) + "]: Prefere, " + str(self.temp) + " Celcius."
