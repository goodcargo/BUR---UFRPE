CREATE TABLE IF NOT EXISTS `Usuarios` (
	`usuario_id` INTEGER AUTO_INCREMENT,
	`nome` VARCHAR(255) NOT NULL,
	`email_institucional` VARCHAR(255) NOT NULL UNIQUE COMMENT 'RF03: Login principal do usuário',
	`senha_hash` VARCHAR(255) NOT NULL COMMENT 'RNF03: Senha deve ser criptografada (hash)',
	`matricula` VARCHAR(50) UNIQUE COMMENT 'Vínculo com a UFRPE',
	`status_conta` ENUM('Ativa', 'Inativa', 'Bloqueada') NOT NULL DEFAULT 'Ativa',
	`is_admin` BOOLEAN NOT NULL DEFAULT false COMMENT 'RF05: Define se o usuário pode ver relatórios',
	`data_cadastro` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`usuario_id`)
);


CREATE TABLE IF NOT EXISTS `Estacoes` (
	`estacao_id` INTEGER AUTO_INCREMENT,
	`nome` VARCHAR(100) NOT NULL UNIQUE COMMENT 'Ex: Biblioteca Central, Reitoria, CEGOE',
	`latitude` DECIMAL(10,8) NOT NULL COMMENT 'RF04: Posição no mapa',
	`longitude` DECIMAL(11,8) NOT NULL COMMENT 'RF04: Posição no mapa',
	`ativa` BOOLEAN NOT NULL DEFAULT true,
	PRIMARY KEY(`estacao_id`)
);


CREATE TABLE IF NOT EXISTS `Bicicletas` (
	`bicicleta_id` INTEGER AUTO_INCREMENT,
	`qr_code` VARCHAR(100) NOT NULL UNIQUE COMMENT 'RF01: Identificador único lido pela câmera',
	`status` ENUM('Disponivel', 'Em_Uso', 'Em_Manutencao', 'Inativa') NOT NULL DEFAULT 'Disponivel',
	`localizacao_latitude` DECIMAL(10,8) NOT NULL,
	`localizacao_longitude` DECIMAL(11,8) NOT NULL,
	`estacao_atual_id` INTEGER NOT NULL COMMENT 'Onde a bicicleta está estacionada (NULO se estiver em uso)',
	`data_ultima_manutencao` DATE,
	`nivel_bateria` INTEGER DEFAULT 100 COMMENT 'Para o GPS/trava da bicicleta',
	PRIMARY KEY(`bicicleta_id`)
);


CREATE INDEX `idx_bicicletas_qr_code`
ON `Bicicletas` (`qr_code`);
CREATE INDEX `idx_bicicletas_status`
ON `Bicicletas` (`status`);
CREATE TABLE IF NOT EXISTS `Usos` (
	`uso_id` INTEGER AUTO_INCREMENT,
	`usuario_id` INTEGER NOT NULL COMMENT 'Quem está usando',
	`bicicleta_id` INTEGER NOT NULL COMMENT 'Qual bicicleta está sendo usada',
	`hora_retirada` TIMESTAMP NOT NULL COMMENT 'Hora que foi cedida',
	`estacao_retirada_id` INTEGER NOT NULL COMMENT 'De onde saiu (se saiu de uma estação)',
	`hora_devolucao` TIMESTAMP NOT NULL DEFAULT NULL COMMENT 'Hora que foi devolvida (NULL se estiver em uso)',
	`estacao_devolucao_id` INTEGER NOT NULL COMMENT 'Onde foi devolvida (NULL se estiver em uso)',
	`tempo_maximo_minutos` INTEGER NOT NULL COMMENT 'Tempo máximo permitido para este uso',
	`status_uso` ENUM('Em_Andamento', 'Concluido', 'Atrasado') NOT NULL DEFAULT 'Em_Andamento',
	PRIMARY KEY(`uso_id`)
);


CREATE INDEX `idx_usos_em_andamento`
ON `Usos` (`usuario_id`, `status_uso`);
CREATE TABLE IF NOT EXISTS `Trajetos` (
	`trajeto_id` BIGINT AUTO_INCREMENT,
	`uso_id` INTEGER NOT NULL COMMENT 'Link para a viagem específica',
	`latitude` DECIMAL(10,8) NOT NULL,
	`longitude` DECIMAL(11,8) NOT NULL,
	`timestamp_ponto` TIMESTAMP NOT NULL COMMENT 'Momento exato daquela coordenada',
	PRIMARY KEY(`trajeto_id`)
);


CREATE INDEX `idx_trajetos_uso_id`
ON `Trajetos` (`uso_id`);
ALTER TABLE `Bicicletas`
ADD FOREIGN KEY(`estacao_atual_id`) REFERENCES `Estacoes`(`estacao_id`)
ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE `Usos`
ADD FOREIGN KEY(`usuario_id`) REFERENCES `Usuarios`(`usuario_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `Usos`
ADD FOREIGN KEY(`bicicleta_id`) REFERENCES `Bicicletas`(`bicicleta_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `Usos`
ADD FOREIGN KEY(`estacao_retirada_id`) REFERENCES `Estacoes`(`estacao_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `Usos`
ADD FOREIGN KEY(`estacao_devolucao_id`) REFERENCES `Estacoes`(`estacao_id`)
ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `Trajetos`
ADD FOREIGN KEY(`uso_id`) REFERENCES `Usos`(`uso_id`)
ON UPDATE CASCADE ON DELETE CASCADE;
