
DROP DATABASE IF EXISTS get_that_auto;

CREATE DATABASE IF NOT EXISTS get_that_auto;
-- Usa o banco de dados get_that_auto
USE get_that_auto;


-- -----------------------------------------------------
-- Table .`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `login` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(45) NOT NULL, 
  `senha` VARCHAR(255) NOT NULL, 
  `tipo_usuario` ENUM('cliente', 'vendedor') NOT NULL, 
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_usuario` (`cpf`)
);


-- -----------------------------------------------------
-- Table .`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa` (
  `idempresa` INT NOT NULL AUTO_INCREMENT,
  `razaosocial` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cnpj` VARCHAR(18) NOT NULL,
  `nomefantasia` VARCHAR(100) NOT NULL,
  `porteEmpresa` ENUM('pequena', 'média', 'grande') NOT NULL,
  PRIMARY KEY (`idempresa`)
);




-- -----------------------------------------------------
-- Table .`vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendedores` (
  `idvendedores` INT NOT NULL,
  `salario` DOUBLE NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idvendedores`)
);

-- -----------------------------------------------------
-- Table .`enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enderecos` (
  `cep` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table .`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locador` (
  `pessoas_cpf` INT NOT NULL,
  `telContato` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `enderecos_id` INT NOT NULL,
  PRIMARY KEY (`pessoas_cpf`),
  FOREIGN KEY (`enderecos_id`) REFERENCES `enderecos` (`id`)
);

-- -----------------------------------------------------
-- Table .`vendaRegistros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluguelRegistros` (
  `idvenda` INT NOT NULL,
  `formaPagamento` VARCHAR(45) NOT NULL,
  `data` DATETIME NOT NULL,
  `valor` DOUBLE NOT NULL,
  `carrinho` VARCHAR(45) NOT NULL,
  `vendedores_idvendedores` INT NOT NULL,
  `clientes_pessoas_cpf` INT NOT NULL,
  PRIMARY KEY (
    `idvenda`,
    `vendedores_idvendedores`,
    `clientes_pessoas_cpf`
  ),
  FOREIGN KEY (`vendedores_idvendedores`) REFERENCES `vendedores` (`idvendedores`),
  FOREIGN KEY (`clientes_pessoas_cpf`) REFERENCES `clientes` (`pessoas_cpf`)
);

-- -----------------------------------------------------
-- Table .`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `cnpj` INT NOT NULL,
  `enderecos_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` INT NOT NULL,
  PRIMARY KEY (`cnpj`),
  FOREIGN KEY (`enderecos_id`) REFERENCES `enderecos` (`id`)
);
-- -----------------------------------------------------
-- Table .`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `categorias` (
  `idcategorias` INT NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategorias`)
);

-- -----------------------------------------------------
-- Table .`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veiculo`(
  `idVeiculo` INT NOT NULL,
  `quantAssento` INT NOT NULL,
  `tipoCambio` VARCHAR(45) NOT NULL,
  `quantPortas` INT NOT NULL,
  `espacoPortaMalas` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `ano` INT NOT NULL,
  `notaAvaliacao` INT NOT NULL,
  `precoPorDia` INT NOT NULL,
  `imgBase64` VARCHAR(100) NOT NULL DEFAULT "",
  `unidadeEmEstoque` INT NOT NULL,
  `categorias_idcategorias` INT NOT NULL,
  `fornecedores_cnpj` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`, `fornecedores_cnpj`),
  FOREIGN KEY (`categorias_idcategorias`) REFERENCES `categorias` (`idcategorias`),
  FOREIGN KEY (`fornecedores_cnpj`) REFERENCES `fornecedores` (`cnpj`)
);



-- inserts patricia
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('95560', '1', 'PO Box 26708', '9th Floor', 'PO Box 59776', '7th Floor');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('95590', '2', 'PO Box 74593', 'Suite 85', 'Apt 359', 'Room 630');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('9899', '3', 'Apt 1550', 'Apt 1844', 'Suite 82', 'Suite 87');




