# Tuto Symfony

_Inspired from [Lior CHAMLA](https://www.youtube.com/channel/UCS71mal_TkTW_PpZR9YLpIA "Lior CHAMLA") tutorial on **Symfony development**. Playlist YouTube [here](https://www.youtube.com/playlist?list=PLpUhHhXoxrjdQLodxlHFY09_9XzqdPBW8 "Syfony Development")_

Tutoriel Symfony - Création d'un site internet

## Prérequis

- Site officiel de Symfony et documentation [ici](https://symfony.com/ "Symfony official website")
- PHP 7.2 minimum
- Composer

## Initialisation du projet

Création du projet via **Composer** suivant une architecture pré-configurée `symfony/website-skeleton`, nommée **tuto-symfony** : `composer create-project symfony/website-skeleton tuto-symfony`

Se déplacer dans le projet `cd tuto-symfony`

## Installer un serveur local

Cette partie n'est plus d'actualité :

```
Création via **Composer** d'un serveur local pour y host le projet. Renseigner la version de la dépendance ([source](https://packagist.org/packages/symfony/web-server-bundle "Packagist Symfony server")) :

`composer require symfony/web-server-bundle --dev ^4.4.7`

Si un message d'erreur de ce type apparait, vérifier la version de la dépendance ([sujet stackoverflow](https://stackoverflow.com/a/59542164/7998119 "StackOverflow")) :
```

Import du package de fixtures pour créer des MOOC (jeux de données fictives) : `composer require orm-fixtures --dev`

## Run the serve

Taper la commande suivante afin de lancer le serveur : `php bin/console server:run`

## Créer un controller

Le controller permet de recevoir les requêtes faites à l'application, de construire la réponse et de la renvoyer : `php bin/console make:controller` puis choisir le nom du controller à créer, ici **BlogController**

## Créer la base de données

Il faut modifier le fichier `.env` à la racine pour pouvoir se connecter à la base de données etpermettre à Symfony d'intéragir avec : `DATABASE_URL=mysql://db_user:db_password@127.0.0.1:3306/db_name?serverVersion=5.7`.

Symfony permet de créer la base de données directement avec le terminal : `php bin/console doctrine:database:create`

## Créer les classes / entity

Chaque **classe** Symfony est reprsenté par une **entity**. Une fois de plus la génération d'une classe/entity se fait vian terminal : `php bin/console make:entity`.

Dans le terminal, lors de la création des entités, définir les propriétés de cette dernière qui reflèteront les colonnes de la table associée.

La création des entités et des propriétés ne se répercutent pas directement dans la base de données. Il faut créer les migrations à partir des entiés afin de préparer les scripts SQL : `php bin/console make:migration`.

Une fois la création des migrations terminée, on exécute lesscripts afin de mettre à jour la base de données : `php bin/console doctrine:migrations:migrate`.

## Créer des fixtures

Les fixtures sont des jeux de données fictives créées pour alimenter l'application sans avoir a créer manuellement ces datas.

Après l'exécution des scripts de migration dans la base de données, on peut créer des **fixtures** pour les utiliser dans l'application : `php bin/console make:fixtures`. On retrouvera les fichiers PHP associés via ce chemin : `src/DataFixtures`.

Dans le fichier `ArticleFixtures.php`, on instancie l'objet associé à la fixture en définissant ses paramètres. Une fois créée, on prépare les données pour les faire persister dans le temps `$manager->persist();` puis pour les faire exister dans la base de données `$manager->flush();`.

Pour charger les fixtures dans la base de données, il faut exécuter la commande suivante : `php bin/console doctrine:fixtures:load`. **Attention, cette commande purge la base de données pour y insérer les nouvelles données !**

```php
class ArticleFixtures extends Fixture {
  public function load(ObjectManager $manager) {
    for ($i = 1; $i <= 10; $i++) {
      $article = new Article();
      $article->setTitle("Titre de l'article n°$i")
        ->setContent("<p>Contenu de l'article n°$i</p>")
        ->setImage("http://placehold.it/350x150")
        ->setCreatedAt(new \DateTime());
      $manager->persist($article);
    }
    $manager->flush();
  }
}
```
