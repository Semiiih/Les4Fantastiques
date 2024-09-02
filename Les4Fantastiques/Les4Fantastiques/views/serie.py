from django.views.generic import TemplateView

class SerieView(TemplateView):
    template_name = "serie.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["nom"] = "test"
        return context
