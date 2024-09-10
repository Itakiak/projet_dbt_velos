# Projet : Le vélo en ville

## Contexte
Il s'agit du repertoire de sauvegarde des modèles DBT du projet "Le vélo en ville" qui a pour objectif d'analyser l'utilisation des vélos dans la ville de Lyon entre 2016 et 2024. Il inclut l’étude des passages devant les bornes de comptage, la diversité des offres de vélos (privées et publiques), l’impact de la topographie, l’attrait des arrondissements et les effets de la météo.

## Stack technique
- **DBT** : Pour la gestion des transformations de données.

## Structure du Repo
- `/models` : Modèles DBT pour les transformations de données.
  - `01-staging` : versions des tables pre-cleaned sur Python
  - `02-intermidiate` : versions des tables après premières transformations
  - `03-mart` : versions finales des tables utilisées

## Installation
Clonez ce dépôt :  
   `git clone https://github.com/Itakiak/projet_dbt_velos.git`
