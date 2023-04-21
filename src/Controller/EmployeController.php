<?php

namespace App\Controller;

use App\Entity\Employe;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class EmployeController extends AbstractController
{
    #[Route('/employe', name: 'app_employe')]
    public function index( ManagerRegistry $doctrine): Response
    {
        //recuperer les entreprise de la bdd
        $employes =  $doctrine->getRepository(Employe::class)->findAll();

        return $this->render('employe/index.html.twig', [
            'employes' => $employes
        ]);
    }
}
