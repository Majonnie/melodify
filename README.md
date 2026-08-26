# melodify

## Besoins de l'application

Melodify est une application d'apprentissage de vocabulaire de la musique pour les enfants.
À l'aide d'images et de sons (si le temps le permet), l'utilisateur devra reconnaître l'instrument de musique représenté..
L'application devra être responsive, avoir un design simple mais propre, et utiliser les technologies demandées (cf. Exigences techniques).
La gestion des assets et le CRUD des exercices devront être maîtrisés.

## Exigences techniques

Melodify est un projet personnel servant de support à l'apprentissage des technologies suivantes :

- Rails 7
- Ruby 3.1
- Hotwire
- Tailwind (en priorité devant Bootstrap)
- L'application possèdera une version utilisant Tailwind, et l'autre Bootstrap (deux branches distinctes).

## Installation

...

## Configuration et base du projet

...

### Base de Données

Création de l'utilisateur sur PostgreSQL: `createuser --pwprompt --createdb melodify`, puis entrer le mot de passe présent dans le fichier `.env`.
(Suppression si nécessaire : `dropuser --if-exists melodify`).

Puis :
Création de la DB : `bundle exec rails db:create`
Migrations : `bin/rails db:migrate RAILS_ENV=development`

## Suite

.....
