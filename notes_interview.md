# Notes Entretien MFB

## Éléments à montrer et expliquer

## Models

- [x] Validations (`presence: true` dans les models `Exercise` et `User`)
- [x] Relations (exemple : model `Exercise`)

  ```ruby
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :exercise_instruments
  has_many :instruments, through: :exercise_instruments
  ```

- [x] Méthodes (`full_name` dans `User`)

### Views

- [x] Partials : mutualisation du code d'affichage des erreurs dans un formulaire (voir `shared/_error_messages.html.slim`)
- [x] Form builder personnalisé : permet d'appliquer le même style sur tous les formulaires de l'app (voir [`nom_fichier`]) -> TODO, adapter les formulaires de Devise au builder personnalisé
- [x] Utilisation de Hotwire
  - [x] Utilisation de Turbo
  - [x] Utilisation de Stimulus (voir menu burger et système de light / dark mode)

### Controllers

- [x] CRUD de base -> TODO, autres routes, actions, etc à revoir plus tard
- [x] Strong params (voir `exercise_params`)
- [x] Gestion de l'accès aux pages selon si l'utilisateur est connecté ou non (voir callback `before_action` et méthode `require_login`)

### Tests - TODO, via RSpec

- [x] Tests de models (tests de validation du model `Exercise`)
- [x] Factories (FactoryBot, models `Exercise` et `User`)
- [ ] Tests de controllers (tests de vérification de la redirection en cas d'utilisateur non connecté)
- [ ] Tests d'intégration (...) -> utiliser Capybara

## Prise de notes pendant l'entretien
