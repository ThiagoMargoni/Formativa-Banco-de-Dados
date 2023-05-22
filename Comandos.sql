/* a */ select * from places p
inner join events e on p.placeId = e.placeId;

/* b */ select * from places p
where p.placeId not in (
	select pl.placeId from places pl
    inner join events e on pl.placeId = e.placeId
);

/* c */ select * from events e 
where (e.startDate between '2023-01-01' and '2023-09-21');
 
/* d */ select distinct u.userId, u.name, u.email from users u 
inner join userevent ue on u.userId = ue.userId;

/* e */ select count(u.userId) vezes_evento, u.name, u.email from users u 
inner join userevent ue on u.userId = ue.userId
group by u.userId;

/* f */ select max(subquery.quantity), min(subquery.quantity) from 
(select count(*) quantity from events e 
inner join userevent ue on e.eventId = ue.eventId
group by e.eventId) subquery;

/* g */ select round(avg(part.c)) media_participantes from (
	select count(*) c from userevent ue
    group by ue.eventId
) part;

/* h */ select * from users u 
inner join accessrole ar on u.userId = ar.id
inner join roles r on r.roleId = ar.roleId;

/* i */  select * from events 
where quantityAvailable > 0 and checkInMaxDate > now();

/* j */  select * from events 
where quantityAvailable = 0 and startDate > now();

/* k */  select * from events 
where quantityAvailable > 0 and checkInMaxDate > now();

/* l */ select u.userId, u.name, count(*) quantidade_checkIn from users u 
inner join userevent ue on u.userId = ue.userId 
where u.registerDate between '1999-04-04' and '2005-03-03' 
group by u.userId having quantidade_checkIn >= 2;

/* PARTE 2 */

/* a */ select round(avg(nota_idesp_ef_iniciais), 2) media_nota_inicial, round(avg(nota_idesp_ef_finais), 2) media_nota_final, 
round(avg(nota_idesp_em), 2) media_nota_em
from escola group by id_municipio;

/* b */ select round(avg(nota_idesp_ef_iniciais), 2) media_nota_inicial, round(avg(nota_idesp_ef_finais), 2) media_nota_final, 
round(avg(nota_idesp_em), 2) media_nota_em
from escola group by id_municipio, ano;

/* c */ select round(avg((nota_idesp_ef_finais+nota_idesp_ef_finais+nota_idesp_em)), 2) as media_soma_notas 
from escola group by id_municipio;