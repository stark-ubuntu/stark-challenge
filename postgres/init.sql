CREATE SCHEMA airflow;
CREATE SCHEMA invoice;
CREATE SCHEMA credit;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE invoice.person (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    taxId VARCHAR(11) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE invoice.invoicing (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    taxId VARCHAR(11) NOT NULL UNIQUE,
    amount BIGINT NOT NULL
);

INSERT INTO invoice.person (taxId, name) VALUES ('85666113062', 'Ana Silva');
INSERT INTO invoice.person (taxId, name) VALUES ('65447617022', 'Bruno Costa');
INSERT INTO invoice.person (taxId, name) VALUES ('29031528021', 'Carla Pereira');
INSERT INTO invoice.person (taxId, name) VALUES ('28703693015', 'Daniel Oliveira');
INSERT INTO invoice.person (taxId, name) VALUES ('62181001030', 'Eduarda Santos');
INSERT INTO invoice.person (taxId, name) VALUES ('83475496054', 'Felipe Almeida');
INSERT INTO invoice.person (taxId, name) VALUES ('83355411086', 'Gabriela Souza');
INSERT INTO invoice.person (taxId, name) VALUES ('12055213059', 'Henrique Lima');
INSERT INTO invoice.person (taxId, name) VALUES ('88219511036', 'Isabella Rocha');
INSERT INTO invoice.person (taxId, name) VALUES ('41594735042', 'João Mendes');
INSERT INTO invoice.person (taxId, name) VALUES ('91590166043', 'Karina Nascimento');
INSERT INTO invoice.person (taxId, name) VALUES ('57784985002', 'Lucas Martins');
INSERT INTO invoice.person (taxId, name) VALUES ('42542317097', 'Mariana Torres');
INSERT INTO invoice.person (taxId, name) VALUES ('34462067010', 'Nicolas Andrade');
INSERT INTO invoice.person (taxId, name) VALUES ('47914828084', 'Olga Ferreira');
INSERT INTO invoice.person (taxId, name) VALUES ('62800093005', 'Paulo Ribeiro');
INSERT INTO invoice.person (taxId, name) VALUES ('89031100056', 'Quezia Almeida');
INSERT INTO invoice.person (taxId, name) VALUES ('66385255069', 'Ricardo Teixeira');
INSERT INTO invoice.person (taxId, name) VALUES ('48119162048', 'Sofia Pacheco');
INSERT INTO invoice.person (taxId, name) VALUES ('85382975035', 'Tiago Campos');

CREATE USER debezium WITH PASSWORD 'debezium';

GRANT ALL PRIVILEGES ON DATABASE challenge TO debezium;

GRANT USAGE ON SCHEMA invoice TO debezium;

GRANT INSERT, SELECT ON invoice.invoicing TO debezium;

ALTER USER debezium WITH SUPERUSER;

CREATE PUBLICATION invoicing FOR TABLE invoice.invoicing;
