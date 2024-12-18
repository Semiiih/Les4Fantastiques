# Les4Fantastiques

## Contexte:

L'objectif de ce projet est de créer un site qui met en avant l'univers Marvel. Les utilisateurs peuvent :

    -Explorer les personnages de l'univers Marvel.

    -Découvrir les séries associées aux héros et vilains.

    -S'amuser avec un mini-jeu, conçu pour divertir les fans tout en restant dans le thème de Marvel.

Le projet est développé en Python avec le framework Django.
Il suit une architecture MVC (Modèle - Vue - Contrôleur) et utilise une base de données SQLite par défaut,
mais il peut être configuré pour utiliser d'autres bases de données (PostgreSQL, MySQL, etc.).

## Installation et Paramètrage:

Clonez le dépôt : git clone https://github.com/Semiiih/Les4Fantastiques.git
cd Les4Fantastiques

Prérequis:

- `python3`
  <br>
- `pip`
  <br>

- Moyen de vérification : <br>
  - `python3 --version`
  - `pip --version`

## Base De Données:

- Création en local de la bdd les4fantastiques
- importer le fichier sql `les4fantastiques` dedans

## Dans les settings.py

- il faut s assurer d'avoir les bons ports et identifiants dans `DATABASES`

## Démarrage du projet :

Pour lancer en local : `python3 manage.py runserver`
