-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `mydb`.`category_1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category_1` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `mydb`.`Cadastro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cadastro` (
  `Nome Completo` VARCHAR(90) NOT NULL,
  `Data de Nascimento` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `E-mail` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `Confirmar Senha` VARCHAR(45) NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Perfil` (
  `Notificações` VARCHAR(255) NOT NULL,
  `Favoritos` VARCHAR(45) NULL,
  `Assinaturas` VARCHAR(45) NULL,
  `Cartões` VARCHAR(45) NULL,
  `Endereços` VARCHAR(45) NULL,
  `Meus Dados` VARCHAR(45) NULL,
  `Meus Dados_idInformações Pessoais` VARCHAR(255) NOT NULL,
  `Pagina inicial_idEndereço` INT NOT NULL,
  PRIMARY KEY (`Notificações`),
  INDEX `fk_Perfil_Meus Dados1_idx` (`Meus Dados_idInformações Pessoais` ASC) VISIBLE,
  INDEX `fk_Perfil_Pagina inicial1_idx` (`Pagina inicial_idEndereço` ASC) VISIBLE,
  CONSTRAINT `fk_Perfil_Meus Dados1`
    FOREIGN KEY (`Meus Dados_idInformações Pessoais`)
    REFERENCES `mydb`.`Meus Dados` (`idInformações Pessoais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_Pagina inicial1`
    FOREIGN KEY (`Pagina inicial_idEndereço`)
    REFERENCES `mydb`.`Pagina inicial` (`idEndereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Meus Dados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Meus Dados` (
  `idInformações Pessoais` VARCHAR(255) NOT NULL,
  `Dados de Contato` VARCHAR(90) NOT NULL,
  `Credenciais` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`idInformações Pessoais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagina inicial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pagina inicial` (
  `idEndereço` INT NOT NULL,
  `OláIDUsuario` VARCHAR(45) NOT NULL,
  `Receitas` VARCHAR(45) NOT NULL,
  `Listas de Compras` VARCHAR(45) NOT NULL,
  `Minhas Listas` VARCHAR(45) NOT NULL,
  `Criar Lista` VARCHAR(45) NOT NULL,
  `Receitas_idReceitas` INT NOT NULL,
  `Receitas_IDAvaliação` INT NOT NULL,
  PRIMARY KEY (`idEndereço`),
  INDEX `fk_Pagina inicial_Receitas1_idx` (`Receitas_idReceitas` ASC, `Receitas_IDAvaliação` ASC) VISIBLE,
  CONSTRAINT `fk_Pagina inicial_Receitas1`
    FOREIGN KEY (`Receitas_idReceitas` , `Receitas_IDAvaliação`)
    REFERENCES `mydb`.`Receitas` (`idReceitas` , `IDAvaliação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP);


