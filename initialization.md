# How to start Symfony Project

## Initialisation du projet

Création du projet :

```shell
composer create-project symfony/website-skeleton symfony
cd symfony
```

## Installer les dépendances requises

Installationn et mise a jour des dépendances obsolètes ainsi que Webpack :

```shell
composer require laminas/laminas-code laminas/laminas-eventmanager
composer require orm-fixtures fzaninotto/faker --dev
composer require symfony/webpack-encore-bundle
```

## Run the serve

Taper la commande suivante afin de lancer le serveur :

```shell
composer install
symfony server:start
```

## Créer la base de données

Modification du fichier `.env` à la racine du projet : `DATABASE_URL=mysql://db_user:db_password@127.0.0.1:3306/db_name?serverVersion=5.7`.

Création de la base de données : `php bin/console doctrine:database:create`

## Créer le controller

```shell
php bin/console make:controller AppController
```

Editer les pages de base pour avoir le template souhaité sur l'ensemble des pages du site dans le dossier `templates` : `base.html.twig` et le fichier twig associé a votre controller, ici, `app/home.html.twig`.

### Ajouter une liste de produits

#### Ajouter au Controller

Créer la route de la page des produits dans le `AppController.php` :

```php
/**
 * @Route("/products", name="app_products")
 */
public function products()
{
  return $this->render('app/products.html.twig', [
    'controller_name' => 'AppController',
  ]);
}
```

#### Créer la vue

Créer lefichier **Twig** dans le répertoire de s templates `templates/app/products.html.twig`

#### Créer l'entité Product

```shell
php bin/console make:entity Product
php bin/console make:migration
php bin/console doctrine:migrations:migrate
```

#### Gérer les Products

La gestion d'un produit se fait a plusieurs endroits. 

- Au niveau du Controller `App/Controller/AppController.php`, où on peut le créer, le modifier, le récupérer...
- Au niveau du **Repository** `App/Repository/ProductRepository.php` qui permet l'intéraction avec la base de données (GET, POST, PUT, DELETE)
- Au niveau de la vue `templates/app/products.html.twig` pour gérer l'affichage souhaité du produit

#### Créer des Fixtures

