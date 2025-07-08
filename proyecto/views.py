# Se importan las librerias para el template y los renders
from django.shortcuts import render
import json


# Librerias para operaciones matemáticas
import numpy as np
# Libreria para el manejo de datos
import pandas as pd

# -----------------------------------

def main(request):
    # *** Plantilla ***
    return render(request, 'index.html', context={})


def dashboard(request):

    # Data
    datos_y=  [5, 10, 15, 20, 25]

    # Se envian los valores de Y al contexto para renderizar
    context = {"y": datos_y}

    # *** Plantilla ***
    return render(request, 'index.html', context=context)
