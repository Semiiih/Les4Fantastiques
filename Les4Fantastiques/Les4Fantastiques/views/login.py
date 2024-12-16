from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.shortcuts import redirect, render
from django.views import View
from django.contrib import messages

class LoginView(View):
    template_name = "login.html"

    def get(self, request):
        return render(request, self.template_name)

    def post(self, request):
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user) 
            return redirect('home')
        else:
            messages.error(request, "Nom d'utilisateur ou mot de passe incorrect.")
            return render(request, self.template_name)
