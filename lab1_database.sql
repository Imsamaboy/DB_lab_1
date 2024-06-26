-- Создание таблицы borrowers
CREATE TABLE borrowers (
    id INT(11) NOT NULL AUTO_INCREMENT,
    inn VARCHAR(12) NOT NULL,
    individual_or_organization VARCHAR(255) NOT NULL,
    address TEXT,
    amount DECIMAL(10,2),
    conditions TEXT,
    legal_notes TEXT,
    agreements_list TEXT,
    PRIMARY KEY (id)
);

-- Создание таблицы individuals
CREATE TABLE individuals (
    id INT(11) NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    patronymic VARCHAR(255),
    passport VARCHAR(20),
    inn VARCHAR(12),
    snils VARCHAR(14),
    driver_license VARCHAR(20),
    additional_docs TEXT,
    note TEXT,
    PRIMARY KEY (id)
);

-- Создание таблицы organization_credits
CREATE TABLE organization_credits (
    id INT(11) NOT NULL AUTO_INCREMENT,
    individual_id INT(11),
    organization_id INT(11),
    borrower_id INT(11),
    amount DECIMAL(10,2),
    term INT(11),
    interest_rate DECIMAL(5,2),
    conditions TEXT,
    note TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (individual_id) REFERENCES individuals(id) ON DELETE SET NULL,
    FOREIGN KEY (borrower_id) REFERENCES borrowers(id) ON DELETE SET NULL
);

-- Создание таблицы loans
CREATE TABLE loans (
    id INT(11) NOT NULL AUTO_INCREMENT,
    individual_id INT(11),
    amount DECIMAL(10,2),
    interest_rate DECIMAL(5,2),
    term INT(11),
    conditions TEXT,
    note TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (individual_id) REFERENCES individuals(id) ON DELETE CASCADE
);

-- Добавление организации как таблицы с которой будут связи через organization_credits
CREATE TABLE organizations (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Добавление внешнего ключа к organization_credits
ALTER TABLE organization_credits
    ADD FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE SET NULL;