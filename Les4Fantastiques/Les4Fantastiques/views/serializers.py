# serializers.py
from rest_framework import serializers

class MarvelCharacterSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    name = serializers.CharField(max_length=255)
    description = serializers.CharField(max_length=1000, allow_blank=True)
    thumbnail = serializers.DictField()

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        if 'path' in instance.get('thumbnail', {}) and 'extension' in instance.get('thumbnail', {}):
            representation['thumbnail_url'] = f"{instance['thumbnail']['path']}.{instance['thumbnail']['extension']}"
        return representation
