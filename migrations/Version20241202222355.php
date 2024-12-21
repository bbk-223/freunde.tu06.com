<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20241202222355 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', available_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', delivered_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE conversations DROP FOREIGN KEY conversations_receiver_id_foreign');
        $this->addSql('ALTER TABLE conversations DROP FOREIGN KEY conversations_sender_id_foreign');
        $this->addSql('ALTER TABLE messages DROP FOREIGN KEY messages_conversation_id_foreign');
        $this->addSql('ALTER TABLE messages DROP FOREIGN KEY messages_receiver_id_foreign');
        $this->addSql('ALTER TABLE messages DROP FOREIGN KEY messages_sender_id_foreign');
        $this->addSql('DROP TABLE conversations');
        $this->addSql('DROP TABLE failed_jobs');
        $this->addSql('DROP TABLE messages');
        $this->addSql('DROP TABLE personal_access_tokens');
        $this->addSql('DROP TABLE password_reset_tokens');
        $this->addSql('DROP TABLE migrations');
        $this->addSql('ALTER TABLE user ADD roles JSON NOT NULL, CHANGE id id INT AUTO_INCREMENT NOT NULL, CHANGE email email VARCHAR(180) NOT NULL, CHANGE favorites favorites LONGTEXT DEFAULT NULL');
        $this->addSql('ALTER TABLE user RENAME INDEX users_email_unique TO UNIQ_IDENTIFIER_EMAIL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE conversations (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, sender_id BIGINT UNSIGNED NOT NULL, receiver_id BIGINT UNSIGNED NOT NULL, deleted_at DATETIME DEFAULT NULL, created_at DATETIME DEFAULT NULL, updated_at DATETIME DEFAULT NULL, INDEX conversations_receiver_id_foreign (receiver_id), INDEX conversations_sender_id_foreign (sender_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE failed_jobs (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, uuid VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, connection TEXT CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, queue TEXT CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, payload LONGTEXT CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, exception LONGTEXT CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, failed_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, UNIQUE INDEX failed_jobs_uuid_unique (uuid), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE messages (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, conversation_id BIGINT UNSIGNED NOT NULL, sender_id BIGINT UNSIGNED DEFAULT NULL, receiver_id BIGINT UNSIGNED DEFAULT NULL, read_at DATETIME DEFAULT NULL, receiver_deleted_at DATETIME DEFAULT NULL, sender_deleted_at DATETIME DEFAULT NULL, body TEXT CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, created_at DATETIME DEFAULT NULL, updated_at DATETIME DEFAULT NULL, INDEX messages_conversation_id_foreign (conversation_id), INDEX messages_receiver_id_foreign (receiver_id), INDEX messages_sender_id_foreign (sender_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE personal_access_tokens (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, tokenable_type VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, tokenable_id BIGINT UNSIGNED NOT NULL, name VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, token VARCHAR(64) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, abilities TEXT CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, last_used_at DATETIME DEFAULT NULL, expires_at DATETIME DEFAULT NULL, created_at DATETIME DEFAULT NULL, updated_at DATETIME DEFAULT NULL, UNIQUE INDEX personal_access_tokens_token_unique (token), INDEX personal_access_tokens_tokenable_type_tokenable_id_index (tokenable_type, tokenable_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE password_reset_tokens (email VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, token VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, created_at DATETIME DEFAULT NULL, PRIMARY KEY(email)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE migrations (id INT UNSIGNED AUTO_INCREMENT NOT NULL, migration VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, batch INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE conversations ADD CONSTRAINT conversations_receiver_id_foreign FOREIGN KEY (receiver_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE conversations ADD CONSTRAINT conversations_sender_id_foreign FOREIGN KEY (sender_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE messages ADD CONSTRAINT messages_conversation_id_foreign FOREIGN KEY (conversation_id) REFERENCES conversations (id) ON UPDATE NO ACTION ON DELETE CASCADE');
        $this->addSql('ALTER TABLE messages ADD CONSTRAINT messages_receiver_id_foreign FOREIGN KEY (receiver_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE SET NULL');
        $this->addSql('ALTER TABLE messages ADD CONSTRAINT messages_sender_id_foreign FOREIGN KEY (sender_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE SET NULL');
        $this->addSql('DROP TABLE messenger_messages');
        $this->addSql('ALTER TABLE user DROP roles, CHANGE id id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL, CHANGE email email VARCHAR(255) NOT NULL, CHANGE favorites favorites TEXT DEFAULT NULL');
        $this->addSql('ALTER TABLE user RENAME INDEX uniq_identifier_email TO users_email_unique');
    }
}
