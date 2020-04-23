# Tuto Symfony

*Inspired from [Lior CHAMLA](https://www.youtube.com/channel/UCS71mal_TkTW_PpZR9YLpIA "Lior CHAMLA") tutorial on **Syfony development**. Playlist YouTube [here](https://www.youtube.com/playlist?list=PLpUhHhXoxrjdQLodxlHFY09_9XzqdPBW8 "Syfony Development")*

Tutoriel Symfony - Création d'un site internet

## Prérequis

- Site officiel de Symfony et documentation [ici](https://symfony.com/ "Symfony official website")
- PHP 7.2 minimum
- Composer

## Initialisation du projet

Création du projet via **Composer** suivant une architecture pré-configurée `symfony/website-skeleton`, nommée **tuto-symfony** :

`composer create-project symfony/website-skeleton tuto-symfony`

Se déplacer dans le projet `cd tuto-symfony`

## Installer un serveur local

Création via **Composer** d'un serveur local pour y host le projet. Renseigner la version de la dépendance ([source](https://packagist.org/packages/symfony/web-server-bundle "Packagist Symfony server")) :

`composer require symfony/web-server-bundle --dev ^4.4.7`

Si un message d'erreur de ce type apparait, vérifier la version de la dépendance ([sujet stackoverflow](https://stackoverflow.com/a/59542164/7998119 "StackOverflow")) :

```shell
In InitCommand.php line 706:
                                                                                
  Could not find package symfony/web-server-bundle in a version matching 5.0.*  
                                                                                
```

## Run the serve

Taper la commande suivante afin de lancer le serveur : `php bin/console server:run`