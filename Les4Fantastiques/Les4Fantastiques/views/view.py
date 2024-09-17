import hashlib
import requests
from datetime import datetime
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import MarvelCharacterSerializer
from django.conf import settings


class MarvelCharacterAPIView(APIView):

    def get(self, request, *args, **kwargs):
        public_key = '819bf36e600faa8dba5d37abc18ce47b'
        private_key = '705034aa77b79b0b158adb0473d6cd07a68a5c5d'
        timestamp = str(int(datetime.timestamp(datetime.now())))
        hash_value = hashlib.md5(f'{timestamp}{private_key}{public_key}'.encode()).hexdigest()

        url = "https://gateway.marvel.com:443/v1/public/characters"
        params = {
            'ts': timestamp,
            'apikey': public_key,
            'hash': hash_value,
            'limit': 20
        }

        try:
            response = requests.get(url, params=params, verify=False)
            response.raise_for_status()
            data = response.json()
            characters = data.get('data', {}).get('results', [])
            serializer = MarvelCharacterSerializer(characters, many=True)
            return Response(serializer.data)
        except requests.exceptions.RequestException as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
