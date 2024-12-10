from django.views.generic import TemplateView

class MiniGameView(TemplateView):
    template_name = "mini_game.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["titre"] = "Mini Jeu - Sauter pour survivre"
        return context
