from datetime import datetime
from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.utils import timezone

class Question(models.Model):
    # Texte de la question
    question_text = models.CharField(max_length=255)  # Champ pour le texte de la question
    
    # Bonne réponse (en texte, utilisée pour la correspondance éventuelle)
    correct_answer = models.CharField(max_length=255, default="")  # Bonne réponse associée à la question
    
    # Niveau de difficulté (Facile, Moyen, Difficile)
    difficulty_level = models.CharField(
        max_length=50,
        choices=[
            ('Facile', 'Facile'),
            ('Moyen', 'Moyen'),
            ('Difficile', 'Difficile')
        ],
        default='Facile'
    )
    
    # Catégorie de la question

    category = models.CharField(max_length=100, default='Héros')  # Ajout d'un default ici

    # Date de création
    created_at = models.DateTimeField(auto_now_add=True, default=datetime.now())

    def __str__(self):
        return self.question_text


class Choice(models.Model):
    # Association avec une question
    question = models.ForeignKey(
        Question, 
        related_name='choices',  # Permet de récupérer facilement les choix liés à une question
        on_delete=models.CASCADE  # Supprimer les choix si la question est supprimée
    )
    
    # Texte du choix
    choice_text = models.CharField(max_length=255)  # Texte de la réponse
    
    # Indique si c'est la bonne réponse
    is_correct = models.BooleanField(default=False)

    def __str__(self):
        return self.choice_text
    

class Score(models.Model):
    user = models.OneToOneField(
        User, 
        on_delete=models.CASCADE, 
        related_name="score", 
        unique=True
    )  # Relie chaque utilisateur à un score unique
    best_score = models.IntegerField(max_length=100, default=0)  # Meilleur score de l'utilisateur
    updated_at = models.DateTimeField(auto_now=True)  # Date de mise à jour du score

    def __str__(self):
        return f"{self.user.username} - Meilleur score : {self.best_score}"
    