Créer des fixtures permet de simuler des jeux de données. Pour cela on utilise la librairie [Faker](https://github.com/fzaninotto/Faker "Faker") via la commande `composer require fzaninotto/faker --dev`

Dans le fichier `App/DataFixtures/ProductFixtures.php` on ajoute la classe suivante pour créer des fausses données :

```php
namespace App\DataFixtures;

use App\Entity\Product;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class ProductFixtures extends Fixture
{
  public function load(ObjectManager $manager)
  {
    $faker = \Faker\Factory::create('fr_FR');
    /**
     * Créer entre 10 et 20 produits
     */
    for ($j = 1; $j <= mt_rand(10, 20); $j++) {
      $product = new Product;
      $product
        ->setName($faker->words(3, true))
        ->setCode($faker->ean13);
      $manager->persist($product);
    }
    $manager->flush();
  }
}
```

Puis on importe les données en base via la commande : `php bin/console doctrine:fixtures:load`. **ATTENTION** cela écrase toute la base de données.

#### Afficher un produit via formulaire

Création du formulaire **ProductType** rattaché à l'entity **Product**

```shell
php bin/console make:form ProductType
```

## Créer l'entité User

```shell
php bin/console make:entity User
php bin/console make:migration
php bin/console doctrine:migrations:migrate
```

#### Login d'un user

**Faire en fonction des roles : ADMIN ou USER**

Modifier le fichier `./config/packages/security.yaml` afin de permettre la connexion des utilisateurs en s'appuyant sur la configuration définie dans ce fichier (ici la base de données).

```
security:
  encoders:
    App\Entity\User:
      algorithm: bcrypt
      cost: 12

  providers:
    users_in_memory:
      memory:
        users:
          demo_user:
            password: demo
            roles: ROLE_ADMIN
    in_database:
      entity:
        class: App\Entity\User
        property: username

  firewalls:
    dev:
      pattern: ^/(_(profiler|wdt)|css|images|js)/
      security: false
    main:
      anonymous: true
      lazy: true
      # provider: users_in_memory
      provider: in_database

      form_login:
        check_path: security_login

      logout:
          path: security_logout
          target: /
  access_control:
    - { path: ^/admin, roles: ROLE_ADMIN }
    # - { path: ^/profile, roles: ROLE_USER }
```

L'objet User doit maintenant implémenter la **UserInterface** du composant **Security**, ajouter à l'entité :

```php
<?php

use Symfony\Component\Security\Core\User\UserInterface;

class User implements UserInterface {
  // ...
}
```

```shell
php bin/console make:controller SecurityController
```

### Créer des fixtures

```shell
php bin/console make:fixtures
php bin/console doctrine:fixtures:load
```

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

## Créer un formulaire

Pour ajouter un thème se référer au chapitre "[Utiliser un thème](#utiliser-un-theme "Utiliser un thème")".

Créer un formulaire via la commande suivante. **ATTENTION : Le nom du formulaire doit finir par Type.**

```shell
php bin/console make:form
ArticleType
```

### Supprimer une entité

Référence : [Tuto Grafikart (30'49)](https://youtu.be/6Ryu7-VSV5k?t=1593 "Tuto Grafikart")

Dans une liste d'entité, pour ajouter la suppression d'un élément, il faut ajouter un mini formulaire postant une requête de suppression. **Afin d'éviter tout piratage, des tokens CSRF sont ajoutés automatiquement après le dernier champ d'un formulaire. Sans, le formulaire sera invalide et empèchera son envoi via la requête.**

Dans le cas de la suppression d'une entité, il faudra générer ce TOKEN CSRF.

Dans le fichier _Twig_ :

```php
<form action="{{ path('admin_property_delete', {id: property.id}) }}" method="post" style="display: inline-block;" onsubmit="return confirm('Confirmer la suppression')">
  <input type="hidden" name="_method" value="DELETE">
  <input type="hidden" name="_token" value="{{ csrf_token('delete' ~ property.id) }}">
  <button class="btn btn-danger">Supprimer</button>
</form>
```

Dans le _controller_ :

```php
/**
 * @Route("/admin/property/{id}", name="admin_property_delete", methods="DELETE")
 */
public function delete(Property $property = null, Request $request, EntityManagerInterface $manager)
{
  /**
   * Pour ajouter de la sécurité sur la suppression d'un bien,
   * On ajoute une gestion des TOKENS CSRF
   *
   * Sur la vue, on ajoute un champ INPUT HIDDEN (<input type="hidden" name="_token" value="{{ csrf_token('delete' ~ property.id) }}">)
   * Avec un token généré en fonction de l'objet choisi
   *
   * Dans le Controller, on ajoute le code ci-dessous
   *   isCsrfTokenValid('valeur du token', 'récupération du name _token')
   */
  if ($this->isCsrfTokenValid('delete' . $property->getId(), $request->get('_token'))) {
    $manager->remove($property);
    $manager->flush();

    // return new Response('Suppression');
  }

  return $this->redirectToRoute('admin_property_index');
}
```

### Modifier les labels

Il y a plusieurs méthodes afin de mofifier les labels :

- Dans le formulaire de l'objet **MyObjectType.php**, sur le champ à modifier, ajouter les options à modifier :

```php
$builder
  ->add('address')
  ->add('city', null, [
    'label' => 'Ville'
  ]);
```

- Au niveau des traductions de la page du formulaire **MyObjectType.php**
  - Dans la fonction _configureOptions()_ on ajoute la ligne `'translation_domain' => 'forms'`.
  - On créé le fichier de traduction `translations/forms.fr.yaml` où on mets les mots et leur traduction `City: Ville` ou `Zipcode: Code postal`.
  - Dans le fichier `config/packages/translation.yml` on retrouve la configuration de la traduction. changer le **default_locale** en `'%locale%'` et **fallbacks** en `'%locale%'` (avec les guillemets).
  - Dans le fichier `config/services.yaml` ajouer ou modifier **parameter** en ajoutant la ligne suivante : `locale: 'fr'

### Editer les input

Pour formatter un INPUT, comme mettre des espaces entre les milliers :

## Utiliser un thème

Il y a possibilité d'utiliser des thèmes qui faudra définir au sein du projet, par epmple pour mettre en forme les formulaires vu dans [cette partie](#creer-un-formulaire "Créer un formulaire").

Modifier le fichier `config/packages/twig.yaml` et ajouter à _twig_ le `form_themes: ['bootstrap_4_layout.html.twig']`

## Envoi de mail

Pour l'envoi de mail, on utilise [MailDev](http://maildev.github.io/maildev/ "MailDev") pour simuler la réception des mails. Son interface est accessible via le port [localhost:1080](localhost:1080 "MailDev Localhost").

Pour ma part j'utilise la version **Docker** de l'application :

```shell
docker pull djfarrelly/maildev
docker run -p 1080:80 -p 1025:25 djfarrelly/maildev
```

Dans le fichier `.env` du projet, il faut modifier la configuration afin d'activer les échanges de mail en ajoutant `MAILER_URL=smtp://localhost:1025`

Créer les fonctions et fichiers associés à la gestion des mails :

- Un objet `Entity/Contact.php` permettant l'instanciation d'un mail.
- Un formulaire `Form/ContactType.php` permettant la génération d'un formulaire de contact.
- Une partie **Vue** du formulaire affichée dans `grafikart/templates/agency/show.html.twig`
- Un controller `Notification/ContactNotification.php` dans un dossier séparé destiné à la gestion globale d'évènements, ici la gestion de mails

```php
namespace App\Notification;

use App\Entity\Contact;
use Swift_Message;
use Twig\Environment;

class ContactNotification
{
  /**
   * @var \Swift_Mailer
   */
  private $mailer;

  /**
   * @var Environment
   */
  private $renderer;

  public function __construct(\Swift_Mailer $mailer, Environment $renderer)
  {
    $this->mailer = $mailer;
    $this->renderer = $renderer;
  }

  public function notify(Contact $contact)
  {
    $message = (new Swift_Message('Agence : ' . $contact->getProperty()->getTitle()))
      /**Possibilité de mettre le mail du client directement */
      // ->setFrom($contact->getEmail())
      ->setFrom('noreply@agence.fr')
      ->setTo('contact@agence.fr')
      ->setReplyTo($contact->getEmail())
      ->setBody($this->renderer->render('email/contact.html.twig', [
        'contact' => $contact,
      ]), 'text/html');
    $this->mailer->send($message);
  }
}
```

- Une **Vue** d'un mail type `templates/emails/contact.html.twig` généré à partir d'un outil en ligne : [mjml.io](https://mjml.io/ "mjml.io")

```php
Exemple ici
```