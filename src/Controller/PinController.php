<?php

namespace App\Controller;

use App\Entity\Pin;
use App\Form\PinType;
use App\Repository\PinRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route(path: '/pin')]
class PinController extends AbstractController
{
    #[Route(name: 'app_pin_index', methods: ['GET'])]
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    public function index(PinRepository $pinRepository): Response
    {
        return $this->render('pin/index.html.twig', [
            'pins' => $pinRepository->findAll(),
        ]);
    }

    #[Route(path: '/new', name: 'app_pin_new', methods: ['GET', 'POST'])]
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $pin = new Pin();
        $form = $this->createForm(PinType::class, $pin);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $pin->setUser($this->getUser());

            $entityManager->persist($pin);
            $entityManager->flush();

            $this->addFlash('success', 'Le Pin a bien été créé.');

            return $this->redirectToRoute('app_pin_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('pin/new.html.twig', [
            'pin' => $pin,
            'form' => $form,
        ]);
    }

    #[Route(path: '/{id}', name: 'app_pin_show', methods: ['GET'])]
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    public function show(Pin $pin): Response
    {
        return $this->render('pin/show.html.twig', [
            'pin' => $pin,
        ]);
    }

    #[Route(path: '/{id}/edit', name: 'app_pin_edit', methods: ['GET', 'POST'])]
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    public function edit(Request $request, Pin $pin, EntityManagerInterface $entityManager): Response
    {
        if ($pin->getUser() !== $this->getUser()) {
            throw $this->createAccessDeniedException('Vous ne pouvez pas modifier ce Pin.');
        }

        $form = $this->createForm(PinType::class, $pin);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            $this->addFlash('success', 'Le Pin a bien été modifié.');

            return $this->redirectToRoute('app_pin_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('pin/edit.html.twig', [
            'pin' => $pin,
            'form' => $form,
        ]);
    }

    #[Route(path: '/{id}', name: 'app_pin_delete', methods: ['POST'])]
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    public function delete(Request $request, Pin $pin, EntityManagerInterface $entityManager): Response
    {
        if ($pin->getUser() !== $this->getUser()) {
            throw $this->createAccessDeniedException('Vous ne pouvez pas supprimer ce Pin.');
        }

        if ($this->isCsrfTokenValid('delete'.$pin->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($pin);
            $entityManager->flush();

            $this->addFlash('danger', 'Le Pin a bien été supprimé.');
        }

        return $this->redirectToRoute('app_pin_index', [], Response::HTTP_SEE_OTHER);
    }
}