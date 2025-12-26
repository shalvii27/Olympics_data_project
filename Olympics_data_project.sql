create database atheletes;
use atheletes;
drop table olympic;
create table olympic(
id int,
name varchar(255),
sex varchar(255),
age int,
height int,
weight int,
team varchar(255),
NOC varchar(255),
games varchar(255),
year int,
season varchar(255),
city varchar(255),
sport varchar(255),
event varchar(255),
medal varchar(255)
);

show variables like "secure_file_priv";
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Athletes_Cleaned.csv"
into table olympic
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympic;



-- SQL PROJECT

-- 1. Show how many medal counts present for entire data
select count(medal) from olympic 
where medal <> 'nomedal';
 

-- 2. Show count of unique sports present in Olympics
select count(distinct sport) from olympic;

-- 3. Show how many different medals won by team India
select medal, count(*) from olympic
where team = 'india' and medal != 'Nomedal'
group by medal;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select event,medal,count(*) as medal_count from olympic

where team= 'India' and medal != 'nomedal'
group by event,medal
order by medal_count desc;



-- 5. Show event wise medals won by India in order of year
select event,medal,year,count(*) as medal_count from olympic
where team= 'India' and medal != 'no medal'
group by event,medal,year
order by  year asc;


-- 6. show country who won maximum medals.
select team,count(*) medal_count from olympic
where medal <> 'nomedal'
group by team
order by medal_count desc
limit 1;


-- 7.show top 10 countries whowon gold
select team, medal, count(team) medal_count from olympic
where medal= 'gold'
group by team
order by medal_count desc
limit 10;


--  8. show in which year did United states won most gold medal
select year,team,count(*) as medal_count from olympic
where  medal='gold' and team='United States'
group by year
order by medal_count desc
limit 1;


-- 9. In which sports United States has most medals.
select team,sport,count(medal) as medal_count from olympic
where (team='United States') and (medal != "NoMedal")
group by sport
order by medal_count desc
limit 5;


-- 10. Find top three players who won most medals along with their sports and country
select name,sport,team,count(medal) as medal_count from olympic
where medal != "nomedal"
group by name,sport,team
order by medal_count desc
limit 5;

-- 11. Find player with most gold medals in cycling along with his country.
select name,sport,team,count(medal) as medal_count from olympic
where sport="cycling" and medal="gold"
group by team,name
order by medal_count desc
limit 5;

-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select name,sport,team,count(medal) as medal_count from olympic
where sport="Basketball" and medal != "Nomedal"
group by team,name
order by medal_count desc
limit 5;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select name,sport,medal, count(medal) as medal_count from olympic
where sport="Basketball" and name="Teresa Edwards"
group by name,medal;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select sex,year,count(medal) as medal_count from olympic
group by sex,year
order by medal_count; 

