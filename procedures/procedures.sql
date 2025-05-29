-- -----------------------------------------------------
-- Listar Média Salarial
-- -----------------------------------------------------
DELIMITER $$

CREATE PROCEDURE sp_MediaSalarialPorDepartamento()
BEGIN
    SELECT * FROM vw_MediaSalarialPorDepartamento;
END $$

DELIMITER ;

CALL sp_MediaSalarialPorDepartamento();
-- -----------------------------------------------------
-- Listar Funcionários com mais Tempo de Casa
-- -----------------------------------------------------
DELIMITER $$

CREATE PROCEDURE sp_FuncionariosMaisTempoDeCasa(IN qtd INT)
BEGIN
    SELECT nome, 
           dataAdmissao, 
           TIMESTAMPDIFF(YEAR, dataAdmissao, CURDATE()) AS Anos_de_Casa
    FROM funcionarios
    ORDER BY Anos_de_Casa DESC
    LIMIT qtd;
END $$

DELIMITER ;

CALL sp_FuncionariosMaisTempoDeCasa(10);

-- -----------------------------------------------------
-- Tempo Médio de Permanência
-- -----------------------------------------------------
DELIMITER $$

CREATE PROCEDURE sp_TempoMedioPermanencia()
BEGIN
    SELECT * FROM vw_TempoMedioPermanencia;
END $$

DELIMITER ;

CALL sp_TempoMedioPermanencia();