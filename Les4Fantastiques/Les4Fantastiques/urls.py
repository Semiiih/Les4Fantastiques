"""
URL configuration for Les4Fantastiques project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
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
from .views import HomeView, PersonnageView, LoginView, SignupView, SerieView, FavoriView, QuizzView, MiniGameView
from django.shortcuts import redirect
from django.views import View


class CustomLogoutView(View):
    def get(self, request):
        from django.contrib.auth import logout
        logout(request)
        return redirect('home')

urlpatterns = [
    path("", HomeView.as_view(), name="home"),
    path("personnage/", PersonnageView.as_view(), name="personnage"),
    path("serie/", SerieView.as_view(), name="serie"),
    path("login/", LoginView.as_view(), name="login"),
    path('signup/', SignupView.as_view(), name='signup'),
    path("favori/", FavoriView.as_view(), name="favori"),
    path('logout/', CustomLogoutView.as_view(), name='logout'),
    path("mini_game/", MiniGameView.as_view(), name="mini_game"), 
    path("quizz/", QuizzView.as_view(), name="quizz"),

]