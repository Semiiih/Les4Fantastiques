from django.views.generic import TemplateView

class FilmView(TemplateView):
    template_name = "film.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["nom"] = "test"
        return context
