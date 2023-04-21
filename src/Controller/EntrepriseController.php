<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class EntrepriseController extends AbstractController
{
    #[Route('/entreprise', name: 'app_entreprise')]
    public function index(): Response
    {
        $tableau = ["valeur 1", "valeur 2", "valeur 3", "valeur 4"];
        return $this->render('entreprise/index.html.twig', [
            'name' => 'Mickeal',
            'tableau' => $tableau
        ]);
    }
}
