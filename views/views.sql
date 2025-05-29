-- -----------------------------------------------------
-- Média Salaria por Departamento
-- -----------------------------------------------------

CREATE VIEW vw_MediaSalarialPorDepartamento AS
SELECT d.nome AS departamento, 
       ROUND(AVG(f.salarioAtual), 2) AS Media_Salarial
FROM funcionarios f
JOIN departamento d ON f.idDepart = d.idDepartamento
GROUP BY d.nome;

-- -----------------------------------------------------
-- Funcionario com Mais tempo de casa
-- -----------------------------------------------------

CREATE VIEW vw_FuncionariosMaisTempoDeCasa AS
SELECT nome, 
       dataAdmissao, 
       TIMESTAMPDIFF(YEAR, dataAdmissao, CURDATE()) AS Anos_de_Casa
FROM funcionarios
ORDER BY Anos_de_Casa DESC;

-- -----------------------------------------------------
-- Taxa de promoção 
-- -----------------------------------------------------

CREATE VIEW vw_TaxaPromocao AS
SELECT CONCAT(ROUND(100 * (COUNT(DISTINCT hs.idFuncionario) / (SELECT COUNT(*) FROM funcionarios)), 2), '%') AS Taxa_Promocao
FROM historicosalarial hs
GROUP BY hs.idFuncionario
HAVING COUNT(hs.idFuncionario) > 1
LIMIT 1;


-- -----------------------------------------------------
-- Tempo Médio de Permanência por Departamento
-- -----------------------------------------------------

CREATE VIEW vw_TempoMedioPermanencia AS
SELECT d.nome AS departamento,
       ROUND(AVG(TIMESTAMPDIFF(YEAR, f.dataAdmissao, CURDATE())), 2) AS Tempo_Medio_Permanencia
FROM funcionarios f
JOIN departamento d ON f.idDepart = d.idDepartamento
GROUP BY d.nome;