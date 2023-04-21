<?php

namespace App\Controller;

use App\Entity\Entreprise;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class EntrepriseController extends AbstractController
{
    #[Route('/entreprise', name: 'app_entreprise')]
    public function index( ManagerRegistry $doctrine): Response
    {
        
        /**
         * @Route("/entreprise", name="app_entreprise")
         */
        $entreprises =  $doctrine->getRepository(Entreprise::class)->findBy([], ["raisonSociale" => "ASC"]);

        return $this->render('entreprise/index.html.twig', [
            'entreprises' => $entreprises
        ]);
    }

    /**
     * @Route("/entreprise/{id}", name="show_entreprise")
     */
    public function show(): Response 
    {
        $entreprise = " ";
        return $this->render('entreprise/index.html.twig', [
            'entreprise' => $entreprise
        ]);
    }


}
