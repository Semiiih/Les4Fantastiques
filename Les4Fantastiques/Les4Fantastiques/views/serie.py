from django.views.generic import TemplateView
import requests

API_URL = "https://dylanprof.pythonanywhere.com/series/"

class SerieView(TemplateView):
    template_name = "serie.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        try:
            response = requests.get(API_URL)
            response.raise_for_status()
            
            data = response.json()
            
            series = data.get('data', {}).get('results', [])
            valid_series = []

            for serie in series:
                thumbnail = serie.get('thumbnail', {})
                if thumbnail.get('path') and thumbnail.get('extension') and 'image_not_available' not in thumbnail.get('path'):
                    valid_series.append(serie)

            context['series'] = valid_series

        except requests.exceptions.RequestException as e:
            context['error'] = f"Erreur lors de l'appel à l'API des séries : {str(e)}"
            print(f"Erreur API: {e}")

        except KeyError:
            context['error'] = "Impossible de récupérer les données des séries."

        return context
