# Tuto Symfony

_Inspired from [Lior CHAMLA](https://www.youtube.com/channel/UCS71mal_TkTW_PpZR9YLpIA "Lior CHAMLA") tutorial on **Symfony development**. Playlist YouTube [here](https://www.youtube.com/playlist?list=PLpUhHhXoxrjdQLodxlHFY09_9XzqdPBW8 "Syfony Development")_

Tutoriel Symfony - Création d'un site internet

# Dockerization

La dockerization du projet a été effectuée en suivant les instructions de ce [tutoriel](https://knplabs.com/en/blog/how-to-dockerise-a-symfony-4-project "KNP Labs").

To run the Grafikart Projetct `docker-compose -f docker-compose-grafikart.yml -f docker-compose-grafikart.override.yml up -d`

To run the Lior Projetct `docker-compose -f docker-compose-lior.yml -f docker-compose-lior.override.yml up -d`

# ToDo

Liste de features interessantes à ajouter au projet GrafikArt :

- [ ] Revoir la partie des images en cache [ici](https://youtu.be/OZBVd4ZTIqk?t=1857). Les miniatures d'images en cache ne se suppriment pas quand on en réupload une nouvelle

Liste de features interessantes à ajouter au projet Lior :

- [ ] Comment gérer une option "Se rappeler de moi" : [ici](https://symfony.com/doc/current/security/remember_me.html "Symfony")
- [ ] Comment gérer les accès dans le controller : [ici](https://symfony.com/doc/current/security/securing_services.html "Symfony")
- [ ] Comment rediriger là où on veut après le login : [ici](https://symfony.com/doc/current/security/form_login.html "Symfony")
- [ ] Comment utiliser les annotations pour sécuriser les controller : [ici](https://symfony.com/doc/master/bundles/SensioFrameworkExtraBundle/annotations/security.html "Symfony")

## Liens utiles

- Site officiel de Symfony (et sa documentation) : [ici](https://symfony.com/)
- Tutoriel officiel de présentation du composant Security : [ici](https://symfony.com/doc/current/security.html)
- Mieux comprendre les Firewalls : [ici](https://symfony.com/doc/current/security/firewall_restriction.html)
- Documentation sur l'option form_login : [ici](https://symfony.com/doc/current/security/form_login_setup.html)
- Comment charger les utilisateurs à partir de la base de données : [ici](https://symfony.com/doc/current/security/user_provider.html)
- Comment utiliser le UserPasswordEncoder : [ici](https://symfony.com/doc/current/security.html)
- Créer un lien de déconnexion : [ici](https://symfony.com/doc/current/security.html#security-logging-out)
- Comment accéder à l'utilisateur connecté dans Twig : [ici](https://symfony.com/doc/current/templates.html#content_wrapper)
- Documentation complète du fichier de configuration du package Security : [ici](https://symfony.com/doc/current/reference/configuration/security.html)

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

Mise à jour des dépendances obsolètes : `composer require laminas/laminas-code laminas/laminas-eventmanager`

## Run the serve

Taper la commande suivante afin de lancer le serveur : 
```shell
composer install
symfony server:start
```

## Créer la base de données

Il faut modifier le fichier `.env` à la racine pour pouvoir se connecter à la base de données etpermettre à Symfony d'intéragir avec : `DATABASE_URL=mysql://db_user:db_password@127.0.0.1:3306/db_name?serverVersion=5.7`.

Symfony permet de créer la base de données directement avec le terminal : `php bin/console doctrine:database:create`

## Créer un controller

Le controller permet de recevoir les requêtes faites à l'application, de construire la réponse et de la renvoyer : `php bin/console make:controller` puis choisir le nom du controller à créer, ici **BlogController**

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

Dans le fichier *Twig* :

```php
<form action="{{ path('admin_property_delete', {id: property.id}) }}" method="post" style="display: inline-block;" onsubmit="return confirm('Confirmer la suppression')">
  <input type="hidden" name="_method" value="DELETE">
  <input type="hidden" name="_token" value="{{ csrf_token('delete' ~ property.id) }}">
  <button class="btn btn-danger">Supprimer</button>
</form>
```

Dans le *controller* :
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
  - Dans la fonction *configureOptions()* on ajoute la ligne `'translation_domain' => 'forms'`.
  - On créé le fichier de traduction `translations/forms.fr.yaml` où on mets les mots et leur traduction `City: Ville` ou `Zipcode: Code postal`.
  - Dans le fichier `config/packages/translation.yml` on retrouve la configuration de la traduction. changer le **default_locale** en `'%locale%'` et **fallbacks** en `'%locale%'` (avec les guillemets).
  - Dans le fichier `config/services.yaml` ajouer ou modifier **parameter** en ajoutant la ligne suivante : `locale: 'fr'

### Editer les input

Pour formatter un INPUT, comme mettre des espaces entre les milliers :


## Utiliser un thème

Il y a possibilité d'utiliser des thèmes qui faudra définir au sein du projet, par epmple pour mettre en forme les formulaires vu dans [cette partie](#creer-un-formulaire "Créer un formulaire").

Modifier le fichier `config/packages/twig.yaml` et ajouter à *twig* le `form_themes: ['bootstrap_4_layout.html.twig']`

## Envoi de mail

Pour l'envoi de mail, on utilise [MailDev](http://maildev.github.io/maildev/ "MailDev") pour simuler la réception des mails. Son interface est accessible via le port [localhost:1080](localhost:1080 "MailDev Localhost").

Pour ma part j'utilise la version **Docker** de l'application et me connecte à l'adresse du docker [http://localhost:1080](http://localhost:1080 "MailDev") :

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

## Utiliser du JS dans Symfony

Afin d'utiliser du Javascript, Symfony propose une librairie appelée **[Symfony Encore Webpack](https://symfony.com/doc/current/frontend.html "Symfony Encore Webpack")**. Il faudra exécuter la commande suivante :