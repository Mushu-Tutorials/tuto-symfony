<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 */
class User implements UserInterface, \Serializable
{
  /**
   * @ORM\Id()
   * @ORM\GeneratedValue()
   * @ORM\Column(type="integer")
   */
  private $id;

  /**
   * @ORM\Column(type="string", length=255)
   */
  private $username;

  /**
   * @ORM\Column(type="string", length=255)
   */
  private $password;

  public function getId(): ?int
  {
    return $this->id;
  }

  public function getUsername(): ?string
  {
    return $this->username;
  }

  public function setUsername(string $username): self
  {
    $this->username = $username;

    return $this;
  }

  public function getPassword(): ?string
  {
    return $this->password;
  }

  public function setPassword(string $password): self
  {
    $this->password = $password;

    return $this;
  }

  /**
   * @return (ROLE|string)[] The user roles
   */
  public function getRoles()
  {
    return ['ROLE_ADMIN'];
  }

  /**
   * @return string|null The salt
   */
  public function getSalt()
  {
    // you *may* need a real salt depending on your encoder
    // see section on salt below
    return null;
  }

  /**
   * @inheritDoc
   */
  public function eraseCredentials()
  {
  }

  /**
   * @see \Serializable::serialize()
   */
  public function serialize()
  {
    return serialize([
      $this->id,
      $this->username,
      $this->password,
      // see section on salt below
      // $this->salt,
    ]);
  }

  /**
   * @see \Serializable::unserialize()
   */
  public function unserialize($serialized)
  {
    list(
      $this->id,
      $this->username,
      $this->password,
      // see section on salt below
      // $this->salt
    ) = unserialize($serialized, ['allowed_classes' => false]);
  }
}
