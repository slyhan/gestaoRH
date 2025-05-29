-- -----------------------------------------------------
-- Média salarial por departamento
-- -----------------------------------------------------

select 
	d.nome as Departamento,
    round(avg(f.salarioAtual), 2) as Media_Salarial
from funcionarios f 
join departamento d on f.idDepart = d.idDepartamento
group by d.nome
order by Media_Salarial desc;


-- -----------------------------------------------------
-- Funcionários com mais tempo de casa
-- -----------------------------------------------------

select
	nome,
    dataAdmissao,
    timestampdiff(year, dataAdmissao, CURDATE()) as Anos_de_casa
from funcionarios
order by Anos_de_casa desc
limit 10;

-- -----------------------------------------------------
-- Taxa de promoção 
-- -----------------------------------------------------

select
	concat(round(100 * (count(distinct hs.idFuncionario) / (select count(*) from funcionarios)),2), '%') as Taxa_promocao
from historicosalarial hs
group by hs.idFuncionario
having count(hs.idFuncionario) > 1
limit 1;

-- -----------------------------------------------------
-- Departamento com maior rotatividade
-- -----------------------------------------------------

select d.nome as Departamento,
count(f.idFuncionario) as Num_Admissoes
from funcionarios f
join departamento d on f.idDepart = d.idDepartamento
group by d.nome
order by Num_Admissoes desc;

-- -----------------------------------------------------
-- Cálculo de tempo médio de permanência
-- -----------------------------------------------------

select
	d.nome as Departamento,
    round(avg(timestampdiff(year, f.dataAdmissao, curdate())), 2) as Tempo_Medio_Permanencia
from funcionarios f 
join departamento d on f.idDepart = d.idDepartamento
group by d.nome
order by Tempo_Medio_Permanencia desc;

-- -----------------------------------------------------
-- subquery Funcionário com salário acima da média do seu departamento
-- -----------------------------------------------------

select
	f.nome, f.salarioAtual, d.nome as Departamento
from funcionarios f 
join departamento d on f.idDepart = d.idDepartamento
where f.salarioAtual > (
	select avg(f2.salarioAtual)
    from funcionarios f2
    where f2.idDepart = f.idDepart
)
order by f.salarioAtual desc;

-- -----------------------------------------------------
-- Funcão agregada: Contar total de funcionarios por cargo
-- -----------------------------------------------------

select c.nome as Cargo,
count(f.idFuncionario) AS Total
from funcionarios f
join cargo c on c.idCargo = f.idCargo
group by c.nome
order by Total desc;
