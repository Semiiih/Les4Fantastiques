from datetime import datetime
from django.db import models
from django.contrib.auth.models import User

class Question(models.Model):
    # Texte de la question
    question_text = models.CharField(max_length=255)  # Champ pour le texte de la question

#Bonne réponse (en texte, utilisée pour la correspondance éventuelle)
    correct_answer = models.CharField(max_length=255, default="")  # Bonne réponse associée à la question

#Niveau de difficulté (Facile, Moyen, Difficile)
    difficulty_level = models.CharField(
        max_length=50,
        choices=[
            ('Facile', 'Facile'),
            ('Moyen', 'Moyen'),
            ('Difficile', 'Difficile')
        ],
        default='Facile'
    )

#Catégorie de la question
    category = models.CharField(max_length=100, default='Héros')  # Ajout d'un default ici

    # Date de création
    created_at = models.DateTimeField(auto_now_add=True)

    def str(self):
        return self.question_text


class Choice(models.Model):
    # Association avec une question
    question = models.ForeignKey(
        Question, 
        related_name='choices',  # Permet de récupérer facilement les choix liés à une question
        on_delete=models.CASCADE  # Supprimer les choix si la question est supprimée
    )

#Texte du choix
    choice_text = models.CharField(max_length=255)  # Texte de la réponse

#Indique si c'est la bonne réponse
    is_correct = models.BooleanField(default=False)

    def str(self):
        return self.choice_text
    


class CustomUser(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    mdp = models.CharField(max_length=64)
    created_at = models.DateTimeField(auto_now_add=True) 

    class Meta:
        db_table = 'user'



print('iciiiii', CustomUser.objects.all())
