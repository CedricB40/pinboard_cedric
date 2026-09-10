<?php

namespace App\Entity;

use App\Repository\PinRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Context\ExecutionContextInterface;
use Vich\UploaderBundle\Mapping\Attribute as Vich;

use App\Entity\Traits\Timestampable;

#[ORM\Entity(repositoryClass: PinRepository::class)]
#[ORM\HasLifecycleCallbacks]
#[ORM\Table(name: "pins")]
#[Vich\Uploadable]

class Pin
{
    use Timestampable;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100)]
    #[Assert\NotBlank(message: 'Le titre est obligatoire.')]
    #[Assert\Length(min: 3, minMessage: 'Le titre doit contenir au moins {{ limit }} caractères.')]
    private ?string $title = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $description = null;

    #[ORM\Column(length: 500)]
    private ?string $imageName = null;

    #[Vich\UploadableField(mapping: 'pin_image', fileNameProperty: 'imageName')]
    private ?File $imageFile = null;

    #[ORM\ManyToOne(inversedBy: 'pins')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $user = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): static
    {
        $this->title = $title;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getImageName(): ?string
    {
        return $this->imageName;
    }

    public function setImageName(string $imageName): static
    {
        $this->imageName = $imageName;

        return $this;
    }

    public function getImageFile(): ?File
    {
        return $this->imageFile;
    }

    public function setImageFile(?File $imageFile = null): void
    {
        $this->imageFile = $imageFile;

        if (null !== $imageFile) {
            $this->setUpdatedAt(new \DateTimeImmutable());
        }
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): static
    {
        $this->user = $user;

        return $this;
    }

    #[Assert\Callback]
    public function validateTitle(ExecutionContextInterface $context, mixed $payload): void
    {
        if ($this->title !== null && stripos($this->title, 'spam') !== false) {
            $context->buildViolation('Le titre ne peut pas contenir le mot "spam".')
                ->atPath('title')
                ->addViolation();
        }
    }
}