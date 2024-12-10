from django.views.generic import TemplateView
from django.http import HttpResponse

class SignupView(TemplateView):
    template_name = "signup.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["nom"] = "test"
        return context