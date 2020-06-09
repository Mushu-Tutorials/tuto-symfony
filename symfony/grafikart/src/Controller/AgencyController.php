<?php

namespace App\Controller;

use App\Entity\Property;
use App\Repository\PropertyRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AgencyController extends AbstractController
{
	// /**
	//  * @Route("/agency", name="agency")
	//  */
	// public function index()
	// {
	// 	return $this->render('agency/index.html.twig', [
	// 		'controller_name' => 'AgencyController',
	// 	]);
	// }

	/**
	 * @Route("/", name="home")
	 */
	public function home(PropertyRepository $repository): Response
	{
		$properties = $repository->findLatest();

		return $this->render('agency/home.html.twig', [
			'properties' => $properties,
		]);
	}

	/**
	 * @Route("/add", name="agency_create")
	 */
	public function create(): Response
	{
		return $this->render('agency/create.html.twig', [
			'current_page' => 'create_properties',
		]);
	}

	/**
	 * @Route("/biens", name="agency_properties")
	 */
	public function properties(EntityManagerInterface $manager, PropertyRepository $repository): Response
	{
		// $property = new Property;
		// $property->setTitle('Mon premier bien')
		// 	->setPrice(200000)
		// 	->setRooms(4)
		// 	->setBedrooms(3)
		// 	->setDescription('Description ici')
		// 	->setSurface(60)
		// 	->setFloor(4)
		// 	->setHeat(1)
		// 	->setCity('Montpellier')
		// 	->setAddress('15 Boulevard Gambetta')
		// 	->setZipcode('34000');

		// $manager->persist($property);
		// $manager->flush();

		$property = $repository->findAllVisible();
		dump($property);

		return $this->render('agency/properties.html.twig', [
			'current_page' => 'show_properties',
		]);
	}

	/**
	 * @Route("/biens/{id}-{slug}", name="agency_show", requirements={"slug": "[a-z0-9\-]*"})
	 */
	public function show(Property $property, string $slug): Response
	{
		/**
		 * IF pemettant la vérification du slug.
		 * Si on est sur l'objet Property et qu'on modifie le slug
		 * Ce dernier nous redirigera sur la même page avec le slug qui correspond à l'objet
		 */
		if ($property->getSlug() !== $slug) {
			return $this->redirectToRoute('agency_show', [
				'id' => $property->getId(),
				'slug' => $property->getSlug(),
			], 301);
		}

		return $this->render('agency/show.html.twig', [
			'property' => $property,
			'current_page' => 'show_properties',
		]);
	}
}
