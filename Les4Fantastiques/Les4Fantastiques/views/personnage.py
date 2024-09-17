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


# from marvel import Marvel

PUBLIC_KEY = '819bf36e600faa8dba5d37abc18ce47b'
PRIVATE_KEY = '705034aa77b79b0b158adb0473d6cd07a68a5c5d'
class PersonnageView(TemplateView):
    template_name = "personnage.html"

    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # m = Marvel(PUBLIC_KEY, PRIVATE_KEY)
        # characters = m.characters.all()
        # print(characters)

        
        # ts = str(int(time.time()))
        # hash_string = ts + PRIVATE_KEY + PUBLIC_KEY
        # hash_md5 = hashlib.md5(hash_string.encode()).hexdigest()

        # url = f"https://gateway.marvel.com/v1/public/characters?ts={ts}&apikey={PUBLIC_KEY}&hash={hash_md5}"

       
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
