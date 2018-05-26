-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26-Maio-2018 às 21:02
-- Versão do servidor: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao`
--

CREATE TABLE `cartao` (
  `id` int(11) NOT NULL,
  `numeroCartao` varchar(50) NOT NULL,
  `nomeTitular` varchar(100) NOT NULL,
  `validade` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `filme`
--

CREATE TABLE `filme` (
  `id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `descricao` text NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `faixaetaria` int(11) NOT NULL,
  `duracao` time NOT NULL,
  `emCartaz` int(11) NOT NULL,
  `img` varchar(11) NOT NULL,
  `datainicial` date NOT NULL,
  `datafinal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `filme`
--

INSERT INTO `filme` (`id`, `nome`, `descricao`, `categoria`, `faixaetaria`, `duracao`, `emCartaz`, `img`, `datainicial`, `datafinal`) VALUES
(1, 'Tarzan', 'Tarzan deixou as florestas da África para viver uma vida pacata como John Clayton III, o Lorde Greystoke, ao lado de sua esposa, Jane, na Inglaterra. Agora, ele é convidado para voltar ao Congo, onde passou a maior parte da sua vida, para servir como emissário de troca do Parlamento Britânico. Mas o que Tarzan não sabe é que está se dirigindo para uma armadilha mortal, fruto da vingança do capitão belga Leon Rom.', 'Aventura', 12, '02:02:00', 1, '5.jpg', '2018-05-12', '2018-05-15'),
(2, 'Era do Gelo', 'Vinte mil anos atrás, num mundo coberto de gelo, o mamute Manfred e a preguiça Sid resgatam um bebê humano órfão. Agora, os dois vão enfrentar muitas aventuras até devolver o filhote de gente à sua tribo, que migrou para um novo acampamento.', 'Infantil', 5, '01:51:00', 1, '6.jpg', '2018-05-11', '2018-05-24'),
(3, 'INDEPENDENCE DAY', 'Uma aventura épica mostra um fenômeno em todo o mundo: céus em chamas e o terror nas maiores cidades do planeta. Com ataques cada vez mais fulminantes e uma magnitude sem igual, a aniquilação da raça humana pode estar para acontecer no final de semana do feriado de 4 de julho. Um improvável grupo unido pelo destino tenta evitar o nosso fim.', 'Ficção científica', 12, '02:31:00', 1, '3.jpg', '0000-00-00', '0000-00-00'),
(4, 'Invocação do Mal 2', 'Os famosos demonologistas Lorraine e Ed Warren viajam ao norte de Londres. Lá eles ajudam uma mãe solteira que cria quatro filhos sozinha em uma casa atormentada por espíritos malignos.', 'Terror', 18, '01:41:00', 1, '7.jpg', '2018-05-12', '2018-05-30'),
(5, 'Rampage: Destruição Total', 'Davis Okoye é um primatologista, um homem recluso que compartilha um vínculo inabalável com George, um gorila muito inteligente que está sob seus cuidados desde o nascimento. Quando um experimento genético desonesto é feito em um grupo de predadores que inclui o primata, os animais se transformam em monstros que destroem tudo em seu caminho. Agora, Okoye precisa conseguir um antídoto e impedir que seu amigo provoque uma catástrofe global.', 'Aventura', 14, '02:10:00', 1, '8.jpg', '2018-05-12', '2018-05-30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`id`, `usuario`, `senha`) VALUES
(1, 'admin', 'admin'),
(2, 'vyse', 'clown'),
(8, 'ro', 'drigo'),
(9, 'ana', 'paula');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `nome` varchar(50) NOT NULL,
  `CPF` text NOT NULL,
  `id` int(11) NOT NULL,
  `idLogin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`nome`, `CPF`, `id`, `idLogin`) VALUES
