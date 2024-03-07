use studenti;
select * from student_ispit_predmet_ispitni_rok where vremePismenog >='2019-12-01' order by vremepismenog asc;

select count(*), ye, mo from( select year(vremePismenog) as ye, month(vremePismenog)  as mo from student_ispit_predmet_ispitni_rok where vremePismenog >='2019-12-01' ) as tmpp group by ye, mo order by mo, ye; 

--
select count(*) as cnt, group_concat(stanje order by validan separator ', '), group_concat(ocena separator ', '), idstudent, IDpredmeta
from davorka_dodeljenipredmeti
group by idstudent, IDpredmeta
having cnt > 1;

select *
from davorka_dodeljenipredmeti where idstudent = 50227922 and idpredmeta = 11178;

select * 
from davorka_dodeljenipredmeti where idstudent = 50227922;

select naziv, nastavnik, katedra, GodinaPostavljanja, tip, tipstudija from predmet where nastavnik is not null and nastavnik>0 ;

select naziv, nastavnik, katedra, GodinaPostavljanja, tip, tipstudija from predmet where nastavnik is not null and nastavnik>0 ;
select *
from polaganjeispita
where idpredmetstudenta in (84712,
286576,
361298,
435589,
894036);

---

select count(*) as cnt, group_concat(stanje order by validan separator ', ') as stanja, group_concat(ocena separator ', '), idstudent, IDpredmeta
from davorka_dodeljenipredmeti
group by idstudent, IDpredmeta
having cnt > 1 #and (stanja like '%6, 6%' or stanja like '%6, 11, 6%');

select * 
from davorka_dodeljenipredmeti where idstudent = 275673566 and idpredmeta = 11293;

select *
from polaganjeispita
where idpredmetstudenta in (543971,
573257);

select * from davorka_dodeljenipredmeti
where idstudent=2088243

select * from polaganjeispita

create view student_predmet as
select sc.*, dp.IDPredmetStudenta, dp.IDIzvodjenja, dp.IDpredmeta, dp.Ocena, dp.stanje, dp.validan from studenti_corona sc join davorka_dodeljenipredmeti as dp on sc.idstudenta=dp.idstudent
select * from student_predmet where idstudenta=44748131
select * from studenti_corona 

with
topN AS (
select count(*) as BrPolozenihIspita, idstudent
from davorka_dodeljenipredmeti
where stanje = 6 and validan = 1
group by idstudent 
order by BrPolozenihIspita desc
limit 5)
select ts.godinaStudija, ts.idstudent, dop.ocena, dop.idpredmeta, dop.idpredmetstudenta, ispitnirok.naziv
from davorka_tokstudija as ts
inner join topN on ts.idstudent = topN.idstudent
inner join davorka_dodeljenipredmeti as dop on ts.idstudent = dop.idstudent
inner join ispit on dop.idpredmeta = ispit.idpredmeta and dop.idizvodjenja = ispit.idizvodjenja
inner join ispitnirok on ispit.idispitnirok = ispitnirok.idispitnirok
where dop.stanje = 6 and dop.validan = 1
order by idstudent, godinaStudija;

SELECT *
FROM polaganjeispita
#WHERE idispita in (12478, 13055);

#
WITH
brPolozenih AS (
	SELECT idstudent, idpredmeta, ocena, idizvodjenja, idpredmetstudenta, stanje, validan,
		   COUNT(*) OVER(PARTITION BY idstudent) AS BrPolozenihIspita
	FROM davorka_dodeljenipredmeti
	#WHERE stanje = 6 and validan = 1
    ORDER BY BrPolozenihIspita DESC
),
topN AS (
    SELECT *
    FROM (
		SELECT *, MAX(BrPolozenihIspita) OVER () AS MaxBrPolozenihIspita
		FROM brPolozenih) tmp
        WHERE idstudent = 15630176 # BrPolozenihIspita >= 25
    #WHERE MaxBrPolozenihIspita = BrPolozenihIspita 
)
SELECT topN.idstudent, topN.idpredmeta, topN.ocena, topN.idpredmetstudenta,   topN.stanje, topN.validan,
       ispit.idispita, 
       predmet.Naziv NazivPredmeta, predmet.tip, predmet.tipstudija,
       pis.stanje PolIspitaStanje,
       ispitnirok.sifra SifraRoka, ispitnirok.skolskaGodina # ,ispitnirok.naziv NazivRoka
      
FROM topN
INNER JOIN predmet ON topN.IDpredmeta = predmet.IDpredmeta
INNER JOIN polaganjeispita pis ON pis.IDPredmetStudenta = topN.idpredmetstudenta
INNER JOIN ispit ON pis.idispita = ispit.idispita AND topN.idpredmeta = ispit.idpredmeta AND topN.IDIzvodjenja = ispit.IDIzvodjenja
INNER JOIN ispitnirok ON ispitnirok.idispitnirok = ispit.idispitnirok
INNER JOIN davorka_student ds ON topN.idstudent = ds.idnew
#WHERE ds.GodinaUpisa >= 2019 
order by idstudent, idpredmeta, stanje desc, ocena;

select IDIspitniRok, vremePismenog from ispit
where IDizvodjenja in (202100 ,  202200)
order by 2 asc
select IDpredmeta from davorka_dodeljenipredmeti
where IDizvodjenja = 202100

SELECT count(*)
FROM davorka_dodeljenipredmeti
INNER JOIN davorka_student ON idstudent = idnew
WHERE GodinaUpisa >= 2019 ;

select count(*), idpredmeta, idizvodjenja
from ispit
group by idpredmeta, idizvodjenja;

