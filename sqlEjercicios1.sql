create database peliculas;
use peliculas;
create table `peliculas`.`distribution_companies`(
id int not null auto_increment,
company_name varchar(45)null,
primary key (id));

create table `peliculas`.`movies`(
id int not null auto_increment,
movie_title varchar(45)not null,
imdb_rating int not null,
year_released int not null,
budget int not null,
box_office int not null,
languages varchar (45) not null,
primary key(id));

insert into `peliculas`.`distribution_companies`(id,company_name)values("1","Columbia pictures");
insert into `peliculas`.`distribution_companies`(id,company_name)values("2","Paramount pictures");
insert into `peliculas`.`distribution_companies`(id,company_name)values("3","Warner Bros pictures");
insert into `peliculas`.`distribution_companies`(id,company_name)values("4","United Artists");
insert into `peliculas`.`distribution_companies`(id,company_name)values("5","Universal pictures");
insert into `peliculas`.`distribution_companies`(id,company_name)values("6","New Line Cinema");
insert into `peliculas`.`distribution_companies`(id,company_name)values("7","Miramax Films");
insert into `peliculas`.`distribution_companies`(id,company_name)values("8","Buena vista");
insert into `peliculas`.`distribution_companies`(id,company_name)values("9","StudioCanal");


insert into peliculas.movies (id, movie_title, imdb_rating, year_released, budget, box_office, languages) values ("1", "The Shawshank Redemption", "9.2", "1994", "25", "73", "English");
insert into peliculas.movies (id, movie_title, imdb_rating, year_released, budget, box_office, languages) values ("2", "The God Father", "9", "1972", "70", "291", "English");
insert into peliculas.movies (id, movie_title, imdb_rating, year_released, budget, box_office, languages) values ("3", "The Dark Night", "9", "2008", "185", "1006", "English");
insert into peliculas.movies (id, movie_title, imdb_rating, year_released, budget, box_office, languages) values ("4", "The God Father II", "9", "1974", "13", "2", "English");
insert into peliculas.movies (id, movie_title, imdb_rating, year_released, budget, box_office, languages) values ("5", "Schindler´s List", "8", "1993", "22", "322", "German");
insert into peliculas.movies (id, movie_title, imdb_rating, year_released, budget, box_office, languages) values ("6", "Pulp Fiction", "8", "1994", "213", "213", "English");
insert into peliculas.movies (id, movie_title, imdb_rating, year_released, budget, box_office, languages) values ("7", "The Lord of the Rings", "8", "2001", "93", "898", "English");
insert into peliculas.movies (id, movie_title, imdb_rating, year_released, budget, box_office, languages) values ("8", "The Good, the Bad and the Ugly", "8", "1966", "2", "38", "Spanish");

/*Ejercicio01*/
SELECT * FROM peliculas.distribution_companies;

/*Ejercicio02*/
select movie_title,imdb_rating,year_released from peliculas.movies;

/*Ejercicio03*/
select movie_title,box_office from peliculas.movies where box_office > 300;

/*Ejercicio04*/
select company_name from distribution_companies where company_name Like '%Pictures%';

/*Ejercicio05*/
select movie_title, imdb_rating,year_released from peliculas.movies where year_released < 2001 and imdb_rating > 8;

/*Ejercicio06*/
select movie_title, imdb_rating,year_released from peliculas.movies where year_released > 1991 order by year_released asc;

/*Ejercicio07*/
select languages, count(*) as number_of_movies from peliculas.movies group by languages;

/*Ejercicio08*/
select year_released,languages, count(*) as number_of_movies from peliculas.movies group by year_released, languages order by year_released asc;

/*Ejercicio09*/
select languages, avg(budget) as movie_budget from  peliculas.movies group by languages having avg(budget) > 50;

/*Ejercicio10*/
select * from movies;
select movie_title, company_name from peliculas.distribution_companies dc join peliculas.movies m on dc.id = m.distribution_company_id;




