"""proyecto2 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from proyecto.views import main
from proyecto.views import grafica1
from proyecto.views import grafica2
from proyecto.views import grafica3
from proyecto.views import grafica4

urlpatterns = [
    #path('admin/', admin.site.urls),

    path('main/', main, name='main'), # Directa
    path('grafica1/', grafica1),      # Grafica1
    path('grafica2/', grafica2),      # Grafica2
    path('grafica3/', grafica3),      # Grafica2
    path('grafica4/', grafica4),      # Grafica4
]
