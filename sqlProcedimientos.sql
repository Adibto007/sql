create database db_estudiantes;

use db_estudiantes;

create table estudiante(
id int primary key AUTO_INCREMENT not null,
nombre varchar(100) not null,
NroDocumento int not null,
celular int not null
);

create table materia(
id int primary key AUTO_INCREMENT not null,
nombre varchar(100) not null,
NroCreditos int not null
);

insert into estudiante values ("1","Alexander Fleming","1001","313700");
insert into estudiante values ("2","Manuel Elkin Patarroyo","1002","313701");
insert into estudiante values ("3","Albert Einstein","1003","313702");

insert into materia values ("1","Musica","2");
insert into materia values ("2","Fisica","7");
insert into materia values ("3","Astronomia","5");
insert into materia values ("4","Matematicas","6");
insert into materia values ("5","Biologia","4");
insert into materia values ("6","Quimica","4");
insert into materia values ("7","Escritura","3");

insert into estudiantemateria values ("1","2","5","4.7");
insert into estudiantemateria values ("2","1","5","5.0");
insert into estudiantemateria values ("3","3","2","5.0");
insert into estudiantemateria values ("4","1","6","4.2");
insert into estudiantemateria values ("5","3","4","5.0");

drop procedure if exists uspPromedioEstudiante;
delimiter $$
create procedure uspPromedioEstudiante(in id_estudiante int)
begin
select sum(nota * NroCreditos)/sum(NroCreditos) as PCA from db_estudiantes.estudiantemateria em
join db_estudiantes.materia ma on em.id_materia_fk=ma.id and em.id_estudiante_fk=id_estudiante;
end $$
delimiter ;

call uspPromedioEstudiante(3) ;

select nombre as "Estudiantes sin materias" from db_estudiantes.estudiante
where not exists(select * from db_estudiantes.estudiantemateria
where db_estudiantes.estudiante.id = db_estudiantes.estudiantemateria.id_estudiante_fk);

select e.nombre as "mejor estudiante",
(sum(em.nota * m.NroCreditos)/ sum(m.NroCreditos)) as pca 
from estudiante e join estudiantemateria em on e.id =em.id_estudiante_fk
join materia m on em.id_materia_fk = m.id
group by e.nombre
order by pca desc
limit 1;


