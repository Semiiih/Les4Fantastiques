from django import template

register = template.Library()

@register.filter
def get_item(dictionary, key):
    """
    Récupère une valeur d'un dictionnaire en fonction de la clé.
    """
    return dictionary.get(str(key))
