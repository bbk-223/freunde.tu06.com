<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class AccountController extends AbstractController
{
    #[Route('/account', name: 'app_account')]
    public function index(): Response
    {
        return $this->render('account/index.html.twig', [
            'controller_name' => 'AccountController',
        ]);
    }

    #[Route('/edit-profile', name: 'app_edit_profile')]
    function edit_profile() : Response
    {
        return $this->render('account/edit_profile.html.twig');
    }

    #[Route('/update-profile', name: 'app_update_profile')]
    function update_profile() : Response
    {
        return $this->render('account/edit_profile.html.twig');
    }

    #[Route('/change-password', name: 'app_change_password')]
    function change_password() : Response
    {
        return $this->render('account/change_password.html.twig');
    }
}