insert into categorias (idcategorias, categoria) values ('1', 'felis');
insert into categorias (idcategorias, categoria) values ('2', 'justo');
insert into categorias (idcategorias, categoria) values ('23', 'in lectus');
insert into categorias (idcategorias, categoria) values ('24', 'sapien ');
insert into categorias (idcategorias, categoria) values ('25', 'semper');

-- inserts emily alves -- corrigidos


 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (82, 1, 'João',  34244624); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (83, 2, 'Bruno',  25152528); 
  insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (84, 3, 'Marco',  93856031); 

 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (85, 4, 'Patricia',  22578104); 
  insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (86, 27, 'Antonio',  25152560); 

 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (98, 17, 'Lucas',  21513859); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (99, 18, 'Wiggers',   36775208); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (100, 20, 'Carol',  24381049); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (101, 21, 'Antonio Junior',  32491146); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (102, 22, 'Ana Maria',  22856621); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (104, 24, 'Amanda',  30380604); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (105, 25, 'Bruna',  39113001); 

 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (00, 'Lincoln', 'http://dummyimage.com/221x100.png', 11, 23, 1, 'MKZ', 94, 1, 82);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (01, 'Land Rover', 'http://dummyimage.com/163x100.png', 21, 18, 2, 'Freelander', 50, 2, 83);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (02, 'Ford', 'http://dummyimage.com/167x100.png', 44, 40, 3, 'Focus', 33, 3, 84);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (03, 'Mercury', 'http://dummyimage.com/192x100.png', 89, 45, 4, 'Cougar', 53,4, 85);
 
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (04, 'Mercury', 'http://dummyimage.com/214x100.png', 30, 63, 5, 'Mountaineer', 72, 5, 86);
 
 
 
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (14, 'Pontiac', 'http://dummyimage.com/225x100.png', 81, 73, 15, 'Montana', 13, 15, 96);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (15, 'Buick', 'http://dummyimage.com/125x100.png', 2, 57, 16, 'LeSabre', 23,16, 97);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (16, 'Lexus', 'http://dummyimage.com/246x100.png', 12, 50, 17, 'GS', 49, 17, 98);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (17, 'Volvo', 'http://dummyimage.com/231x100.png', 22, 15, 18, 'S40', 7, 18, 99);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (19, 'GMC', 'http://dummyimage.com/216x100.png', 74, 65, 20, 'Savana 3500', 21, 20, 100);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (20, 'Dodge', 'http://dummyimage.com/121x100.png', 28, 65, 21, 'Ramcharger', 85, 21, 101);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (21, 'Lexus', 'http://dummyimage.com/187x100.png', 25, 44, 22, 'IS', 44 ,22, 102);
insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (23, 'Toyota', 'http://dummyimage.com/246x100.png', 32, 47, 24, 'Echo', 5, 24,104);
 insert into produtos (idProdutos, nome, imagemProduto, altura, largura, quantidade, descricao, unidadeEmEstoque, categorias_idcategorias, fornecedores_cnpj) values (24, 'Dodge', 'http://dummyimage.com/244x100.png', 100, 28, 25, 'Magnum', 19, 25,105);

-- inserts andri
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (1, 2574.89, 'Garreth', 'Espinoy', 'gespinoy0@cisco.com', 13.4);
insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (2, 1883.12, 'Jess', 'McMichan', 'jmcmichan1@privacy.gov.au',05.10);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (3,1883.16,'José','carols','mchan1@privacy.gov.au',05.10);

 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (4, 1844.79, 'Brigg', 'McNeill', 'bmcneill3@issuu.com', 10.2);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (7, 1386.02, 'Sol', 'Winspur', 'swinspur6@geocities.jp', 10.65);
insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (8, 2896.38, 'Caressa', 'Clair', 'cclair7@google.ca', 09.5);
insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (9, 2559.79, 'Wallis', 'Sante', 'wsante8@mashable.com', 10.5);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (11, 1437.69, 'Calla', 'Poschel', 'cposchela@yandex.ru', 2.90);
 
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (17, 1697.44, 'Merrel', 'Foran', 'mforang@mashable.com', 2.90);
insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (19, 2900.21, 'Maggie', 'Allright', 'mallrighti@surveymonkey.com', 7.0);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (21, 2122.06, 'Link', 'Wason', 'lwasonk@examiner.com', 4.7);
 insert into vendedores (idVendedores, salario, nome, sobrenome, email, porcentagemComissao) values (10, 2527.40, 'Tedie', 'Hartwell', 'thartwello@thetimes.co.uk', 9.10);


 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('212213454', 'Joanna', 'oldey', 'joldey1@baidu.com', 2);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('768541784', 'Miguela', 'Gettens', 'mgettens3@imdb.com', 4);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('103966036', 'Olivia', 'Benedito', 'obenedito4@goo.gl', 5);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('281160955', 'Ermina', 'Renfree', 'erenfree6@archive.org', 7);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('882776294', 'Mel', 'Flagg', 'mflagg7@vistaprint.com', 8);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('747483506', 'Pennie', 'Licas', 'plicas8@eventbrite.com', 9);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('133181424', 'Julio', 'Povey', 'jpoveya@360.cn', 11);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('431436733', 'Sonya', 'Rollett', 'srollettb@slate.com', 12);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('285139482', 'Leda', 'Dreossi', 'ldreossic@pagesperso-orange.fr', 13);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('381724267', 'Rudy', 'Selwyn', 'rselwynd@hp.com', 14);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('154986955', 'Nathalia', 'Zincke', 'nzinckef@marketwatch.com', 16);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('272816143', 'Jeanette', 'Ayto', 'jaytog@sfgate.com', 17);
 insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('854464662', 'Paulo', 'Hugnet', 'phugneti@addthis.com', 19);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('387217391', 'Cristin', 'BURWIN', 'cburwinj@fastcompany.com', 20);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('680570180', 'Milissent', 'Gillbee', 'mgillbeel@delicious.com', 22);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('847917766', 'Courtnay', 'Gwilliams', 'cgwilliamsm@etsy.com', 23);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('676149577', 'Rivalee', 'Feldon', 'rfeldonn@twitter.com', 24);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('654270414', 'Nathanael', 'Enocksson', 'nenockssono@microsoft.com', 25);
insert into clientes (pessoas_cpf, nome, sobrenome, email, enderecos_id) values ('654270415','Nathanael', 'Enocksson2','nenockssono@microsoft.com', 25);


-- inserts pat - emilySnow
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('1', 'debito', '2022-10-09', '1665.94', 'volutpat ', 1, 212213454 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('2', 'credito', '2023-3-07', '1041.56', 'turpis ', 2, 768541784 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('3', 'dinheiro', '2023-11-25', '1873.27', 'velit', 3,103966036 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('4', 'credito', '2022-11-13', '377.37', 'ante', 4, 768541784);
 
 -- corrigir
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('6', 'credito', '2023-2-20', '136.44', 'natoque',7,654270414 );
 
 
 
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('8', 'credito', '2023-3-18', '1008.27', 'convallis',8,882776294 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('9', 'debito', '2023-1-24', '1275.99', 'vivamus', 9,747483506 );
 
 
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('11', 'dinheiro', '2023-3-5', '1845.88', 'faucibus', 11, 133181424);
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('12', 'credito', '2023-9-3', '584.73', 'enim', 12,431436733 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('14', 'credito', '2023-10-19', '128.73', 'sapien', 14, 381724267);
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('17', 'credito', '2023-4-26', '1808.33', 'gravida', 17,272816143 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('19', 'credito', '2022-8-16', '1914.21', 'curabitur', 19,854464662 );
 insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('23', 'credito', '2022-4-25', '976.75', 'magna', 23,847917766 );
insert into vendaRegistros (idvenda, formaPagamento, data, valor, carrinho, vendedores_idvendedores, clientes_pessoas_cpf) values ('25', 'credito', '2023-6-12', '1475.45', 'est',25,654270414 );


-- inserts emily snow
insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (00, 1, 1);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (01, 2, 2);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (02, 3, 3);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (03, 4, 4);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (18, 8, 8);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (08, 9, 9);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (10, 11, 11);
 insert into carrinhos (produtos_idprodutos, vendaRegistros_idvenda, vendaRegistros_vendedores_idvendedores) values (13, 14, 14);






 




