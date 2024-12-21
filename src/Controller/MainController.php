<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Pagerfanta\Doctrine\ORM\QueryAdapter;
use Pagerfanta\Pagerfanta;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Twig\Environment;

class MainController extends AbstractController
{


    #[Route('/', name: 'app_main_home')]
    public function home(UserRepository $userRepository, Request $request, EntityManagerInterface $entityManager): Response
    {
        $users_js = $userRepository->createQueryBuilder('p')
            ->setFirstResult(rand(30, $userRepository->count() - 16))
            ->setMaxResults(16)
            ->getQuery()
            ->getResult();


        $users = $userRepository->createQueryBuilder('p')
            ->orderBy('p.id', 'DESC');
        // $users = $userRepository->createQuery(' SELECT q.id FROM User q WHERE q.id=LAST_INSERT_ID(); ');

        $adapter = new QueryAdapter($users);
        $users_home = Pagerfanta::createForCurrentPageWithMaxPerPage($adapter, $request->query->get('page',1),12);

        return $this->render('main/index.html.twig', [
            'users_js' => $users_js,
            'users' => $users_home,
        ]);
    }

    #[Route('/profile/{id}', name: 'app_main_profile')]
    public function profile(User $user, UserRepository $userRepository, Request $request): Response
    {
        $users = $userRepository->createQueryBuilder('p')
            ->orderBy('p.id', 'DESC');

        $adapter = new QueryAdapter($users);
        $users_home = Pagerfanta::createForCurrentPageWithMaxPerPage($adapter, $request->query->get('page',1),12);

        
        return $this->render('main/profile.html.twig',[
        'user' => $user,
        'users' => $users_home,
    ]);
    }

    #[Route('/suchen', name: 'app_main_suchen')]
    public function suchen(UserRepository $userRepository, Request $request) : Response {
        $users = $userRepository->createQueryBuilder('p')
        ->orderBy('p.id', 'DESC');

    $adapter = new QueryAdapter($users);
    $users_home = Pagerfanta::createForCurrentPageWithMaxPerPage($adapter, $request->query->get('page',1),16);
    return $this->render('main/suchen.html.twig',['users' => $users_home]);
    }

    #[Route('/gesucht', name: 'app_main_gesucht')]
        public function gesucht(UserRepository $userRepository, Request $request) : Response {
            $dt = new DateTime();
            $yearNow = $dt->format('Y');
            // $age1 = ($yearNow - $request->request->get('age1')) . '-01-01';
            // $age2 = ($yearNow - $request->request->get('age2')) . '-01-01';
    
            // $age1 = strtotime(($yearNow - $request->request->get('age1')) . '-01-01');
            $result_birth1 = new DateTime(($yearNow - $request->query->get('age1')) . '-01-01');
            $result_birth1 = $result_birth1->format('Y-m-d');
            // $age2 = strtotime(($yearNow - $request->request->get('age2')) . '-01-01');
            $result_birth2 = new DateTime(($yearNow - $request->query->get('age2')) . '-01-01');
            $result_birth2 = $result_birth2->format('Y-m-d');

            $city = $request->query->get('city');
    
            $users = $userRepository->createQueryBuilder('u')
            ->orderBy('u.id', 'DESC')
            ->where('u.birth <= :age1 AND u.birth >= :age2')
            ->andWhere('u.gender = :gender')
            ->setParameter(':age1', $result_birth1)
            ->setParameter(':age2', $result_birth2)
            ->setParameter(':gender',$request->query->get('gender'));

            if($city != ''){
                $users = $users->andWhere('u.city = :city')
                ->setParameter(':city',$request->query->get('city'));
            }
            // if($request->request->get('age1') == null){
            //     $users = $userRepository->createQueryBuilder('p')
            //     ->orderBy('p.id', 'DESC');
            // }
            // $users_home = $users->getQuery()->getResult();
    
    
        $adapter = new QueryAdapter($users);
        $users_result = Pagerfanta::createForCurrentPageWithMaxPerPage($adapter, $request->query->get('page',1),16);
        // return $this->redirect('dieergebnisse');

        return $this->render('main/suchen.html.twig',['users' => $users_result]);
    }

}
