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

/* i */  select * from eventos 
where numPartMax != numPartAtual and dateCheckEnd > now();

/* j */  select * from eventos 
where numPartMax = numPartAtual and dateInit > now();

/* k */  select * from eventos 
where numPartMax != numPartAtual and dateCheckEnd > now();

/* l */ select *,count(*) as qnt from users u 
inner join user_evento ue on u.id_user=ue.id_user_fk 
where u.dtCadastro between '2023-05-15' and '2023-05-20' 
group by u.id_user having count(*)>=2;

/* PARTE 2 */

/* a */ select round(avg(nota_idesp_ef_iniciais), 2) media_nota_inicial, round(avg(nota_idesp_ef_finais), 2) media_nota_final, 
round(avg(nota_idesp_em), 2) media_nota_em
from escola group by id_municipio;

/* b */ select round(avg(nota_idesp_ef_iniciais), 2) media_nota_inicial, round(avg(nota_idesp_ef_finais), 2) media_nota_final, 
round(avg(nota_idesp_em), 2) media_nota_em
from escola group by id_municipio, ano;

/* c */ select round(avg((nota_idesp_ef_finais+nota_idesp_ef_finais+nota_idesp_em)), 2) as media_soma_notas 
from escola group by id_municipio;