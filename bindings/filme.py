# -*- coding: utf-8 -*-

from pyswip.prolog import Prolog
from exception import *
import math

def main():
    prolog = Prolog()
    prolog.consult("intel.pl")
    diagostico = int(raw_input("O que o paciênte tem? (default: nada)? ") or "nada")

if __name__ == "__main__":
    main()
