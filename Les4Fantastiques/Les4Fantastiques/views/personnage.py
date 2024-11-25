from django.views.generic import TemplateView
import hashlib
import requests
from datetime import datetime



from django.views.generic import TemplateView
import json
import os
import os
import json
from django.conf import settings




from django.views.generic import TemplateView
import requests
import hashlib
import time


from marvel import Marvel
from marvel.exceptions import MarvelException


# Clés Marvel
# PUBLIC_KEY = "819bf36e600faa8dba5d37abc18ce47b"
# PRIVATE_KEY = "705034aa77b79b0b158adb0473d6cd07a68a5c5d"

# m = Marvel(PUBLIC_KEY, PRIVATE_KEY)
# characters = m.characters  


# class PersonnageView(TemplateView):
#     template_name = "personnage.html"

#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)

#         try:
#             all_characters = characters.all(limit=20)
#             context['characters'] = all_characters['data']['results'] 

#         except MarvelException as e:
#             context['error'] = f"Erreur Marvel API : {str(e)}"

#         except Exception as e:
#             context['error'] = f"Erreur inattendue : {str(e)}"

#         return context

from marvel import Marvel
from django.views.generic import TemplateView
import requests

# API_URL = "https://gateway.marvel.com/v1/public/characters?ts=1&apikey=819bf36e600faa8dba5d37abc18ce47b&hash=a18d492c1d8426fc7647581293cb145e"
API_URL = "https://gateway.marvel.com/v1/public/characters?ts=1&apikey=eb79c3a5b07c45555c5af6c1ca4be64e&hash=a18d492c1d8426fc7647581293cb145e"

class PersonnageView(TemplateView):
    template_name = "personnage.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        try:
            response = requests.get(API_URL, verify=False)  
            response.raise_for_status()  
            data = response.json()  
            print(data, 'iiiviiiiiii')
            characters = data.get('data', {}).get('results', [])
            context['characters'] = characters

        except requests.exceptions.SSLError as ssl_error:
            context['error'] = "Erreur SSL lors de l'appel à l'API Marvel. Vérifiez votre connexion ou les certificats."
            print(f"Erreur SSL: {ssl_error}")

        except requests.exceptions.RequestException as e:
            context['error'] = f"Erreur lors de l'appel à l'API Marvel : {str(e)}"

        except KeyError:
            context['error'] = "Impossible de récupérer les données des personnages Marvel."

        return context




# class PersonnageView(TemplateView):
#     template_name = "personnage.html"

#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)

#         json_path = os.path.join(settings.BASE_DIR, 'Les4Fantastiques/views/appelCharacterMarvel.json')

#         try:
#             with open(json_path, 'r') as file:
#                 data = json.load(file)
#                 characters = data.get('data', {}).get('results', [])
#                 context['characters'] = characters
#         except FileNotFoundError:
#             context['error'] = 'Le fichier JSON n\'a pas été trouvé.'
#         except json.JSONDecodeError:
#             context['error'] = 'Erreur lors de la lecture du fichier JSON.'

#         return context



# class PersonnageView(TemplateView):
#     template_name = "personnage.html"

#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)

#         public_key = '819bf36e600faa8dba5d37abc18ce47b'
#         private_key = '705034aa77b79b0b158adb0473d6cd07a68a5c5d'
#         timestamp = str(int(datetime.timestamp(datetime.now())))
#         hash_value = hashlib.md5(f'{timestamp}{private_key}{public_key}'.encode()).hexdigest()

#         print(f"Hash Value: {hash_value}")
#         print(f"timestamp: {timestamp}")

#         url = "https://gateway.marvel.com:443/v1/public/characters"
#         params = {
#             'ts': timestamp,
#             'apikey': public_key,
#             'hash': hash_value,
#             'limit': 20  
#         }
#         try:
#             response = requests.get(url, params=params)
#             response.raise_for_status()
#             data = response.json()
#             characters = data.get('data', {}).get('results', [])
#             context['characters'] = characters
#         except requests.exceptions.RequestException as e:
#             context['error'] = str(e)

#         return context
