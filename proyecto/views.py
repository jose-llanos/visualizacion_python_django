# Se importan las librerias para el template y los renders
from django.shortcuts import render
import json


# Librerias para operaciones matemáticas
import numpy as np
# Libreria para el manejo de datos
import pandas as pd

# Libreria para la conexión de PostgreSQL
from proyecto.connection import connection_postgresql

# -----------------------------------

def main(request):
    # Se genera la conexión con la base de datos
    cursor = connection_postgresql()

    # Se consultan los registros para las gráficas
    cursor.execute(""" select total from compras """)
    record = cursor.fetchall()

    # Conversión y limpieza
    datos_y = [float(item[0]) for item in record]

    print(datos_y)

    # Se envian los valores de Y al contexto para renderizar
    context = {"y": datos_y}

    # *** Plantilla ***
    return render(request, 'index.html', context=context)

def grafica1(request):
    # Se genera la conexión con la base de datos
    cursor = connection_postgresql()

    # Se consultan los registros para las gráficas
    cursor.execute(""" select total from compras """)
    record = cursor.fetchall()

    # Conversión y limpieza
    datos_y = [float(item[0]) for item in record]

    print(datos_y)

    # Se envian los valores de Y al contexto para renderizar
    context = {"y": datos_y}
    
    # *** Plantilla ***
    return render(request, 'index.html', context=context)


def grafica2(request):
    # Datos gráfica 2
    datos_frutas = ['Manzana', 'Peras', 'Bananos', 'Fresas', 'Uvas']
    datos_porcentajes = [30.0, 20.0, 10.0, 25.0, 15.0]

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

def grafica4(request):
    # Se genera la conexión con la base de datos
    cursor = connection_postgresql()

    # Se consultan los registros para las gráficas
    cursor.execute(""" select ciudad, id_ciudad from ciudades """)
    record = cursor.fetchall()

    # Conversión y limpieza
    categorias = [item[0] for item in record]
    datos1 = [float(item[1]) for item in record]
    
    # Contexto: Datos que vamos a pasar al template (index.html)
    context = {
               "categorias2": categorias,
               "prueba": datos1
               }

    # *** Plantilla ***
    return render(request, 'index.html', context=context)    