# encoding:utf-8

from pyswip import *
from pessoa import *
from quarto import *
from exceptions import *

def main():

    prolog = Prolog()

    prolog.consult("intel.pro") # consulta o arquivo intel.pro

    currentPid = 0

    allOccupants = []

    print "\n\nLeia!"
    print "Temperatura Externa: Temperatura fora do quarto de hospede."
    print "Temperatura Interna: Temperatura dentro do quarto."
    print "Ajuste Desejavel: 0~100%, O sistema especialista vai entender"
    print "Temperatura: Pense em Graus Celcius\n\n"

    while True:

        try:
            tempExterior = float(input("Sistema: Qual é a temperatura exterior (Celcius)? "))

            if tempExterior < -273.15:
                raise MuitoFrioException("Cuidado: http://www.wolframalpha.com/input/?i=0+kelvin")

            elif tempExterior > 5510:
                raise MuitoQuenteException("Cuidado: http://www.wolframalpha.com/input/?i=sun+temp")

            savings = float(input("Sistema: Ajuste Desejavel (0~100)%? "))

            break

        except Warning as erro:
            print erro
            raise ExceptionEmergencia("Sistema: Programa Encerrado!")

        except Exception:
            print "Sistema (Erro): Tente Novamente!"
            pass

    ambiente = Ambiente(tempExterior, savings, prolog)
    print "\n" + str(ambiente)

    ###########
    #  menu   #
    ###########
    selection = -1
    while selection != 0:

        print "\nSistema: Escolha uma opcao"

        print "0) Encerra programa."

        print "1) Lista hospedes por id."

        print "2) Adicona um hospede via id."

        print "3) Remove um hospede via id."

        try:
            selection = int(input(">> "))
        except Exception:
            print "\nSistema (Erro): Opcao invalida."
            selection = -1

        ###########
        # opcao 1 #
        ###########
        if selection == 1:
            if len(ambiente.hospedes) != 0:
                for hospede in ambiente.hospedes:
                    print "  " + str(hospede)
                print ""
            else:
                print "\nSistema (Erro): Nenhum hospede cadastrado.\n"

        ###########
        # opcao 2 #
        ###########
        if selection == 2:
            try:
                newOcc = int(input("Sistema: Novo Hospede (1 sim / 0 nao)? "))
            except Exception:
                print "\nSistema (Erro): Opcao invalida."
                newOcc = -1

            ###########
            # opcao 1 #
            ###########
            if newOcc == 1:
                try:

                    occTemp = float(input("Sistema: Qual Temperatura Preferida (Celcius)? "))

                    newOcc = Occupant(currentPid, occTemp)

                    ################
                    # push hospede #
                    ################
                    ambiente.push(newOcc)
                    allOccupants.append(newOcc)

                    currentPid += 1
                    print "\n" + str(ambiente)

                except Exception as e:

                    print e

                    print "\nSistema (Erro): Opcao invalida."

            ###########
            # opcao 0 #
            ###########
            elif newOcc == 0:
                try:
                    occPid = int(input("Sistema: Identificador do novo hospede (id = 0-1000)? "))
                    if occPid < currentPid:
                        for hospede in allOccupants:
                            if hospede.pid == occPid:
                                ambiente.push(hospede)

                                print "Sistema: Ajustando temperatura..."
                                print "\n" + str(ambiente)
                    else:
                        print "\nSistema (Erro): Identificador nao existe."
                except Exception:
                    print "\nSistema (Erro): Opcao invalida."
            else:
                print "\nSistema (Erro): Opcao invalida."

        ###########
        # opcao 3 #
        ###########
        elif selection == 3:
            try:
                occPid = int(input("Sistema: Identificador do hospede (id = 0-1000)? "))

                if occPid < currentPid:
                    for hospede in ambiente.hospedes:
                        if hospede.pid == occPid:


                            ###############
                            # pop hospede #
                            ###############
                            ambiente.pop(hospede)

                            # print "\n" + str(hospede)
                            print "Sistema: Ajustando Temperatura..."
                            print "\n" + str(ambiente)

                else:
                    print "Sistema (Erro): Identificador nao existe."

            except Exception:
                print "\nSistema (Erro): Opcao invalida."

    ###########
    # opcao 0 #
    ###########
    print "Obrigado! :)"
    return 0

if __name__ == "__main__":
    main()