('Rodrigo\'s', '52132156898', 5, 8),
('Ana Paula', '40531568134', 6, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `qtdLugares` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sala`
--

INSERT INTO `sala` (`id`, `qtdLugares`) VALUES
(1, 32),
(2, 32);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessao`
--

CREATE TABLE `sessao` (
  `id` int(11) NOT NULL,
  `idFilme` int(11) NOT NULL,
  `horarioInicio` time NOT NULL,
  `idSala` int(11) NOT NULL,
  `data` date NOT NULL,
  `qtdLugares` int(11) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sessao`
--

INSERT INTO `sessao` (`id`, `idFilme`, `horarioInicio`, `idSala`, `data`, `qtdLugares`, `valor`) VALUES
(1, 1, '15:00:00', 1, '2018-05-27', 16, 15),
(2, 2, '17:30:00', 1, '2018-05-27', 32, 18),
(3, 1, '20:00:00', 1, '2018-05-27', 25, 20),
(4, 1, '13:00:00', 1, '2018-05-28', 29, 15),
(5, 3, '17:30:00', 1, '2018-05-28', 32, 18),
(6, 3, '20:00:00', 1, '2018-05-28', 32, 20),
(7, 3, '13:00:00', 1, '2018-05-29', 32, 15),
(8, 4, '15:00:00', 1, '2018-05-29', 32, 18),
(9, 5, '17:30:00', 1, '2018-05-29', 32, 18),
(10, 4, '20:00:00', 1, '2018-05-29', 32, 20),
(11, 5, '13:00:00', 1, '2018-05-27', 32, 15),
(12, 4, '15:00:00', 1, '2018-05-28', 32, 15),
(13, 2, '13:00:00', 1, '2018-05-31', 32, 15),
(14, 5, '15:00:00', 1, '2018-05-31', 32, 15),
(15, 2, '17:30:00', 1, '2018-05-31', 32, 18),
(16, 4, '20:00:00', 1, '2018-05-31', 32, 20);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id` int(11) NOT NULL,
  `pessoa` int(11) NOT NULL,
  `sessao` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id`, `pessoa`, `sessao`, `quantidade`) VALUES
(4, 1, 4, 1),
(5, 1, 3, 2),
(6, 1, 1, 3),
(7, 1, 1, 2),
(8, 1, 1, 2),
(9, 1, 1, 2),
(10, 1, 1, 1),
(11, 1, 4, 1),
(12, 1, 3, 1),
(13, 1, 1, 1),
(14, 1, 1, 1),
(15, 1, 1, 1),
(16, 1, 3, 1),
(17, 1, 3, 3),
(18, 1, 1, 2),
(19, 1, 1, 1),
(20, 1, 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cartao`
--
ALTER TABLE `cartao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idLogin` (`idLogin`);

--
-- Indexes for table `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessao`
--
ALTER TABLE `sessao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idFilme` (`idFilme`),
  ADD KEY `fk_sessao_sala` (`idSala`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_venda_sessao` (`sessao`),
  ADD KEY `fk_venda_login` (`pessoa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cartao`
--
ALTER TABLE `cartao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filme`
--
ALTER TABLE `filme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sala`
--
ALTER TABLE `sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sessao`
--
ALTER TABLE `sessao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `idLogin` FOREIGN KEY (`idLogin`) REFERENCES `login` (`id`);

--
-- Limitadores para a tabela `sessao`
--
ALTER TABLE `sessao`
  ADD CONSTRAINT `fk_sessao_sala` FOREIGN KEY (`idSala`) REFERENCES `sala` (`id`),
  ADD CONSTRAINT `idFilme` FOREIGN KEY (`idFilme`) REFERENCES `filme` (`id`),
  ADD CONSTRAINT `idSala` FOREIGN KEY (`idSala`) REFERENCES `sala` (`id`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_login` FOREIGN KEY (`pessoa`) REFERENCES `login` (`id`),
  ADD CONSTRAINT `fk_venda_sessao` FOREIGN KEY (`sessao`) REFERENCES `sessao` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
