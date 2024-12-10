from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.shortcuts import redirect, render
from django.views import View
from django.contrib import messages

# Vue pour l'inscription
class SignupView(View):
    template_name = "signup.html"

    def get(self, request):
        return render(request, self.template_name)

    def post(self, request):
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']

        if password != confirm_password:
            messages.error(request, "Les mots de passe ne correspondent pas.")
            return render(request, self.template_name)

        if not User.objects.filter(username=username).exists():
            User.objects.create_user(username=username, email=email, password=password)
            messages.success(request, "Compte créé avec succès. Connectez-vous maintenant.")
            return redirect('login')  
        else:
            messages.error(request, "Ce nom d'utilisateur existe déjà.")
            return render(request, self.template_name)
