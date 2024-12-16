from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.models import User
from django.views import View
from django.core.exceptions import ValidationError
from django.contrib.auth.password_validation import validate_password
import re

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

        if not re.match(r'^[^@]+@[^@]+\.[^@]+$', email):
            messages.error(request, "Adresse email invalide.")
            return render(request, self.template_name)

        if User.objects.filter(username=username).exists():
            messages.error(request, "Ce nom d'utilisateur existe déjà.")
            return render(request, self.template_name)

        if User.objects.filter(email=email).exists():
            messages.error(request, "Cet email est déjà utilisé.")
            return render(request, self.template_name)

        try:
            validate_password(password)
        except ValidationError as e:
            messages.error(request, e.messages[0])
            return render(request, self.template_name)

        User.objects.create_user(username=username, email=email, password=password)
        messages.success(request, "Compte créé avec succès. Connectez-vous maintenant.")
        return redirect('login')