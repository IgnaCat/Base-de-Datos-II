create database if not exists imdb;

create table if not exists film (
 film_id int(11) not null auto_increment,
 title varchar(30) not null,
 description varchar(200),
 release_year year(4),
 constraint film_pk primary key (film_id)
);

create table if not exists actor (
actor_id int(11) not null auto_increment,
last_name varchar(30) not null,
first_name varchar(30),
constraint actor_pk primary key (actor_id)
);

create table if not exists film_actor (
actor_id int(11) not null,
film_id int (11) not null, 
constraint film_actor_pk primary key (film_id, actor_id)
);

alter table film 
 add last_update datetime;
 
alter table actor
 add last_update datetime;

alter table film_actor add
 constraint fk_film
  foreign key (film_id)
  references film(film_id);
   
alter table film_actor add
 constraint fk_actor
  foreign key (actor_id)

  
insert into film(film_id, title, description, release_year, last_update)
 values (1, "Harry Potter", "Mundo magico de hechiceria", "2000", "2020-03-4 13:17:17");
 
insert into actor(actor_id, last_name, first_name, last_update)
 values (1, "Radcliffe", "Daniel", "2020-03-5 14:34:17" ); 
 
insert into film_actor(film_id, actor_id)
 values (1,1);


