-- -----------------------------------------------------
-- Table `mydb`.`category_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category_2` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `mydb`.`Cadastro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cadastro` (
  `Nome Completo` VARCHAR(90) NOT NULL,
  `Data de Nascimento` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `E-mail` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `Confirmar Senha` VARCHAR(45) NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Meus Dados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Meus Dados` (
  `idInformações Pessoais` VARCHAR(255) NOT NULL,
  `Dados de Contato` VARCHAR(90) NOT NULL,
  `Credenciais` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`idInformações Pessoais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AvaliacaoSimples`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AvaliacaoSimples` (
  `IDAvaliacao` INT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IDProduto` INT NOT NULL,
  `IDUsuario` INT NOT NULL,
  `DataAvaliacao` TIMESTAMP(5) NOT NULL,
  PRIMARY KEY (`IDAvaliacao`));


-- -----------------------------------------------------
-- Table `mydb`.`Receitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Receitas` (
  `idReceitas` INT NOT NULL,
  `Ingredientes` VARCHAR(45) NOT NULL,
  `Modo de Preparo` VARCHAR(255) NOT NULL,
  `IDAvaliação` INT NULL,
  `Colocar Ingredientes no carrinho` VARCHAR(45) NOT NULL,
  `AvaliacaoSimples_IDAvaliacao` INT NOT NULL,
  PRIMARY KEY (`idReceitas`, `IDAvaliação`),
  INDEX `fk_Receitas_AvaliacaoSimples_idx` (`AvaliacaoSimples_IDAvaliacao` ASC) VISIBLE,
  CONSTRAINT `fk_Receitas_AvaliacaoSimples`
    FOREIGN KEY (`AvaliacaoSimples_IDAvaliacao`)
    REFERENCES `mydb`.`AvaliacaoSimples` (`IDAvaliacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagina inicial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pagina inicial` (
  `idEndereço` INT NOT NULL,
  `OláIDUsuario` VARCHAR(45) NOT NULL,
  `Receitas` VARCHAR(45) NOT NULL,
  `Listas de Compras` VARCHAR(45) NOT NULL,
  `Minhas Listas` VARCHAR(45) NOT NULL,
  `Criar Lista` VARCHAR(45) NOT NULL,
  `Receitas_idReceitas` INT NOT NULL,
  `Receitas_IDAvaliação` INT NOT NULL,
  PRIMARY KEY (`idEndereço`),
  INDEX `fk_Pagina inicial_Receitas1_idx` (`Receitas_idReceitas` ASC, `Receitas_IDAvaliação` ASC) VISIBLE,
  CONSTRAINT `fk_Pagina inicial_Receitas1`
    FOREIGN KEY (`Receitas_idReceitas` , `Receitas_IDAvaliação`)
    REFERENCES `mydb`.`Receitas` (`idReceitas` , `IDAvaliação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Perfil` (
  `Notificações` VARCHAR(255) NOT NULL,
  `Favoritos` VARCHAR(45) NULL,
  `Assinaturas` VARCHAR(45) NULL,
  `Cartões` VARCHAR(45) NULL,
  `Endereços` VARCHAR(45) NULL,
  `Meus Dados` VARCHAR(45) NULL,
  `Meus Dados_idInformações Pessoais` VARCHAR(255) NOT NULL,
  `Pagina inicial_idEndereço` INT NOT NULL,
  PRIMARY KEY (`Notificações`),
  INDEX `fk_Perfil_Meus Dados1_idx` (`Meus Dados_idInformações Pessoais` ASC) VISIBLE,
  INDEX `fk_Perfil_Pagina inicial1_idx` (`Pagina inicial_idEndereço` ASC) VISIBLE,
  CONSTRAINT `fk_Perfil_Meus Dados1`
    FOREIGN KEY (`Meus Dados_idInformações Pessoais`)
    REFERENCES `mydb`.`Meus Dados` (`idInformações Pessoais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_Pagina inicial1`
    FOREIGN KEY (`Pagina inicial_idEndereço`)
    REFERENCES `mydb`.`Pagina inicial` (`idEndereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ValorCaloricoIngrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ValorCaloricoIngrediente` (
  `idValorCaloricoIngrediente` INT NOT NULL,
  `idIngrediente` INT NOT NULL,
  `ValorCalorico` DECIMAL(10,2) NOT NULL,
  `DataAtuallizacao` TIMESTAMP NOT NULL,
  `FOREIGN KEY (IDIngrediente) REFERENCES Ingredientes(IDIngrediente)` VARCHAR(45) NOT NULL,
  `CestaIngredientes_idCesta` INT NOT NULL,
  `CestaIngredientes_idUsuario` INT NOT NULL,
  `CestaIngredientes_DetalhesCesta_idDetalhesCesta` INT NOT NULL,
  `Ingredientes_idIngredientes` INT NOT NULL,
  `Ingredientes_CestaIngredientes_idCesta` INT NOT NULL,
  `Ingredientes_CestaIngredientes_idUsuario` INT NOT NULL,
  `Ingredientes_CestaIngredientes_DetalhesCesta_idDetalhesCesta` INT NOT NULL,
  `Ingredientes_DetalhesCesta_idDetalhesCesta` INT NOT NULL,
  PRIMARY KEY (`idValorCaloricoIngrediente`, `CestaIngredientes_idCesta`, `CestaIngredientes_idUsuario`, `CestaIngredientes_DetalhesCesta_idDetalhesCesta`, `Ingredientes_idIngredientes`, `Ingredientes_CestaIngredientes_idCesta`, `Ingredientes_CestaIngredientes_idUsuario`, `Ingredientes_CestaIngredientes_DetalhesCesta_idDetalhesCesta`, `Ingredientes_DetalhesCesta_idDetalhesCesta`),
  INDEX `fk_ValorCaloricoIngrediente_CestaIngredientes1_idx` (`CestaIngredientes_idCesta` ASC, `CestaIngredientes_idUsuario` ASC, `CestaIngredientes_DetalhesCesta_idDetalhesCesta` ASC) VISIBLE,
  INDEX `fk_ValorCaloricoIngrediente_Ingredientes1_idx` (`Ingredientes_idIngredientes` ASC, `Ingredientes_CestaIngredientes_idCesta` ASC, `Ingredientes_CestaIngredientes_idUsuario` ASC, `Ingredientes_CestaIngredientes_DetalhesCesta_idDetalhesCesta` ASC, `Ingredientes_DetalhesCesta_idDetalhesCesta` ASC) VISIBLE,
  CONSTRAINT `fk_ValorCaloricoIngrediente_CestaIngredientes1`
    FOREIGN KEY (`CestaIngredientes_idCesta` , `CestaIngredientes_idUsuario` , `CestaIngredientes_DetalhesCesta_idDetalhesCesta`)
    REFERENCES `mydb`.`CestaIngredientes` (`idCesta` , `idUsuario` , `DetalhesCesta_idDetalhesCesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ValorCaloricoIngrediente_Ingredientes1`
    FOREIGN KEY (`Ingredientes_idIngredientes` , `Ingredientes_CestaIngredientes_idCesta` , `Ingredientes_CestaIngredientes_idUsuario` , `Ingredientes_CestaIngredientes_DetalhesCesta_idDetalhesCesta` , `Ingredientes_DetalhesCesta_idDetalhesCesta`)
    REFERENCES `mydb`.`Ingredientes` (`idIngredientes` , `CestaIngredientes_idCesta` , `CestaIngredientes_idUsuario` , `CestaIngredientes_DetalhesCesta_idDetalhesCesta` , `DetalhesCesta_idDetalhesCesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DetalhesCesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DetalhesCesta` (
  `idDetalhesCesta` INT NOT NULL,
  `idCesta` INT NOT NULL,
  `idIngrediente` INT NULL,
  `Quantidade` INT NULL,
  `FOREIGN KEY (IDCesta) REFERENCES CestaIngredientes(IDCesta),` VARCHAR(45) NULL,
  `FOREIGN KEY (IDIngrediente) REFERENCES Ingredientes(IDIngrediente)` VARCHAR(45) NULL,
  `ValorCaloricoIngrediente_idValorCaloricoIngrediente` INT NOT NULL,
  `ValorCaloricoIngrediente_CestaIngredientes_idCesta` INT NOT NULL,
  `ValorCaloricoIngrediente_CestaIngredientes_idUsuario` INT NOT NULL,
  `ValorCaloricoIngrediente_CestaIngredientes_DetalhesCesta_idDetalhesCesta` INT NOT NULL,
  PRIMARY KEY (`idDetalhesCesta`, `ValorCaloricoIngrediente_idValorCaloricoIngrediente`, `ValorCaloricoIngrediente_CestaIngredientes_idCesta`, `ValorCaloricoIngrediente_CestaIngredientes_idUsuario`, `ValorCaloricoIngrediente_CestaIngredientes_DetalhesCesta_idDetalhesCesta`),
  INDEX `fk_DetalhesCesta_ValorCaloricoIngrediente1_idx` (`ValorCaloricoIngrediente_idValorCaloricoIngrediente` ASC, `ValorCaloricoIngrediente_CestaIngredientes_idCesta` ASC, `ValorCaloricoIngrediente_CestaIngredientes_idUsuario` ASC, `ValorCaloricoIngrediente_CestaIngredientes_DetalhesCesta_idDetalhesCesta` ASC) VISIBLE,
  CONSTRAINT `fk_DetalhesCesta_ValorCaloricoIngrediente1`
    FOREIGN KEY (`ValorCaloricoIngrediente_idValorCaloricoIngrediente` , `ValorCaloricoIngrediente_CestaIngredientes_idCesta` , `ValorCaloricoIngrediente_CestaIngredientes_idUsuario` , `ValorCaloricoIngrediente_CestaIngredientes_DetalhesCesta_idDetalhesCesta`)
    REFERENCES `mydb`.`ValorCaloricoIngrediente` (`idValorCaloricoIngrediente` , `CestaIngredientes_idCesta` , `CestaIngredientes_idUsuario` , `CestaIngredientes_DetalhesCesta_idDetalhesCesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CestaIngredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CestaIngredientes` (
  `idCesta` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `DataCriacao` TIMESTAMP NULL,
  `Status` ENUM('Aberta', 'Confirmada', 'Cancelada') NULL,
  `CestaIngredientescol` VARCHAR(45) NULL,
  `CestaIngredientescol1` VARCHAR(45) NULL,
  `FOREIGN KEY (IDUsuario) REFERENCES Usuarios(IDUsuario)` VARCHAR(45) NULL,
  `DetalhesCesta_idDetalhesCesta` INT NOT NULL,
  PRIMARY KEY (`idCesta`, `idUsuario`, `DetalhesCesta_idDetalhesCesta`),
  INDEX `fk_CestaIngredientes_DetalhesCesta1_idx` (`DetalhesCesta_idDetalhesCesta` ASC) VISIBLE,
  CONSTRAINT `fk_CestaIngredientes_DetalhesCesta1`
    FOREIGN KEY (`DetalhesCesta_idDetalhesCesta`)
    REFERENCES `mydb`.`DetalhesCesta` (`idDetalhesCesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ingredientes` (
  `idIngredientes` INT NULL,
  `Nome` VARCHAR(255) NOT NULL,
  `Descricao` TEXT(25) NOT NULL,
  `QuantidadeEmEstoque` INT NOT NULL,
  `UnidadeMedida` VARCHAR(50) NOT NULL,
  `DataValidade` DATE NOT NULL,
  `Fornecedor` VARCHAR(255) NOT NULL,
  `PrecoUnitario` DECIMAL(10,2) NOT NULL,
  `DataCadastro` TIMESTAMP NOT NULL,
  `CestaIngredientes_idCesta` INT NOT NULL,
  `CestaIngredientes_idUsuario` INT NOT NULL,
  `CestaIngredientes_DetalhesCesta_idDetalhesCesta` INT NOT NULL,
  `DetalhesCesta_idDetalhesCesta` INT NOT NULL,
  PRIMARY KEY (`idIngredientes`, `CestaIngredientes_idCesta`, `CestaIngredientes_idUsuario`, `CestaIngredientes_DetalhesCesta_idDetalhesCesta`, `DetalhesCesta_idDetalhesCesta`),
  INDEX `fk_Ingredientes_CestaIngredientes1_idx` (`CestaIngredientes_idCesta` ASC, `CestaIngredientes_idUsuario` ASC, `CestaIngredientes_DetalhesCesta_idDetalhesCesta` ASC) VISIBLE,
  INDEX `fk_Ingredientes_DetalhesCesta1_idx` (`DetalhesCesta_idDetalhesCesta` ASC) VISIBLE,
  CONSTRAINT `fk_Ingredientes_CestaIngredientes1`
    FOREIGN KEY (`CestaIngredientes_idCesta` , `CestaIngredientes_idUsuario` , `CestaIngredientes_DetalhesCesta_idDetalhesCesta`)
    REFERENCES `mydb`.`CestaIngredientes` (`idCesta` , `idUsuario` , `DetalhesCesta_idDetalhesCesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingredientes_DetalhesCesta1`
    FOREIGN KEY (`DetalhesCesta_idDetalhesCesta`)
    REFERENCES `mydb`.`DetalhesCesta` (`idDetalhesCesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EntregaAgendada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EntregaAgendada` (
  `idEntregaAgendada` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `DataEntrega` DATE NOT NULL,
  `HorarioEntrega` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `DataAgendamento` TIMESTAMP NOT NULL,
  `FOREIGN KEY (IDUsuario) REFERENCES Usuarios(IDUsuario)` VARCHAR(45) NOT NULL,
  `UPDATE EntregaAgendada SET Status = 'Confirmada' WHERE IDEntregaAgendada = <id_do_agendamento>;` VARCHAR(45) NOT NULL,
  `UPDATE EntregaAgendada SET Status = 'Cancelada' WHERE IDEntregaAgendada = <id_do_agendamento>;` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEntregaAgendada`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pagamentos` (
  `idFormaPagamento` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `ValorPago` DECIMAL(10,2) NOT NULL,
  `NumeroCartao` VARCHAR(16) NOT NULL,
  `DataVencimentoCartao` DATE NOT NULL,
  `NomeTitularCartao` VARCHAR(255) NOT NULL,
  `PixChave` VARCHAR(50) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `DataPagamento` DATETIME NOT NULL,
  `FOREIGN KEY (IDPedido) REFERENCES Pedidos(IDPedido)` VARCHAR(45) NOT NULL,
  `EntregaAgendada_idEntregaAgendada` INT NOT NULL,
  PRIMARY KEY (`idFormaPagamento`, `EntregaAgendada_idEntregaAgendada`),
  UNIQUE INDEX `Descricao_UNIQUE` (`idPedido` ASC) VISIBLE,
  INDEX `fk_Pagamentos_EntregaAgendada1_idx` (`EntregaAgendada_idEntregaAgendada` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamentos_EntregaAgendada1`
    FOREIGN KEY (`EntregaAgendada_idEntregaAgendada`)
    REFERENCES `mydb`.`EntregaAgendada` (`idEntregaAgendada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MeusPedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MeusPedidos` (
  `idPedido` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `idCesta` INT NOT NULL,
  `DataPedido` TIMESTAMP NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `TempoEntregaEstimado` INT NOT NULL,
  `EntregaAgendada` DATETIME NOT NULL,
  `FormaPagamento` VARCHAR(45) NOT NULL,
  `Cupom` VARCHAR(50) NOT NULL,
  `DetalhesPedido` TEXT NOT NULL,
  `CustoPedido` DECIMAL(10,2) NOT NULL,
  `TaxaEntrega` DECIMAL(10,2) NOT NULL,
  `ValorTotal` DECIMAL(10,2) NOT NULL,
  `StatusPagamento` VARCHAR(45) NOT NULL,
  `DataPagamento` DATETIME NOT NULL,
  `FOREIGN KEY (IDUsuario) REFERENCES Usuarios(IDUsuario)` VARCHAR(45) NOT NULL,
  `FOREIGN KEY (IDCesta) REFERENCES CestaIngredientes(IDCesta)` VARCHAR(45) NOT NULL,
  `Pagamentos_idFormaPagamento` INT NOT NULL,
  `Pagamentos_EntregaAgendada_idEntregaAgendada` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Pagamentos_idFormaPagamento`, `Pagamentos_EntregaAgendada_idEntregaAgendada`),
  INDEX `fk_MeusPedidos_Pagamentos1_idx` (`Pagamentos_idFormaPagamento` ASC, `Pagamentos_EntregaAgendada_idEntregaAgendada` ASC) VISIBLE,
  CONSTRAINT `fk_MeusPedidos_Pagamentos1`
    FOREIGN KEY (`Pagamentos_idFormaPagamento` , `Pagamentos_EntregaAgendada_idEntregaAgendada`)
    REFERENCES `mydb`.`Pagamentos` (`idFormaPagamento` , `EntregaAgendada_idEntregaAgendada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PedidoConfirmado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PedidoConfirmado` (
  `INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` INT NOT NULL,
  `EntregaAgendada_idEntregaAgendada` INT NOT NULL,
  PRIMARY KEY (`INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');`, `EntregaAgendada_idEntregaAgendada`),
  INDEX `fk_PedidoConfirmado_EntregaAgendada1_idx` (`EntregaAgendada_idEntregaAgendada` ASC) VISIBLE,
  CONSTRAINT `fk_PedidoConfirmado_EntregaAgendada1`
    FOREIGN KEY (`EntregaAgendada_idEntregaAgendada`)
    REFERENCES `mydb`.`EntregaAgendada` (`idEntregaAgendada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EntregaEstimada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EntregaEstimada` (
  `idEntregaEstimada` INT NOT NULL,
  `idPedido` INT NULL,
  `DataEntregaEstimada` DATE NULL,
  `HoraEstimadaEntrega` TIME NULL,
  `Status` VARCHAR(45) NULL,
  `  FOREIGN KEY (IDPedido) REFERENCES Pedidos(IDPedido)` VARCHAR(45) NULL,
  `PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` INT NOT NULL,
  `PedidoConfirmado_EntregaAgendada_idEntregaAgendada` INT NOT NULL,
  PRIMARY KEY (`idEntregaEstimada`, `PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');`, `PedidoConfirmado_EntregaAgendada_idEntregaAgendada`),
  INDEX `fk_EntregaEstimada_PedidoConfirmado1_idx` (`PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` ASC, `PedidoConfirmado_EntregaAgendada_idEntregaAgendada` ASC) VISIBLE,
  CONSTRAINT `fk_EntregaEstimada_PedidoConfirmado1`
    FOREIGN KEY (`PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` , `PedidoConfirmado_EntregaAgendada_idEntregaAgendada`)
    REFERENCES `mydb`.`PedidoConfirmado` (`INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` , `EntregaAgendada_idEntregaAgendada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RastreamentoEntregador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RastreamentoEntregador` (
  `idRastreamentoEntregador` INT NOT NULL,
  `idEntregador` INT NOT NULL,
  `Latidude` DOUBLE NOT NULL,
  `Longitude` DOUBLE NOT NULL,
  `Datahora` TIMESTAMP NOT NULL DEFAULT DEFAULT CURRENT_TIMESTAMP,,
  `FOREIGN KEY (IDEntregador) REFERENCES Entregadores(IDEntregador)` VARCHAR(45) NOT NULL,
  `ChegadaEntregador_idChegadaEntregador` INT NOT NULL,
  `ChegadaEntregador_ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega` INT NOT NULL,
  PRIMARY KEY (`idRastreamentoEntregador`, `ChegadaEntregador_idChegadaEntregador`, `ChegadaEntregador_ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega`),
  INDEX `fk_RastreamentoEntregador_ChegadaEntregador1_idx` (`ChegadaEntregador_idChegadaEntregador` ASC, `ChegadaEntregador_ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega` ASC) VISIBLE,
  CONSTRAINT `fk_RastreamentoEntregador_ChegadaEntregador1`
    FOREIGN KEY (`ChegadaEntregador_idChegadaEntregador` , `ChegadaEntregador_ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega`)
    REFERENCES `mydb`.`ChegadaEntregador` (`idChegadaEntregador` , `ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PedidoEntregue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PedidoEntregue` (
  `idPedidoEntregue` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `Comentario` TEXT NOT NULL,
  `Avaliacao` INT NOT NULL DEFAULT CHECK (Avaliacao >= 0 AND Avaliacao <= 5),,
  `DetalhesPedido` TEXT NULL,
  `ValorTotal` DECIMAL(10,2) NULL,
  `TaxaEntrega` DECIMAL(10,2) NULL,
  `FOREIGN KEY (IDPedido) REFERENCES Pedidos(IDPedido` VARCHAR(45) NULL,
  `PedidoEntreguecol` VARCHAR(45) NULL,
  `RastreamentoEntregador_idRastreamentoEntregador` INT NOT NULL,
  `RastreamentoEntregador_EntregaEstimada_idEntregaEstimada` INT NOT NULL,
  `RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` INT NOT NULL,
  `RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_EntregaAgendada_idEntregaAgendada` INT NOT NULL,
  `RastreamentoEntregador_RastreamentoEntregador_idRastreamentoEntregador` INT NOT NULL,
  `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_idEntregaEstimada` INT NOT NULL,
  `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` INT NOT NULL,
  `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_EntregaAgendada_idEntregaAgendada` INT NOT NULL,
  PRIMARY KEY (`idPedidoEntregue`, `idPedido`, `RastreamentoEntregador_idRastreamentoEntregador`, `RastreamentoEntregador_EntregaEstimada_idEntregaEstimada`, `RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');`, `RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_EntregaAgendada_idEntregaAgendada`, `RastreamentoEntregador_RastreamentoEntregador_idRastreamentoEntregador`, `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_idEntregaEstimada`, `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');`, `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_EntregaAgendada_idEntregaAgendada`),
  INDEX `fk_PedidoEntregue_RastreamentoEntregador1_idx` (`RastreamentoEntregador_idRastreamentoEntregador` ASC, `RastreamentoEntregador_EntregaEstimada_idEntregaEstimada` ASC, `RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` ASC, `RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_EntregaAgendada_idEntregaAgendada` ASC, `RastreamentoEntregador_RastreamentoEntregador_idRastreamentoEntregador` ASC, `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_idEntregaEstimada` ASC, `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` ASC, `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_EntregaAgendada_idEntregaAgendada` ASC) VISIBLE,
  CONSTRAINT `fk_PedidoEntregue_RastreamentoEntregador1`
    FOREIGN KEY (`RastreamentoEntregador_idRastreamentoEntregador` , `RastreamentoEntregador_EntregaEstimada_idEntregaEstimada` , `RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` , `RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_EntregaAgendada_idEntregaAgendada` , `RastreamentoEntregador_RastreamentoEntregador_idRastreamentoEntregador` , `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_idEntregaEstimada` , `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` , `RastreamentoEntregador_RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_EntregaAgendada_idEntregaAgendada`)
    REFERENCES `mydb`.`RastreamentoEntregador` (`idRastreamentoEntregador` , `EntregaEstimada_idEntregaEstimada` , `EntregaEstimada_PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` , `EntregaEstimada_PedidoConfirmado_EntregaAgendada_idEntregaAgendada` , `RastreamentoEntregador_idRastreamentoEntregador` , `RastreamentoEntregador_EntregaEstimada_idEntregaEstimada` , `RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_INSERT INTO PedidosConfirmados (IDPedido, MensagemConfirmacao) VALUES (1, 'Seu pedido foi confirmado! Estamos preparando sua entrega.');` , `RastreamentoEntregador_EntregaEstimada_PedidoConfirmado_EntregaAgendada_idEntregaAgendada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DocumentosFornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DocumentosFornecedor` (
  `idDocumentosFornecedor` INT NOT NULL,
  `idFornecedor` INT NULL,
  `TipoDocumento` VARCHAR(50) NULL,
  `ArquivoDocumento` BLOB NULL,
  `DataUpload` TIMESTAMP NULL DEFAULT DEFAULT CURRENT_TIMESTAMP,
  `FOREIGN KEY (IDFornecedor) REFERENCES Fornecedores(IDFornecedor)` VARCHAR(45) NULL,
  PRIMARY KEY (`idDocumentosFornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ContatoFornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ContatoFornecedor` (
  `idContatoFornecedor` INT NOT NULL,
  `idFornecedor` INT NOT NULL,
  `NomeContato` VARCHAR(255) NOT NULL,
  `EmailContato` VARCHAR(255) NOT NULL,
  `TelefoneContato` VARCHAR(20) NOT NULL,
  `DataRegistro` TIMESTAMP NOT NULL DEFAULT DEFAULT CURRENT_TIMESTAMP,,
  `FOREIGN KEY (IDFornecedor) REFERENCES Fornecedores(IDFornecedor)` VARCHAR(45) NOT NULL,
  `ContatoFornecedorcol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idContatoFornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedores` (
  `idFornecedores` INT NOT NULL,
  `NomeFornecedor` VARCHAR(255) NOT NULL,
  `ContatoFornecedor` VARCHAR(255) NOT NULL,
  `EmailFornecedor` VARCHAR(255) NOT NULL,
  `TelefoneFornecedor` VARCHAR(25) NOT NULL,
  `DataCadastro` TIMESTAMP NOT NULL DEFAULT DEFAULT CURRENT_TIMESTAMP,
  `Fornecedorescol` VARCHAR(45) NOT NULL,
  `DocumentosFornecedor_idDocumentosFornecedor` INT NOT NULL,
  `ContatoFornecedor_idContatoFornecedor` INT NOT NULL,
  PRIMARY KEY (`idFornecedores`, `DocumentosFornecedor_idDocumentosFornecedor`, `ContatoFornecedor_idContatoFornecedor`),
  INDEX `fk_Fornecedores_DocumentosFornecedor1_idx` (`DocumentosFornecedor_idDocumentosFornecedor` ASC) VISIBLE,
  INDEX `fk_Fornecedores_ContatoFornecedor1_idx` (`ContatoFornecedor_idContatoFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Fornecedores_DocumentosFornecedor1`
    FOREIGN KEY (`DocumentosFornecedor_idDocumentosFornecedor`)
    REFERENCES `mydb`.`DocumentosFornecedor` (`idDocumentosFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fornecedores_ContatoFornecedor1`
    FOREIGN KEY (`ContatoFornecedor_idContatoFornecedor`)
    REFERENCES `mydb`.`ContatoFornecedor` (`idContatoFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DocumentosContato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DocumentosContato` (
  `idDocumentosContato` INT NOT NULL,
  `idContato` INT NULL,
  `TipoDocumento` VARCHAR(50) NULL,
  `ArquivoPDF` BLOB NULL,
  `DataUpload` TIMESTAMP NULL DEFAULT DEFAULT CURRENT_TIMESTAMP,,
  `FOREIGN KEY (IDContato) REFERENCES RegistroContato(IDContato)` VARCHAR(45) NULL,
  `DocumentosFornecedor_idDocumentosFornecedor` INT NOT NULL,
  PRIMARY KEY (`idDocumentosContato`, `DocumentosFornecedor_idDocumentosFornecedor`),
  INDEX `fk_DocumentosContato_DocumentosFornecedor1_idx` (`DocumentosFornecedor_idDocumentosFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_DocumentosContato_DocumentosFornecedor1`
    FOREIGN KEY (`DocumentosFornecedor_idDocumentosFornecedor`)
    REFERENCES `mydb`.`DocumentosFornecedor` (`idDocumentosFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RegistroContato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RegistroContato` (
  `idRegistroContato` INT NOT NULL,
  `NomeContato` VARCHAR(255) NULL,
  `CargoContato` VARCHAR(100) NULL,
  `EmailContato` VARCHAR(255) NULL,
  `TelefoneContato` VARCHAR(255) NULL,
  `DataInsercao` TIMESTAMP NULL DEFAULT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `DocumentosContato_idDocumentosContato` INT NOT NULL,
  PRIMARY KEY (`idRegistroContato`, `DocumentosContato_idDocumentosContato`),
  INDEX `fk_RegistroContato_DocumentosContato1_idx` (`DocumentosContato_idDocumentosContato` ASC) VISIBLE,
  CONSTRAINT `fk_RegistroContato_DocumentosContato1`
    FOREIGN KEY (`DocumentosContato_idDocumentosContato`)
    REFERENCES `mydb`.`DocumentosContato` (`idDocumentosContato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contratos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Contratos` (
  `idContratos` INT NOT NULL,
  `NumeroInscricao` VARCHAR(50) NOT NULL,
  `EmailEmpresa` VARCHAR(255) NOT NULL,
  `DataAberturaEmpresa` DATE NOT NULL,
  `TelefoneEmpresa` VARCHAR(20) NOT NULL,
  `NomeFantasia` VARCHAR(255) NOT NULL,
  `PorteEmpresa` VARCHAR(50) NOT NULL,
  `CodigoAtividadePrincipal` INT NOT NULL,
  `DescricaoAtividadePrincipal` VARCHAR(255) NOT NULL,
  `CodigoAtividadeSecundaria` INT NOT NULL,
  `DescricaoAtividadeSecundarias` VARCHAR(255) NOT NULL,
  `CodigoNaturezaJuridica` INT NOT NULL,
  `DescricaoNaturezaJuridica` VARCHAR(255) NOT NULL,
  `EnderecoCompleto` VARCHAR(255) NOT NULL,
  `EnteFederativoResponsavel` VARCHAR(45) NOT NULL,
  `SituacaoCadastral` VARCHAR(45) NOT NULL,
  `DataSituacao` DATE NOT NULL,
  `MotivoSituacao` VARCHAR(255) NOT NULL,
  `SituacaoEspecial` VARCHAR(50) NOT NULL,
  `DataSituacaoEspecial` DATE NOT NULL,
  `Contratoscol` VARCHAR(45) NOT NULL,
  `DocumentosContato_idDocumentosContato` INT NOT NULL,
  `DocumentosContato_DocumentosFornecedor_idDocumentosFornecedor` INT NOT NULL,
  PRIMARY KEY (`idContratos`, `DocumentosContato_idDocumentosContato`, `DocumentosContato_DocumentosFornecedor_idDocumentosFornecedor`),
  INDEX `fk_Contratos_DocumentosContato1_idx` (`DocumentosContato_idDocumentosContato` ASC, `DocumentosContato_DocumentosFornecedor_idDocumentosFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Contratos_DocumentosContato1`
    FOREIGN KEY (`DocumentosContato_idDocumentosContato` , `DocumentosContato_DocumentosFornecedor_idDocumentosFornecedor`)
    REFERENCES `mydb`.`DocumentosContato` (`idDocumentosContato` , `DocumentosFornecedor_idDocumentosFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ConfirmacaoPagamentoEntrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ConfirmacaoPagamentoEntrega` (
  `idConfirmacaoPagamentoEntrega` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `DataConfirmacao` TIMESTAMP NOT NULL,
  `ValorTotalPago` DECIMAL(10,2) NOT NULL,
  `MetodoPagamento` VARCHAR(45) NOT NULL,
  `ConfirmacaoPagamentoEntregacol` VARCHAR(50) NOT NULL,
  `FOREIGN KEY (IDPedido) REFERENCES Pedidos(IDPedido)` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idConfirmacaoPagamentoEntrega`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ChegadaEntregador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ChegadaEntregador` (
  `idChegadaEntregador` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `idEntregador` INT NOT NULL,
  `LatitudeChegada` DOUBLE NOT NULL,
  `LongitudeChegada` DOUBLE NOT NULL,
  `DataHoraChegada` TIMESTAMP NOT NULL,
  `FOREIGN KEY (IDPedido) REFERENCES Pedidos(IDPedido)` VARCHAR(45) NOT NULL,
  `ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega` INT NOT NULL,
  PRIMARY KEY (`idChegadaEntregador`, `ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega`),
  INDEX `fk_ChegadaEntregador_ConfirmacaoPagamentoEntrega1_idx` (`ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega` ASC) VISIBLE,
  CONSTRAINT `fk_ChegadaEntregador_ConfirmacaoPagamentoEntrega1`
    FOREIGN KEY (`ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega`)
    REFERENCES `mydb`.`ConfirmacaoPagamentoEntrega` (`idConfirmacaoPagamentoEntrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RastreamentoEntregador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RastreamentoEntregador` (
  `idRastreamentoEntregador` INT NOT NULL,
  `idEntregador` INT NOT NULL,
  `Latidude` DOUBLE NOT NULL,
  `Longitude` DOUBLE NOT NULL,
  `Datahora` TIMESTAMP NOT NULL DEFAULT DEFAULT CURRENT_TIMESTAMP,,
  `FOREIGN KEY (IDEntregador) REFERENCES Entregadores(IDEntregador)` VARCHAR(45) NOT NULL,
  `ChegadaEntregador_idChegadaEntregador` INT NOT NULL,
  `ChegadaEntregador_ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega` INT NOT NULL,
  PRIMARY KEY (`idRastreamentoEntregador`, `ChegadaEntregador_idChegadaEntregador`, `ChegadaEntregador_ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega`),
  INDEX `fk_RastreamentoEntregador_ChegadaEntregador1_idx` (`ChegadaEntregador_idChegadaEntregador` ASC, `ChegadaEntregador_ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega` ASC) VISIBLE,
  CONSTRAINT `fk_RastreamentoEntregador_ChegadaEntregador1`
    FOREIGN KEY (`ChegadaEntregador_idChegadaEntregador` , `ChegadaEntregador_ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega`)
    REFERENCES `mydb`.`ChegadaEntregador` (`idChegadaEntregador` , `ConfirmacaoPagamentoEntrega_idConfirmacaoPagamentoEntrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PrevisaoChegada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PrevisaoChegada` (
  `idPrevisaoChegada` INT NOT NULL,
  `idCentroDistribuicao` INT NULL,
  `PrevisaoChegada` TIMESTAMP NULL,
  `FOREIGN KEY (IDCentroDistribuicao) REFERENCES CentrosDistribuicao(IDCentroDistribuicao)` VARCHAR(45) NULL,
  `PrevisaoChegadacol` VARCHAR(45) NULL,
  `RastreamentoEntregador_idRastreamentoEntregador` INT NOT NULL,
  PRIMARY KEY (`idPrevisaoChegada`, `RastreamentoEntregador_idRastreamentoEntregador`),
  INDEX `fk_PrevisaoChegada_RastreamentoEntregador1_idx` (`RastreamentoEntregador_idRastreamentoEntregador` ASC) VISIBLE,
  CONSTRAINT `fk_PrevisaoChegada_RastreamentoEntregador1`
    FOREIGN KEY (`RastreamentoEntregador_idRastreamentoEntregador`)
    REFERENCES `mydb`.`RastreamentoEntregador` (`idRastreamentoEntregador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entregadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Entregadores` (
  `idEntregadores` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Senha` VARCHAR(255) NOT NULL,
  `RastreamentoEntregador_idRastreamentoEntregador` INT NOT NULL,
  `PrevisaoChegada_idPrevisaoChegada` INT NOT NULL,
  `PrevisaoChegada_RastreamentoEntregador_idRastreamentoEntregador` INT NOT NULL,
  PRIMARY KEY (`idEntregadores`, `RastreamentoEntregador_idRastreamentoEntregador`, `PrevisaoChegada_idPrevisaoChegada`, `PrevisaoChegada_RastreamentoEntregador_idRastreamentoEntregador`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  INDEX `fk_Entregadores_RastreamentoEntregador1_idx` (`RastreamentoEntregador_idRastreamentoEntregador` ASC) VISIBLE,
  INDEX `fk_Entregadores_PrevisaoChegada1_idx` (`PrevisaoChegada_idPrevisaoChegada` ASC, `PrevisaoChegada_RastreamentoEntregador_idRastreamentoEntregador` ASC) VISIBLE,
  CONSTRAINT `fk_Entregadores_RastreamentoEntregador1`
    FOREIGN KEY (`RastreamentoEntregador_idRastreamentoEntregador`)
    REFERENCES `mydb`.`RastreamentoEntregador` (`idRastreamentoEntregador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entregadores_PrevisaoChegada1`
    FOREIGN KEY (`PrevisaoChegada_idPrevisaoChegada` , `PrevisaoChegada_RastreamentoEntregador_idRastreamentoEntregador`)
    REFERENCES `mydb`.`PrevisaoChegada` (`idPrevisaoChegada` , `RastreamentoEntregador_idRastreamentoEntregador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CentroDistribuicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CentroDistribuicao` (
  `idCentroDistribuicao` INT NOT NULL,
  `NomeCentro` VARCHAR(255) NULL,
  `Latitude` DOUBLE NULL,
  `Longitude` DOUBLE NULL,
  `CentroDistribuicaocol` VARCHAR(45) NULL,
  `RastreamentoEntregador_idRastreamentoEntregador` INT NOT NULL,
  PRIMARY KEY (`idCentroDistribuicao`, `RastreamentoEntregador_idRastreamentoEntregador`),
  INDEX `fk_CentroDistribuicao_RastreamentoEntregador1_idx` (`RastreamentoEntregador_idRastreamentoEntregador` ASC) VISIBLE,
  CONSTRAINT `fk_CentroDistribuicao_RastreamentoEntregador1`
    FOREIGN KEY (`RastreamentoEntregador_idRastreamentoEntregador`)
    REFERENCES `mydb`.`RastreamentoEntregador` (`idRastreamentoEntregador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedidos` (
  `idPedidos` INT NOT NULL,
  `NumeroPedido` VARCHAR(50) NULL,
  `idCentroDistribuicao` INT NULL,
  `StatusPedido` VARCHAR(45) NULL,
  `DataPedido` TIMESTAMP NULL,
  `FOREIGN KEY (IDCentroDistribuicao) REFERENCES CentrosDistribuicao(IDCentroDistribuicao)` VARCHAR(45) NULL,
  `Entregadores_idEntregadores` INT NOT NULL,
  `Entregadores_RastreamentoEntregador_idRastreamentoEntregador` INT NOT NULL,
  `Entregadores_PrevisaoChegada_idPrevisaoChegada` INT NOT NULL,
  `Entregadores_PrevisaoChegada_RastreamentoEntregador_idRastreamentoEntregador` INT NOT NULL,
  PRIMARY KEY (`idPedidos`, `Entregadores_idEntregadores`, `Entregadores_RastreamentoEntregador_idRastreamentoEntregador`, `Entregadores_PrevisaoChegada_idPrevisaoChegada`, `Entregadores_PrevisaoChegada_RastreamentoEntregador_idRastreamentoEntregador`),
  INDEX `fk_Pedidos_Entregadores1_idx` (`Entregadores_idEntregadores` ASC, `Entregadores_RastreamentoEntregador_idRastreamentoEntregador` ASC, `Entregadores_PrevisaoChegada_idPrevisaoChegada` ASC, `Entregadores_PrevisaoChegada_RastreamentoEntregador_idRastreamentoEntregador` ASC) VISIBLE,
  CONSTRAINT `fk_Pedidos_Entregadores1`
    FOREIGN KEY (`Entregadores_idEntregadores` , `Entregadores_RastreamentoEntregador_idRastreamentoEntregador` , `Entregadores_PrevisaoChegada_idPrevisaoChegada` , `Entregadores_PrevisaoChegada_RastreamentoEntregador_idRastreamentoEntregador`)
    REFERENCES `mydb`.`Entregadores` (`idEntregadores` , `RastreamentoEntregador_idRastreamentoEntregador` , `PrevisaoChegada_idPrevisaoChegada` , `PrevisaoChegada_RastreamentoEntregador_idRastreamentoEntregador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
