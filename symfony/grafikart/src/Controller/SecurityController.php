<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{
  /**
   * @Route("/security", name="security")
   */
  public function index()
  {
    return $this->render('security/index.html.twig', [
      'controller_name' => 'SecurityController',
    ]);
  }

  /**
   * @Route("/login", name="security_login")
   */
  public function login(AuthenticationUtils $authenticationUtils)
  {
    $error = $authenticationUtils->getLastAuthenticationError();
    $lastUsername = $authenticationUtils->getLastUsername();

    return $this->render('security/login.html.twig', [
      'controller_name' => 'SecurityController',
      'error' => $error,
      'last_username' => $lastUsername,
    ]);
  }

  /**
   * @Route("/logout", name="security_logout")
   */
  public function logout(AuthenticationUtils $authenticationUtils)
  {
  }
}
