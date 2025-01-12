<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use App\Repository\UserRepository;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
#[ORM\Entity(repositoryClass: UserRepository::class)]
#[ORM\UniqueConstraint(name: 'UNIQ_IDENTIFIER_EMAIL', fields: ['email'])]
#[UniqueEntity(fields: ['email'], message: 'There is already an account with this email')]
class User implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 180)]
    private ?string $email = null;

    /**
     * @var list<string> The user roles
     */
    #[ORM\Column]
    private array $roles = [];

    /**
     * @var string The hashed password
     */
    #[ORM\Column]
    private ?string $password = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message: 'وارد کردن فیلد نام اجباری می باشد')]
    private ?string $name = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $gender = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $birth = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $relationship = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $country = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $state = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $city = null;

    #[ORM\Column(nullable: true)]
    private ?int $start_want_age = null;

    #[ORM\Column(nullable: true)]
    private ?int $end_want_age = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $favorites = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $profile_picture = null;

    #[ORM\Column]
    private ?bool $isVerified = false;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     *
     * @return list<string>
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    /**
     * @param list<string> $roles
     */
    public function setRoles(array $roles): static
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): static
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials(): void
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getGender(): ?string
    {
        return $this->gender;
    }

    public function setGender(?string $gender): static
    {
        $this->gender = $gender;

        return $this;
    }

    public function getBirth(): ?\DateTimeInterface
    {
        return $this->birth;
    }

    public function setBirth(?\DateTimeInterface $birth): static
    {
        $this->birth = $birth;

        return $this;
    }

    public function getRelationship(): ?string
    {
        return $this->relationship;
    }

    public function setRelationship(?string $relationship): static
    {
        $this->relationship = $relationship;

        return $this;
    }

    public function getCountry(): ?string
    {
        return $this->country;
    }

    public function setCountry(?string $country): static
    {
        $this->country = $country;

        return $this;
    }

    public function getState(): ?string
    {
        return $this->state;
    }

    public function setState(?string $state): static
    {
        $this->state = $state;

        return $this;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(?string $city): static
    {
        $this->city = $city;

        return $this;
    }

    public function getStartWantAge(): ?int
    {
        return $this->start_want_age;
    }

    public function setStartWantAge(?int $start_want_age): static
    {
        $this->start_want_age = $start_want_age;

        return $this;
    }

    public function getEndWantAge(): ?int
    {
        return $this->end_want_age;
    }

    public function setEndWantAge(?int $end_want_age): static
    {
        $this->end_want_age = $end_want_age;

        return $this;
    }

    public function getFavorites(): ?string
    {
        return $this->favorites;
    }

    public function setFavorites(?string $favorites): static
    {
        $this->favorites = $favorites;

        return $this;
    }

    public function getProfilePicture(): ?string
    {
        return $this->profile_picture;
    }

    public function setProfilePicture(?string $profile_picture): static
    {
        $this->profile_picture = $profile_picture;

        return $this;
    }

    public function profilePictureUrl() : string {
        $filesystem = new Filesystem();
        if($this->profile_picture && $filesystem->exists($this->profile_picture)){
            return 'http://localhost:8000/'.$this->profile_picture;
        }elseif($this->profile_picture && $this->profile_picture == 'test'){
            return "https://source.unsplash.com/500x500?face-" . rand(1, 1000);
        }else{
            return 'http://localhost:8000/icon/150x150.png';
        }
    }

    public function isVerified(): ?bool
    {
        return $this->isVerified;
    }

    public function setVerified(bool $isVerified): static
    {
        $this->isVerified = $isVerified;

        return $this;
    }
}
