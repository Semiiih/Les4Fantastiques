# views.py
from django.views.generic import TemplateView

class PersonnageView(TemplateView):
    template_name = "personnage.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["nom"] = "test"
        return context
