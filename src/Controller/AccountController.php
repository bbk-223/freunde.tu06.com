<?php

namespace App\Controller;

use App\Entity\User;
use DateTime;
use Doctrine\ORM\Mapping\Id;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class AccountController extends AbstractController
{

    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    #[Route('/account', name: 'app_account')]
    public function index(): Response
    {
        return $this->render('account/index.html.twig', [
            'controller_name' => 'AccountController',
        ]);
    }

    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    #[Route('/edit-profile', name: 'app_edit_profile')]
    function edit_profile() : Response
    {
        return $this->render('account/edit_profile.html.twig');
    }

    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    #[Route('/update-profile/', name: 'app_update_profile')]
    function update_profile(UserRepository $user, Request $request, ValidatorInterface $validator, EntityManagerInterface $entityManager) : Response
    {
        $time_input = new \DateTime('@'.strtotime($request->request->get('birth'))); 
        $user = $user->find($this->getUser()->getId());


        $user->setName($request->request->get('name'));
        $user->setGender($request->request->get('gender'));
        $user->setBirth($time_input);
        $user->setRelationship($request->request->get('relationship'));
        $user->setCountry($request->request->get('country'));
        $user->setState($request->request->get('state'));
        $user->setCity($request->request->get('city'));
        $user->setStartWantAge($request->request->get('start_want_age'));
        $user->setEndWantAge($request->request->get('end_want_age'));
        $user->setFavorites($request->request->get('favorites'));

        $errors = $validator->validate($user);

        if (count($errors) > 0) {
            return $this->render('account/edit_profile.html.twig', ['errors' => $errors]);
        }

        $brochureFile = $request->files->get('profile_picture');

        // this condition is needed because the 'brochure' field is not required
        // so the PDF file must be processed only when a file is uploaded
        if ($brochureFile) {
            $fileName = 'profile-images/profile-user-'.$user->getId().'.'.$brochureFile->guessExtension();

            // Move the file to the directory where brochures are stored
            try {
                $brochureFile->move('profile-images/', $fileName);
            } catch (FileException $e) {
                // ... handle exception if something happens during file upload
            }
            
            $user->setProfilePicture($fileName);
        }

            $entityManager->persist($user);
            $entityManager->flush();
            $this->addFlash('success', 'پروفایل با موفقیت بروز رسانی شد');
            return $this->redirectToRoute('app_edit_profile');
    }

    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    #[Route('/change-password', name: 'app_change_password')]
    function change_password() : Response
    {
        return $this->render('account/change_password.html.twig');
    }

    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    #[Route('/messages', name: 'app_messages')]
    function messages() : Response
    {
        return $this->render('account/messages.html.twig');
    }
}