select *
from ispit
inner join ispitnirok
on ispit.idispitnirok = ispitnirok.idispitnirok
where idpredmeta = 10013; and idizvodjenja = 200800

# 210 verovatno osnovne studije
select count(distinct naziv), tip, tipstudija
from predmet
group by tip, tipstudija;

select count(distinct naziv)
from predmet
where tip = 1 and tipstudija = 210 and naziv not like 'Завршни%';

select *
from davorka_tokstudija
where idstudent = 6909257;

select distinct substring(sifra, 1, 3) from ispitnirok;

# poslednja verzija
WITH 
dodeljeni AS 
(SELECT idstudent, idpredmeta, ocena, idizvodjenja, idpredmetstudenta, stanje, validan 
FROM davorka_dodeljenipredmeti )

SELECT dodeljeni.idstudent, dodeljeni.idpredmeta, dodeljeni.ocena, dodeljeni.idpredmetstudenta, dodeljeni.stanje, dodeljeni.validan, ispit.idispita, 
predmet.Naziv_Eng NazivPredmeta, predmet.tip, predmet.tipstudija, ispitnirok.sifra SifraRoka, ispitnirok.skolskaGodina 

FROM dodeljeni 
INNER JOIN predmet ON dodeljeni.IDpredmeta = predmet.IDpredmeta 
INNER JOIN davorka_student ds ON dodeljeni.idstudent = ds.idnew 
INNER JOIN polaganjeispita pis ON pis.IDPredmetStudenta = dodeljeni.idpredmetstudenta
INNER JOIN ispit ON pis.idispita = ispit.idispita AND dodeljeni.idpredmeta = ispit.idpredmeta AND dodeljeni.IDIzvodjenja = ispit.IDIzvodjenja
INNER JOIN ispitnirok ON ispitnirok.idispitnirok = ispit.idispitnirok
WHERE 1 = 1 AND predmet.tipstudija = 210 AND predmet.tip = 1 AND ds.GodinaUpisa >= 2019
and idstudent = 6909257
order by idstudent, idpredmeta, ocena ;

select * from davorka_dodeljenipredmeti where idstudent = 15630176 and idpredmeta = 10001;
select * from polaganjeispita where idpredmetstudenta in (41453, 168119, 774956);


select *
from predmet p1
inner join predmet p2 on lower(p1.naziv_eng) = lower(p2.naziv_eng)
where p1.idpredmeta != p2.idpredmeta
and p1.naziv_eng != p2.naziv_eng;

select *
from predmet
where naziv like '%,%';

select count(distinct p.Naziv) 
from predmet p 
inner join ispit i on p.IDpredmeta = i.IDpredmeta
where i.vremePismenog>='2019-08-01' and p.tip = 1 and p.Naziv not like 'Завршни предмет%' and p.Naziv not like '%ПРЕДМЕТ ИЗБОРНОГ МОДУЛА%' and p.tipstudija = 210

select * from predmet p where p.Naziv like 'Механика 1' 


select distinct dip.*, pr.Naziv
from predmet pr
inner join davorka_dodeljenipredmeti dip on dip.idpredmeta = pr.idpredmeta
inner join polaganjeispita pi on pi.idpredmetstudenta = dip.idpredmetstudenta
inner join davorka_student s on dip.idstudent = s.idnew
where pr.Naziv = 'Механика 2'
and s.GodinaUpisa = 2019
and dip.stanje = 6







SELECT predmet.naziv as naziv 
FROM predmet 
INNER JOIN  p_osnovni_predmeti ON p_osnovni_predmeti.idpredmeta = predmet.idpredmeta 
WHERE 1 = 1 
AND tip =1 
AND tipStudija = 210 order by 1

select * from p_osnovni_predmeti p
inner join predmet pred on pred.idpredmeta = p.idpredmeta
 where p.Naziv like '%материјали 1%' and lower(p.Naziv) = lower(pred.Naziv) ;

select *
from ispit
where vremePismenog>='2019-08-01';

select count(*) AS Cnt, i.idpredmeta 
from ispit i
inner join davorka_dodeljenipredmeti dip on dip.idpredmeta = i.idpredmeta
inner join polaganjeispita pi on pi.idpredmetstudenta = dip.idpredmetstudenta and i.idispita = pi.idispita
where i.vremePismenog>='2019-08-01'
group by IDpredmeta
order by Cnt desc;

select count(*), p.Naziv, p.idpredmeta
from davorka_dodeljenipredmeti dip
inner join polaganjeispita pi on pi.idpredmetstudenta = dip.idpredmetstudenta
inner join predmet p on dip.idpredmeta = p.idpredmeta
where p.Naziv like 'Математика%'
group by Naziv, idpredmeta;

select count(*), p.Naziv, p.idpredmeta as idp1, pop.idpredmeta as idp2, pop.godina
from davorka_dodeljenipredmeti dip
inner join polaganjeispita pi on pi.idpredmetstudenta = dip.idpredmetstudenta
inner join ispit i on i.idispita = pi.idispita
inner join predmet p on dip.idpredmeta = p.idpredmeta
inner join p_osnovni_predmeti pop on lower(pop.naziv) = lower(p.naziv)
where i.vremePismenog>='2019-08-01'
group by Naziv, idp1, idp2, godina;

select count(*), p.Naziv, pgip.godina
from davorka_dodeljenipredmeti dip
inner join polaganjeispita pi on pi.idpredmetstudenta = dip.idpredmetstudenta
inner join predmet p on dip.idpredmeta = p.idpredmeta
inner join p_izborni_predmeti pop on lower(pop.naziv) = lower(p.naziv)
inner join p_grupe_izbornih_predmeta pgip on pgip.idgizborpredmeta = pop.idgizborpredmeta
group by Naziv, godina;