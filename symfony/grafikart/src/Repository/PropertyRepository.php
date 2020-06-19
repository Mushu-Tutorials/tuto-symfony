<?php

namespace App\Repository;

use App\Entity\Property;
use App\Entity\PropertySearch;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Property|null find($id, $lockMode = null, $lockVersion = null)
 * @method Property|null findOneBy(array $criteria, array $orderBy = null)
 * @method Property[]    findAll()
 * @method Property[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PropertyRepository extends ServiceEntityRepository
{
  public function __construct(ManagerRegistry $registry)
  {
    parent::__construct($registry, Property::class);
  }

  /**
   * -----------------------------------------------------------------------------------
   * Création de méthodes personnalisées afin de faire une requête spécifique en base
   */
  /**
   * @return Property[] Returns an array of Property objects
   */
  public function findAllVisible(): array
  {
    return $this->findVisibleQuery()
      ->getQuery()
      ->getResult();
  }

  /**
   * -----------------------------------------------------------------------------------
   * Création de méthodes personnalisées afin de faire une requête spécifique en base
   */
  /**
   * @return Query Returns a Query of Property Objects
   */
  public function findAllVisibleQuery(PropertySearch $search): Query
  {
    $query = $this->findVisibleQuery();

    /**
     * S'il y a une recherche effectuée,
     * Ajoute à la Query une condition WHERE
     */
    if ($search->getMaxPrice()) {
      $query = $query
        ->andWhere('p.price <= :maxprice')
        ->setParameter('maxprice', $search->getMaxPrice());
    }
    if ($search->getMinSurface()) {
      $query = $query
        ->andWhere('p.surface >= :minsurface')
        ->setParameter('minsurface', $search->getMinSurface());
    }

    return $query->getQuery();
  }

  /**
   * @return Property[] Returns an array of Property objects
   */
  public function findLatest(): array
  {
    return $this->findVisibleQuery()
      ->setMaxResults(4)
      ->getQuery()
      ->getResult();
  }

  /**
   * Fonction privée évitant la redondance de la création du QueryBuilder dans les méthodes publiques personnalisées
   */
  private function findVisibleQuery(): QueryBuilder
  {
    return $this->createQueryBuilder('p')
      ->where('p.sold = false');
  }
  /**
   * -----------------------------------------------------------------------------------
   */

  // /**
  //  * @return Property[] Returns an array of Property objects
  //  */
  /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

  /*
    public function findOneBySomeField($value): ?Property
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
