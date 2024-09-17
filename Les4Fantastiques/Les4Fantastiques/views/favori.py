from django.views.generic import TemplateView

class FavoriView(TemplateView):
    template_name = "favori.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["nom"] = "test"
        return context
