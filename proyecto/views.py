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


def grafica1(request):
    # Datos gráfica 1
    datos_y =  [5, 10, 15, 20, 25]

    # Se envian los valores de Y al contexto para renderizar
    context = {"y": datos_y}
    
    # *** Plantilla ***
    return render(request, 'index.html', context=context)


def grafica2(request):
    # Datos gráfica 2
    datos_frutas = ['Manzana', 'Peras', 'Bananos', 'Fresas', 'Uvas']
    datos_porcentajes = [20.0, 20.0, 20.0, 20.0, 20.0]

    # Se envian los valores al contexto para renderizar
    context = {
        "frutas": json.dumps(datos_frutas),
        "porcentajes": json.dumps(datos_porcentajes)
    }
    
    # *** Plantilla ***
    return render(request, 'index.html', context=context)

def grafica3(request):
    
    # Datos gráfica 3
    datos_x = ['USA', 'China', 'Brazil', 'EU', 'Argentina', 'India']
    datos_2023 = [387749, 280000, 129000, 64300, 54000, 34300]
    datos_2024 = [100000, 200000, 300000, 40000, 50000, 60000]

    # Se envian los valores de Y al contexto para renderizar
    context = {
        "categorias": json.dumps(datos_x),
        "valores_2023": json.dumps(datos_2023),
        "valores_2024": json.dumps(datos_2024),
    }
    
    # *** Plantilla ***
    return render(request, 'index.html', context=context)