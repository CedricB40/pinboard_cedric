<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260910081256 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Ajout des champs email, password et roles sur users pour l\'authentification';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE pins ADD CONSTRAINT FK_3F0FE980A76ED395 FOREIGN KEY (user_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE users ADD email VARCHAR(180) NOT NULL, ADD password VARCHAR(255) NOT NULL, ADD roles JSON NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_1483A5E9E7927C74 ON users (email)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE pins DROP FOREIGN KEY FK_3F0FE980A76ED395');
        $this->addSql('DROP INDEX UNIQ_1483A5E9E7927C74 ON users');
        $this->addSql('ALTER TABLE users DROP email, DROP password, DROP roles');
    }
}