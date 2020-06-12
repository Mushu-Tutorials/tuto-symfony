<?php

namespace App\Controller\Admin;

use App\Entity\Property;
use App\Form\PropertyType;
use App\Repository\PropertyRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminPropertyController extends AbstractController
{
  /**
   * @Route("/admin", name="admin_property_index")
   */
  public function index(PropertyRepository $repository)
  {
    $properties = $repository->findAll();

    return $this->render('admin/index.html.twig', [
      'controller_name' => 'AdminPropertyController',
      'properties' => $properties,
    ]);
  }

  /**
   * @Route("/admin/property/new", name="admin_property_new")
   * @Route("/admin/property/{id}", name="admin_property_edit", methods="GET|POST")
   */
  public function form(Property $property = null, Request $request, EntityManagerInterface $manager)
  {
    if (!$property) {
      $property = new Property;
    }

    /**
     * Appel de la classe PropertyType pour générer le formulaire
     * Prérequis : Avoir exécuté la commande `php bin/console make:form`
     */
    $form = $this->createForm(PropertyType::class, $property);

    /**
     * handleRequest() permet d'analyser la requête
     */
    $form->handleRequest($request);

    /**
     * Vérification de la requête, persistance, enregistrement, création puis redirection
     */
    if ($form->isSubmitted() && $form->isValid()) {
      if (!$property->getId()) {
        $property->setCreatedAt(new \DateTime);
      }
      $manager->persist($property);
      $manager->flush();

      return $this->redirectToRoute('admin_property_index');
    }

    return $this->render('admin/create.html.twig', [
      'property' => $property,
      'form' => $form->createView(),
      'editMode' => $property->getId() !== null,
    ]);
  }

  /**
   * Tuto : https://youtu.be/6Ryu7-VSV5k?t=1593
   * 
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
}
