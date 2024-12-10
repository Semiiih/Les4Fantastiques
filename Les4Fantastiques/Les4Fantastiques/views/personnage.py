from django.views.generic import TemplateView
import requests

API_URL = "https://dylanprof.pythonanywhere.com/characters/"

class PersonnageView(TemplateView):
    template_name = "personnage.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        try:
            response = requests.get(API_URL, verify=False)  
            response.raise_for_status()  
            data = response.json()  
            
            characters = data.get('data', {}).get('results', [])
            valid_characters = []

            for character in characters:
                thumbnail = character.get('thumbnail', {})
                if thumbnail.get('path') and thumbnail.get('extension') and 'image_not_available' not in thumbnail.get('path'):
                    valid_characters.append(character)

            context['characters'] = valid_characters

        except requests.exceptions.SSLError as ssl_error:
            context['error'] = "Erreur SSL lors de l'appel à l'API Marvel. Vérifiez votre connexion ou les certificats."
            print(f"Erreur SSL: {ssl_error}")

        except requests.exceptions.RequestException as e:
            context['error'] = f"Erreur lors de l'appel à l'API Marvel : {str(e)}"

        except KeyError:
            context['error'] = "Impossible de récupérer les données des personnages Marvel."

        return context
