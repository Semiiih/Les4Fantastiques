from django.views.generic import TemplateView
import json
import os
from django.conf import settings

class SerieView(TemplateView):
    template_name = "serie.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        json_path = os.path.join(settings.BASE_DIR, 'Les4Fantastiques/views/appelSerieMarvel.json')

        try:
            with open(json_path, 'r') as file:
                data = json.load(file)
                series = data.get('data', {}).get('results', [])
                context['series'] = series
        except FileNotFoundError:
            context['error'] = 'Le fichier JSON n\'a pas été trouvé.'
        except json.JSONDecodeError:
            context['error'] = 'Erreur lors de la lecture du fichier JSON.'

        return context
