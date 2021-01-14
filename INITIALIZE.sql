--LEE auto disk facts 

--drop table  DISK;
CREATE TABLE "DISK" (
  "NAME" TEXT(1) NOT NULL,
  "CC" real NOT NULL,
  PRIMARY KEY ("NAME", "CC")
);
insert into DISK(NAME,CC) values ('A',0.43);
insert into DISK(NAME,CC) values ('A',0.4);
insert into DISK(NAME,CC) values ('A',0.37);
insert into DISK(NAME,CC) values ('A',0.34);
insert into DISK(NAME,CC) values ('A',0.32);
insert into DISK(NAME,CC) values ('A',0.3);

insert into DISK(NAME,CC) values ('B',0.66);
insert into DISK(NAME,CC) values ('B',0.61);
insert into DISK(NAME,CC) values ('B',0.57);
insert into DISK(NAME,CC) values ('B',0.53);
insert into DISK(NAME,CC) values ('B',0.49);
insert into DISK(NAME,CC) values ('B',0.46);

insert into DISK(NAME,CC) values ('C',1.02);
insert into DISK(NAME,CC) values ('C',0.95);
insert into DISK(NAME,CC) values ('C',0.88);
insert into DISK(NAME,CC) values ('C',0.82);
insert into DISK(NAME,CC) values ('C',0.76);
insert into DISK(NAME,CC) values ('C',0.71);

insert into DISK(NAME,CC) values ('D',1.57);
insert into DISK(NAME,CC) values ('D',1.46);
insert into DISK(NAME,CC) values ('D',1.36);
insert into DISK(NAME,CC) values ('D',1.26);
insert into DISK(NAME,CC) values ('D',1.18);
insert into DISK(NAME,CC) values ('D',1.09);

----in case you have 2 set of autodisk like I do 

--drop table Volumes;
create table Volume2S as 
select distinct Volume from (
select a.cc+b.cc as Volume, a.NAME || b.NAME as Combination from DISK A join disk b ) order by 1;



alter table Volume2S add Combination text(20);

with ta as (
select a.cc+b.cc as Volume, a.NAME ||'('||a.cc||')'|| b.NAME||'('||b.cc||')' as Combination, abs(a.cc-b.cc) as ABS from DISK A join disk b
order by 3 asc)
update Volume2s  set Combination=(select combination from ta where ta.volume=Volume2s.volume limit 1);

------in case you have 1 set
create table Volume1S as 
select distinct Volume from (
select a.cc+b.cc as Volume, a.NAME || b.NAME as Combination from DISK A join disk b where a.name<>b.name ) order by 1;


alter table Volume1S add Combination text(20);

with ta as (
select a.cc+b.cc as Volume, a.NAME ||'('||a.cc||')'|| b.NAME||'('||b.cc||')' as Combination, abs(a.cc-b.cc) as ABS from DISK A join disk b where a.name<>b.name
order by 3 asc)
update Volume1s  set Combination=(select combination from ta where ta.volume=Volume1s.volume limit 1);

--- info from this file https://leeprecision.com/files/instruct/VMD.pdf

--Drop table VMDS;

CREATE TABLE "VMDS" (
  "Brand" TEXT(16),
  "POWDER" TEXT(16),
  "VMD" real
);

insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0697,'11FS');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.1349,'A NITRO100');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0663,'ACC MAG PRO');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0838,'ACCUR #2');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0623,'ACCUR #5');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0653,'ACCUR #7');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0657,'ACCUR #9');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0655,'ACCUR 1680');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0730,'ACCUR 2015');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0694,'ACCUR 2200');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0657,'ACCUR 2230');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0656,'ACCUR 2460');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0748,'ACCUR 2495');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0683,'ACCUR 2520');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0685,'ACCUR 2700');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0748,'ACCUR 3100');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0755,'ACCUR 4064');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0690,'ACCUR 100');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0740,'ACCUR 4350');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0752,'ACCUR 5744');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0688,'ACCUR 8700');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0750,'LT-30');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0771,'LT-32');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.1331,'SOLO 000');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.1099,'SOLO 1500');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0787,'TCM');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.1006,'BLACKHORN 209');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0671,'LRT');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.1278,'R COMPETITION');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0693,'R ENFORCER');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0667,'R HUNTER');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0796,'R SILHOUETTE');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0684,'R TRUE BLUE');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0708,'RAM BIG GAME');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0661,'RAM MAGNUM');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0671,'RAM TAC');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0816,'RAM ZIP');
insert into VMDs(Brand,VMD,Powder) values ('WESTERN',.0681,'X-TERMINATOR');


insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.1063,'ALLIANT STEEL');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0667,'ALNT 300 MP');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0722 ,'ALNT 4000 MR');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0804 ,'ALNT 410');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0753 ,'ALNT AR-COMP');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.1489 ,'ALNT E3');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0651 ,'ALNT VARMINT');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.1341 ,'AMER-SELECT');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0865 ,'BLUE DOT');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.1064 ,'BULLSEYE');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.1262 ,'GREEN DOT');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0742 ,'HERC 2400');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.1122 ,'HERCO');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0889 ,'POWER PISTOL');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.1413 ,'RED DOT');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0746 ,'RELODER 10');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0697 ,'RELODER 17');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0707 ,'RELODER 25');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0728 ,'RELODER 7');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0691 ,'RELODER12');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0706 ,'RELODER15');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0706 ,'RELODER19');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.0697 ,'RELODER22');
insert into VMDs(Brand,VMD,Powder) values ('ALLIANT',.1092 ,'UNIQUE');


insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0715,'BENCHMARK');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0645,'BL-C(2)');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0646,'CFE 223');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0657,'CFE BLK');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0754,'CFE PISTOL');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1462,'CLAYS');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0694,'H 50 BMG');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0678,'H LIL GUN');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0721,'H RETUMBO');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0653,'H-LVR');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0811,'H-PYRDX RS');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0823,'H-PYRODX P');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0658,'H-SUPRFORM');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0731,'H-VARGET');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0713,'H1000');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0656,'H110');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0725,'H322');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0645,'H335');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0691,'H380');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0661,'H414');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0750,'H4198');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0725,'H4350');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0725,'H4831');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0728,'H4895');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0651,'HO US869');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0926,'HP38');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0712,'HS6');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0726,'HYBRID100');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0714,'IMR8133');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1266,'INTERNATIONAL');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0824,'LONGSHOT');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0848,'TITEGROUP');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1300,'TITEWAD');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1099,'UNIVERSAL');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0789,'WIN 244');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0725,'IMR 4007 SSC');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0741,'IMR 4166');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0713,'IMR 4451');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0724,'IMR 4955');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1343,'IMR 700X');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0707,'IMR 7977');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1071,'IMR 800X');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0710,'IMR 8208 XBR');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0921,'IMR BLUE');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1446,'IMR GREEN');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1205,'IMR PB');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1423,'IMR RED');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1196,'IMR TARGET');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.2172,'IMR TRAIL BOSS');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0762,'IMR3031');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0745,'IMR4064');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0792,'IMR4198');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0769,'IMR4227');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0716,'IMR4320');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0735,'IMR4350');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0735,'IMR4831');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0728,'IMR4895');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0725,'IMR7828');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1100,'SR4756');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1046,'SR7625');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0787,'AUTOCOMP');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0684,'SUPRM780');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0931,'WIN 231');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0656,'WIN 296');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0823,'WIN 572');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0655,'WIN 748');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0666,'WIN 760');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1266,'WIN AA LITE');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1296,'WIN AA PLUS');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0810,'WIN ACTION PI');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0718,'WIN MAG RIFLE');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0859,'WIN SUPER HANDI');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0840,'wSUPER-FLD');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.0847,'wSUPER-LIT');
insert into VMDs(Brand,VMD,Powder) values ('HODGDON',.1205,'wSUPER-TAR');

insert into VMDs(Brand,VMD,Powder) values ('ADI',.0741,'AR2205');
insert into VMDs(Brand,VMD,Powder) values ('ADI',.0714,'AR2206');
insert into VMDs(Brand,VMD,Powder) values ('ADI',.0759,'AR2207');
insert into VMDs(Brand,VMD,Powder) values ('ADI',.0725,'AR2208');
insert into VMDs(Brand,VMD,Powder) values ('ADI',.0713,'AR2209');
insert into VMDs(Brand,VMD,Powder) values ('ADI',.0686,'AR2213');
insert into VMDs(Brand,VMD,Powder) values ('ADI',.1208,'AS50');

insert into VMDs(Brand,VMD,Powder) values ('SOCHEM',.0892,'MP200');
insert into VMDs(Brand,VMD,Powder) values ('SOCHEM',.1061,'MS200 ');

insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0913,'v-3N37');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0883,'V-3N38');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0900,'v-N105');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0833,'v-N110');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0776,'v-N120');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0754,'v-N130');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0770,'v-N133');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0777,'v-N135');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0733,'v-N140');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0746,'v-N150');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0734,'v-N160');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0712,'v-N165');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0713,'v-N170');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.1214,'v-N310');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.1210,'v-N320');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.1079,'v-N330');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.1066,'v-N340');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0977,'v-N350');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0705,'V-N530');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0701,'v-N540');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0692,'v-N550');
insert into VMDs(Brand,VMD,Powder) values ('VIHTAVUORI',.0690,'v-N560');

insert into VMDs(Brand,VMD,Powder) values ('NORMA',.0738,'NORMA 200');
insert into VMDs(Brand,VMD,Powder) values ('NORMA',.0728,'NORMA 201');
insert into VMDs(Brand,VMD,Powder) values ('NORMA',.0747,'NORMA 202');
insert into VMDs(Brand,VMD,Powder) values ('NORMA',.0722,'NORMA 203B');
insert into VMDs(Brand,VMD,Powder) values ('NORMA',.0706,'NORMA 204');
insert into VMDs(Brand,VMD,Powder) values ('NORMA',.0715,'NORMA 217');
insert into VMDs(Brand,VMD,Powder) values ('NORMA',.0707,'NORMA MRP');
insert into VMDs(Brand,VMD,Powder) values ('NORMA',.0718,'NORMA URP');



select * from VMDs where brand ='HODGDON' and powder='CFE 223'


create view "HODGDON-CFE 223-2SET" as 
select round(a.volume / b.vmd,2) as Grains, a.Combination
FROM volume2s a
join VMDs b on brand ='HODGDON' and b.powder='CFE 223';

--generate view string here 
select 'round( a.volume / sum(case when brand ='''||brand||''' and powder='''||powder||''' then VMD else 0 end) ,2 ) as "'||brand||':'||powder||'",'
from VMDs order by brand, vmd


create view "TwoDiskSets" as 
select combination,
--round( a.volume / sum(case when brand ='HODGDON' and powder='CFE 223' then VMD else 0 end) ,2 ) as "HODGDON:CFE 223"
round( a.volume / sum(case when brand ='ADI' and powder='AR2213' then VMD else 0 end) ,2 ) as "ADI:AR2213",
round( a.volume / sum(case when brand ='ADI' and powder='AR2209' then VMD else 0 end) ,2 ) as "ADI:AR2209",
round( a.volume / sum(case when brand ='ADI' and powder='AR2206' then VMD else 0 end) ,2 ) as "ADI:AR2206",
round( a.volume / sum(case when brand ='ADI' and powder='AR2208' then VMD else 0 end) ,2 ) as "ADI:AR2208",
round( a.volume / sum(case when brand ='ADI' and powder='AR2205' then VMD else 0 end) ,2 ) as "ADI:AR2205",
round( a.volume / sum(case when brand ='ADI' and powder='AR2207' then VMD else 0 end) ,2 ) as "ADI:AR2207",
round( a.volume / sum(case when brand ='ADI' and powder='AS50' then VMD else 0 end) ,2 ) as "ADI:AS50",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT VARMINT' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT VARMINT",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT 300 MP' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT 300 MP",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER12' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER12",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER 17' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER 17",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER22' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER22",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER15' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER15",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER19' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER19",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER 25' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER 25",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT 4000 MR' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT 4000 MR",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER 7' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER 7",
round( a.volume / sum(case when brand ='ALLIANT' and powder='HERC 2400' then VMD else 0 end) ,2 ) as "ALLIANT:HERC 2400",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER 10' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER 10",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT AR-COMP' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT AR-COMP",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT 410' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT 410",
round( a.volume / sum(case when brand ='ALLIANT' and powder='BLUE DOT' then VMD else 0 end) ,2 ) as "ALLIANT:BLUE DOT",
round( a.volume / sum(case when brand ='ALLIANT' and powder='POWER PISTOL' then VMD else 0 end) ,2 ) as "ALLIANT:POWER PISTOL",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALLIANT STEEL' then VMD else 0 end) ,2 ) as "ALLIANT:ALLIANT STEEL",
round( a.volume / sum(case when brand ='ALLIANT' and powder='BULLSEYE' then VMD else 0 end) ,2 ) as "ALLIANT:BULLSEYE",
round( a.volume / sum(case when brand ='ALLIANT' and powder='UNIQUE' then VMD else 0 end) ,2 ) as "ALLIANT:UNIQUE",
round( a.volume / sum(case when brand ='ALLIANT' and powder='HERCO' then VMD else 0 end) ,2 ) as "ALLIANT:HERCO",
round( a.volume / sum(case when brand ='ALLIANT' and powder='GREEN DOT' then VMD else 0 end) ,2 ) as "ALLIANT:GREEN DOT",
round( a.volume / sum(case when brand ='ALLIANT' and powder='AMER-SELECT' then VMD else 0 end) ,2 ) as "ALLIANT:AMER-SELECT",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RED DOT' then VMD else 0 end) ,2 ) as "ALLIANT:RED DOT",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT E3' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT E3",
round( a.volume / sum(case when brand ='HODGDON' and powder='BL-C(2)' then VMD else 0 end) ,2 ) as "HODGDON:BL-C(2)",
round( a.volume / sum(case when brand ='HODGDON' and powder='H335' then VMD else 0 end) ,2 ) as "HODGDON:H335",
round( a.volume / sum(case when brand ='HODGDON' and powder='CFE 223' then VMD else 0 end) ,2 ) as "HODGDON:CFE 223",
round( a.volume / sum(case when brand ='HODGDON' and powder='HO US869' then VMD else 0 end) ,2 ) as "HODGDON:HO US869",
round( a.volume / sum(case when brand ='HODGDON' and powder='H-LVR' then VMD else 0 end) ,2 ) as "HODGDON:H-LVR",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 748' then VMD else 0 end) ,2 ) as "HODGDON:WIN 748",
round( a.volume / sum(case when brand ='HODGDON' and powder='H110' then VMD else 0 end) ,2 ) as "HODGDON:H110",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 296' then VMD else 0 end) ,2 ) as "HODGDON:WIN 296",
round( a.volume / sum(case when brand ='HODGDON' and powder='CFE BLK' then VMD else 0 end) ,2 ) as "HODGDON:CFE BLK",
round( a.volume / sum(case when brand ='HODGDON' and powder='H-SUPRFORM' then VMD else 0 end) ,2 ) as "HODGDON:H-SUPRFORM",
round( a.volume / sum(case when brand ='HODGDON' and powder='H414' then VMD else 0 end) ,2 ) as "HODGDON:H414",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 760' then VMD else 0 end) ,2 ) as "HODGDON:WIN 760",
round( a.volume / sum(case when brand ='HODGDON' and powder='H LIL GUN' then VMD else 0 end) ,2 ) as "HODGDON:H LIL GUN",
round( a.volume / sum(case when brand ='HODGDON' and powder='SUPRM780' then VMD else 0 end) ,2 ) as "HODGDON:SUPRM780",
round( a.volume / sum(case when brand ='HODGDON' and powder='H380' then VMD else 0 end) ,2 ) as "HODGDON:H380",
round( a.volume / sum(case when brand ='HODGDON' and powder='H 50 BMG' then VMD else 0 end) ,2 ) as "HODGDON:H 50 BMG",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 7977' then VMD else 0 end) ,2 ) as "HODGDON:IMR 7977",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 8208 XBR' then VMD else 0 end) ,2 ) as "HODGDON:IMR 8208 XBR",
round( a.volume / sum(case when brand ='HODGDON' and powder='HS6' then VMD else 0 end) ,2 ) as "HODGDON:HS6",
round( a.volume / sum(case when brand ='HODGDON' and powder='H1000' then VMD else 0 end) ,2 ) as "HODGDON:H1000",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 4451' then VMD else 0 end) ,2 ) as "HODGDON:IMR 4451",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR8133' then VMD else 0 end) ,2 ) as "HODGDON:IMR8133",
round( a.volume / sum(case when brand ='HODGDON' and powder='BENCHMARK' then VMD else 0 end) ,2 ) as "HODGDON:BENCHMARK",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4320' then VMD else 0 end) ,2 ) as "HODGDON:IMR4320",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN MAG RIFLE' then VMD else 0 end) ,2 ) as "HODGDON:WIN MAG RIFLE",
round( a.volume / sum(case when brand ='HODGDON' and powder='H RETUMBO' then VMD else 0 end) ,2 ) as "HODGDON:H RETUMBO",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 4955' then VMD else 0 end) ,2 ) as "HODGDON:IMR 4955",
round( a.volume / sum(case when brand ='HODGDON' and powder='H322' then VMD else 0 end) ,2 ) as "HODGDON:H322",
round( a.volume / sum(case when brand ='HODGDON' and powder='H4350' then VMD else 0 end) ,2 ) as "HODGDON:H4350",
round( a.volume / sum(case when brand ='HODGDON' and powder='H4831' then VMD else 0 end) ,2 ) as "HODGDON:H4831",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 4007 SSC' then VMD else 0 end) ,2 ) as "HODGDON:IMR 4007 SSC",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR7828' then VMD else 0 end) ,2 ) as "HODGDON:IMR7828",
round( a.volume / sum(case when brand ='HODGDON' and powder='HYBRID100' then VMD else 0 end) ,2 ) as "HODGDON:HYBRID100",
round( a.volume / sum(case when brand ='HODGDON' and powder='H4895' then VMD else 0 end) ,2 ) as "HODGDON:H4895",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4895' then VMD else 0 end) ,2 ) as "HODGDON:IMR4895",
round( a.volume / sum(case when brand ='HODGDON' and powder='H-VARGET' then VMD else 0 end) ,2 ) as "HODGDON:H-VARGET",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4350' then VMD else 0 end) ,2 ) as "HODGDON:IMR4350",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4831' then VMD else 0 end) ,2 ) as "HODGDON:IMR4831",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 4166' then VMD else 0 end) ,2 ) as "HODGDON:IMR 4166",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4064' then VMD else 0 end) ,2 ) as "HODGDON:IMR4064",
round( a.volume / sum(case when brand ='HODGDON' and powder='H4198' then VMD else 0 end) ,2 ) as "HODGDON:H4198",
round( a.volume / sum(case when brand ='HODGDON' and powder='CFE PISTOL' then VMD else 0 end) ,2 ) as "HODGDON:CFE PISTOL",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR3031' then VMD else 0 end) ,2 ) as "HODGDON:IMR3031",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4227' then VMD else 0 end) ,2 ) as "HODGDON:IMR4227",
round( a.volume / sum(case when brand ='HODGDON' and powder='AUTOCOMP' then VMD else 0 end) ,2 ) as "HODGDON:AUTOCOMP",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 244' then VMD else 0 end) ,2 ) as "HODGDON:WIN 244",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4198' then VMD else 0 end) ,2 ) as "HODGDON:IMR4198",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN ACTION PI' then VMD else 0 end) ,2 ) as "HODGDON:WIN ACTION PI",
round( a.volume / sum(case when brand ='HODGDON' and powder='H-PYRDX RS' then VMD else 0 end) ,2 ) as "HODGDON:H-PYRDX RS",
round( a.volume / sum(case when brand ='HODGDON' and powder='H-PYRODX P' then VMD else 0 end) ,2 ) as "HODGDON:H-PYRODX P",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 572' then VMD else 0 end) ,2 ) as "HODGDON:WIN 572",
round( a.volume / sum(case when brand ='HODGDON' and powder='LONGSHOT' then VMD else 0 end) ,2 ) as "HODGDON:LONGSHOT",
round( a.volume / sum(case when brand ='HODGDON' and powder='wSUPER-FLD' then VMD else 0 end) ,2 ) as "HODGDON:wSUPER-FLD",
round( a.volume / sum(case when brand ='HODGDON' and powder='wSUPER-LIT' then VMD else 0 end) ,2 ) as "HODGDON:wSUPER-LIT",
round( a.volume / sum(case when brand ='HODGDON' and powder='TITEGROUP' then VMD else 0 end) ,2 ) as "HODGDON:TITEGROUP",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN SUPER HANDI' then VMD else 0 end) ,2 ) as "HODGDON:WIN SUPER HANDI",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR BLUE' then VMD else 0 end) ,2 ) as "HODGDON:IMR BLUE",
round( a.volume / sum(case when brand ='HODGDON' and powder='HP38' then VMD else 0 end) ,2 ) as "HODGDON:HP38",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 231' then VMD else 0 end) ,2 ) as "HODGDON:WIN 231",
round( a.volume / sum(case when brand ='HODGDON' and powder='SR7625' then VMD else 0 end) ,2 ) as "HODGDON:SR7625",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 800X' then VMD else 0 end) ,2 ) as "HODGDON:IMR 800X",
round( a.volume / sum(case when brand ='HODGDON' and powder='UNIVERSAL' then VMD else 0 end) ,2 ) as "HODGDON:UNIVERSAL",
round( a.volume / sum(case when brand ='HODGDON' and powder='SR4756' then VMD else 0 end) ,2 ) as "HODGDON:SR4756",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR TARGET' then VMD else 0 end) ,2 ) as "HODGDON:IMR TARGET",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR PB' then VMD else 0 end) ,2 ) as "HODGDON:IMR PB",
round( a.volume / sum(case when brand ='HODGDON' and powder='wSUPER-TAR' then VMD else 0 end) ,2 ) as "HODGDON:wSUPER-TAR",
round( a.volume / sum(case when brand ='HODGDON' and powder='INTERNATIONAL' then VMD else 0 end) ,2 ) as "HODGDON:INTERNATIONAL",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN AA LITE' then VMD else 0 end) ,2 ) as "HODGDON:WIN AA LITE",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN AA PLUS' then VMD else 0 end) ,2 ) as "HODGDON:WIN AA PLUS",
round( a.volume / sum(case when brand ='HODGDON' and powder='TITEWAD' then VMD else 0 end) ,2 ) as "HODGDON:TITEWAD",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 700X' then VMD else 0 end) ,2 ) as "HODGDON:IMR 700X",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR RED' then VMD else 0 end) ,2 ) as "HODGDON:IMR RED",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR GREEN' then VMD else 0 end) ,2 ) as "HODGDON:IMR GREEN",
round( a.volume / sum(case when brand ='HODGDON' and powder='CLAYS' then VMD else 0 end) ,2 ) as "HODGDON:CLAYS",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR TRAIL BOSS' then VMD else 0 end) ,2 ) as "HODGDON:IMR TRAIL BOSS",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 204' then VMD else 0 end) ,2 ) as "NORMA:NORMA 204",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA MRP' then VMD else 0 end) ,2 ) as "NORMA:NORMA MRP",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 217' then VMD else 0 end) ,2 ) as "NORMA:NORMA 217",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA URP' then VMD else 0 end) ,2 ) as "NORMA:NORMA URP",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 203B' then VMD else 0 end) ,2 ) as "NORMA:NORMA 203B",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 201' then VMD else 0 end) ,2 ) as "NORMA:NORMA 201",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 200' then VMD else 0 end) ,2 ) as "NORMA:NORMA 200",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 202' then VMD else 0 end) ,2 ) as "NORMA:NORMA 202",
round( a.volume / sum(case when brand ='SOCHEM' and powder='MP200' then VMD else 0 end) ,2 ) as "SOCHEM:MP200",
round( a.volume / sum(case when brand ='SOCHEM' and powder='MS200 ' then VMD else 0 end) ,2 ) as "SOCHEM:MS200 ",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N560' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N560",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N550' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N550",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N540' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N540",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='V-N530' then VMD else 0 end) ,2 ) as "VIHTAVUORI:V-N530",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N165' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N165",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N170' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N170",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N140' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N140",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N160' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N160",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N150' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N150",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N130' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N130",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N133' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N133",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N120' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N120",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N135' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N135",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N110' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N110",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='V-3N38' then VMD else 0 end) ,2 ) as "VIHTAVUORI:V-3N38",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N105' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N105",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-3N37' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-3N37",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N350' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N350",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N340' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N340",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N330' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N330",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N320' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N320",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N310' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N310",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR #5' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR #5",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR #7' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR #7",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 1680' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 1680",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2460' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2460",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR #9' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR #9",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2230' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2230",
round( a.volume / sum(case when brand ='WESTERN' and powder='RAM MAGNUM' then VMD else 0 end) ,2 ) as "WESTERN:RAM MAGNUM",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACC MAG PRO' then VMD else 0 end) ,2 ) as "WESTERN:ACC MAG PRO",
round( a.volume / sum(case when brand ='WESTERN' and powder='R HUNTER' then VMD else 0 end) ,2 ) as "WESTERN:R HUNTER",
round( a.volume / sum(case when brand ='WESTERN' and powder='LRT' then VMD else 0 end) ,2 ) as "WESTERN:LRT",
round( a.volume / sum(case when brand ='WESTERN' and powder='RAM TAC' then VMD else 0 end) ,2 ) as "WESTERN:RAM TAC",
round( a.volume / sum(case when brand ='WESTERN' and powder='X-TERMINATOR' then VMD else 0 end) ,2 ) as "WESTERN:X-TERMINATOR",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2520' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2520",
round( a.volume / sum(case when brand ='WESTERN' and powder='R TRUE BLUE' then VMD else 0 end) ,2 ) as "WESTERN:R TRUE BLUE",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2700' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2700",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 8700' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 8700",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 100' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 100",
round( a.volume / sum(case when brand ='WESTERN' and powder='R ENFORCER' then VMD else 0 end) ,2 ) as "WESTERN:R ENFORCER",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2200' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2200",
round( a.volume / sum(case when brand ='WESTERN' and powder='11FS' then VMD else 0 end) ,2 ) as "WESTERN:11FS",
round( a.volume / sum(case when brand ='WESTERN' and powder='RAM BIG GAME' then VMD else 0 end) ,2 ) as "WESTERN:RAM BIG GAME",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2015' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2015",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 4350' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 4350",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2495' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2495",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 3100' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 3100",
round( a.volume / sum(case when brand ='WESTERN' and powder='LT-30' then VMD else 0 end) ,2 ) as "WESTERN:LT-30",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 5744' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 5744",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 4064' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 4064",
round( a.volume / sum(case when brand ='WESTERN' and powder='LT-32' then VMD else 0 end) ,2 ) as "WESTERN:LT-32",
round( a.volume / sum(case when brand ='WESTERN' and powder='TCM' then VMD else 0 end) ,2 ) as "WESTERN:TCM",
round( a.volume / sum(case when brand ='WESTERN' and powder='R SILHOUETTE' then VMD else 0 end) ,2 ) as "WESTERN:R SILHOUETTE",
round( a.volume / sum(case when brand ='WESTERN' and powder='RAM ZIP' then VMD else 0 end) ,2 ) as "WESTERN:RAM ZIP",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR #2' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR #2",
round( a.volume / sum(case when brand ='WESTERN' and powder='BLACKHORN 209' then VMD else 0 end) ,2 ) as "WESTERN:BLACKHORN 209",
round( a.volume / sum(case when brand ='WESTERN' and powder='SOLO 1500' then VMD else 0 end) ,2 ) as "WESTERN:SOLO 1500",
round( a.volume / sum(case when brand ='WESTERN' and powder='R COMPETITION' then VMD else 0 end) ,2 ) as "WESTERN:R COMPETITION",
round( a.volume / sum(case when brand ='WESTERN' and powder='SOLO 000' then VMD else 0 end) ,2 ) as "WESTERN:SOLO 000",
round( a.volume / sum(case when brand ='WESTERN' and powder='A NITRO100' then VMD else 0 end) ,2 ) as "WESTERN:A NITRO100"
from volume2s a join VMDs b
group by combination;



create view "OneDiskSets" as 
select combination,
--round( a.volume / sum(case when brand ='HODGDON' and powder='CFE 223' then VMD else 0 end) ,2 ) as "HODGDON:CFE 223"
round( a.volume / sum(case when brand ='ADI' and powder='AR2213' then VMD else 0 end) ,2 ) as "ADI:AR2213",
round( a.volume / sum(case when brand ='ADI' and powder='AR2209' then VMD else 0 end) ,2 ) as "ADI:AR2209",
round( a.volume / sum(case when brand ='ADI' and powder='AR2206' then VMD else 0 end) ,2 ) as "ADI:AR2206",
round( a.volume / sum(case when brand ='ADI' and powder='AR2208' then VMD else 0 end) ,2 ) as "ADI:AR2208",
round( a.volume / sum(case when brand ='ADI' and powder='AR2205' then VMD else 0 end) ,2 ) as "ADI:AR2205",
round( a.volume / sum(case when brand ='ADI' and powder='AR2207' then VMD else 0 end) ,2 ) as "ADI:AR2207",
round( a.volume / sum(case when brand ='ADI' and powder='AS50' then VMD else 0 end) ,2 ) as "ADI:AS50",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT VARMINT' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT VARMINT",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT 300 MP' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT 300 MP",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER12' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER12",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER 17' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER 17",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER22' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER22",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER15' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER15",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER19' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER19",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER 25' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER 25",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT 4000 MR' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT 4000 MR",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER 7' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER 7",
round( a.volume / sum(case when brand ='ALLIANT' and powder='HERC 2400' then VMD else 0 end) ,2 ) as "ALLIANT:HERC 2400",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RELODER 10' then VMD else 0 end) ,2 ) as "ALLIANT:RELODER 10",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT AR-COMP' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT AR-COMP",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT 410' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT 410",
round( a.volume / sum(case when brand ='ALLIANT' and powder='BLUE DOT' then VMD else 0 end) ,2 ) as "ALLIANT:BLUE DOT",
round( a.volume / sum(case when brand ='ALLIANT' and powder='POWER PISTOL' then VMD else 0 end) ,2 ) as "ALLIANT:POWER PISTOL",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALLIANT STEEL' then VMD else 0 end) ,2 ) as "ALLIANT:ALLIANT STEEL",
round( a.volume / sum(case when brand ='ALLIANT' and powder='BULLSEYE' then VMD else 0 end) ,2 ) as "ALLIANT:BULLSEYE",
round( a.volume / sum(case when brand ='ALLIANT' and powder='UNIQUE' then VMD else 0 end) ,2 ) as "ALLIANT:UNIQUE",
round( a.volume / sum(case when brand ='ALLIANT' and powder='HERCO' then VMD else 0 end) ,2 ) as "ALLIANT:HERCO",
round( a.volume / sum(case when brand ='ALLIANT' and powder='GREEN DOT' then VMD else 0 end) ,2 ) as "ALLIANT:GREEN DOT",
round( a.volume / sum(case when brand ='ALLIANT' and powder='AMER-SELECT' then VMD else 0 end) ,2 ) as "ALLIANT:AMER-SELECT",
round( a.volume / sum(case when brand ='ALLIANT' and powder='RED DOT' then VMD else 0 end) ,2 ) as "ALLIANT:RED DOT",
round( a.volume / sum(case when brand ='ALLIANT' and powder='ALNT E3' then VMD else 0 end) ,2 ) as "ALLIANT:ALNT E3",
round( a.volume / sum(case when brand ='HODGDON' and powder='BL-C(2)' then VMD else 0 end) ,2 ) as "HODGDON:BL-C(2)",
round( a.volume / sum(case when brand ='HODGDON' and powder='H335' then VMD else 0 end) ,2 ) as "HODGDON:H335",
round( a.volume / sum(case when brand ='HODGDON' and powder='CFE 223' then VMD else 0 end) ,2 ) as "HODGDON:CFE 223",
round( a.volume / sum(case when brand ='HODGDON' and powder='HO US869' then VMD else 0 end) ,2 ) as "HODGDON:HO US869",
round( a.volume / sum(case when brand ='HODGDON' and powder='H-LVR' then VMD else 0 end) ,2 ) as "HODGDON:H-LVR",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 748' then VMD else 0 end) ,2 ) as "HODGDON:WIN 748",
round( a.volume / sum(case when brand ='HODGDON' and powder='H110' then VMD else 0 end) ,2 ) as "HODGDON:H110",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 296' then VMD else 0 end) ,2 ) as "HODGDON:WIN 296",
round( a.volume / sum(case when brand ='HODGDON' and powder='CFE BLK' then VMD else 0 end) ,2 ) as "HODGDON:CFE BLK",
round( a.volume / sum(case when brand ='HODGDON' and powder='H-SUPRFORM' then VMD else 0 end) ,2 ) as "HODGDON:H-SUPRFORM",
round( a.volume / sum(case when brand ='HODGDON' and powder='H414' then VMD else 0 end) ,2 ) as "HODGDON:H414",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 760' then VMD else 0 end) ,2 ) as "HODGDON:WIN 760",
round( a.volume / sum(case when brand ='HODGDON' and powder='H LIL GUN' then VMD else 0 end) ,2 ) as "HODGDON:H LIL GUN",
round( a.volume / sum(case when brand ='HODGDON' and powder='SUPRM780' then VMD else 0 end) ,2 ) as "HODGDON:SUPRM780",
round( a.volume / sum(case when brand ='HODGDON' and powder='H380' then VMD else 0 end) ,2 ) as "HODGDON:H380",
round( a.volume / sum(case when brand ='HODGDON' and powder='H 50 BMG' then VMD else 0 end) ,2 ) as "HODGDON:H 50 BMG",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 7977' then VMD else 0 end) ,2 ) as "HODGDON:IMR 7977",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 8208 XBR' then VMD else 0 end) ,2 ) as "HODGDON:IMR 8208 XBR",
round( a.volume / sum(case when brand ='HODGDON' and powder='HS6' then VMD else 0 end) ,2 ) as "HODGDON:HS6",
round( a.volume / sum(case when brand ='HODGDON' and powder='H1000' then VMD else 0 end) ,2 ) as "HODGDON:H1000",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 4451' then VMD else 0 end) ,2 ) as "HODGDON:IMR 4451",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR8133' then VMD else 0 end) ,2 ) as "HODGDON:IMR8133",
round( a.volume / sum(case when brand ='HODGDON' and powder='BENCHMARK' then VMD else 0 end) ,2 ) as "HODGDON:BENCHMARK",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4320' then VMD else 0 end) ,2 ) as "HODGDON:IMR4320",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN MAG RIFLE' then VMD else 0 end) ,2 ) as "HODGDON:WIN MAG RIFLE",
round( a.volume / sum(case when brand ='HODGDON' and powder='H RETUMBO' then VMD else 0 end) ,2 ) as "HODGDON:H RETUMBO",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 4955' then VMD else 0 end) ,2 ) as "HODGDON:IMR 4955",
round( a.volume / sum(case when brand ='HODGDON' and powder='H322' then VMD else 0 end) ,2 ) as "HODGDON:H322",
round( a.volume / sum(case when brand ='HODGDON' and powder='H4350' then VMD else 0 end) ,2 ) as "HODGDON:H4350",
round( a.volume / sum(case when brand ='HODGDON' and powder='H4831' then VMD else 0 end) ,2 ) as "HODGDON:H4831",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 4007 SSC' then VMD else 0 end) ,2 ) as "HODGDON:IMR 4007 SSC",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR7828' then VMD else 0 end) ,2 ) as "HODGDON:IMR7828",
round( a.volume / sum(case when brand ='HODGDON' and powder='HYBRID100' then VMD else 0 end) ,2 ) as "HODGDON:HYBRID100",
round( a.volume / sum(case when brand ='HODGDON' and powder='H4895' then VMD else 0 end) ,2 ) as "HODGDON:H4895",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4895' then VMD else 0 end) ,2 ) as "HODGDON:IMR4895",
round( a.volume / sum(case when brand ='HODGDON' and powder='H-VARGET' then VMD else 0 end) ,2 ) as "HODGDON:H-VARGET",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4350' then VMD else 0 end) ,2 ) as "HODGDON:IMR4350",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4831' then VMD else 0 end) ,2 ) as "HODGDON:IMR4831",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 4166' then VMD else 0 end) ,2 ) as "HODGDON:IMR 4166",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4064' then VMD else 0 end) ,2 ) as "HODGDON:IMR4064",
round( a.volume / sum(case when brand ='HODGDON' and powder='H4198' then VMD else 0 end) ,2 ) as "HODGDON:H4198",
round( a.volume / sum(case when brand ='HODGDON' and powder='CFE PISTOL' then VMD else 0 end) ,2 ) as "HODGDON:CFE PISTOL",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR3031' then VMD else 0 end) ,2 ) as "HODGDON:IMR3031",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4227' then VMD else 0 end) ,2 ) as "HODGDON:IMR4227",
round( a.volume / sum(case when brand ='HODGDON' and powder='AUTOCOMP' then VMD else 0 end) ,2 ) as "HODGDON:AUTOCOMP",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 244' then VMD else 0 end) ,2 ) as "HODGDON:WIN 244",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR4198' then VMD else 0 end) ,2 ) as "HODGDON:IMR4198",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN ACTION PI' then VMD else 0 end) ,2 ) as "HODGDON:WIN ACTION PI",
round( a.volume / sum(case when brand ='HODGDON' and powder='H-PYRDX RS' then VMD else 0 end) ,2 ) as "HODGDON:H-PYRDX RS",
round( a.volume / sum(case when brand ='HODGDON' and powder='H-PYRODX P' then VMD else 0 end) ,2 ) as "HODGDON:H-PYRODX P",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 572' then VMD else 0 end) ,2 ) as "HODGDON:WIN 572",
round( a.volume / sum(case when brand ='HODGDON' and powder='LONGSHOT' then VMD else 0 end) ,2 ) as "HODGDON:LONGSHOT",
round( a.volume / sum(case when brand ='HODGDON' and powder='wSUPER-FLD' then VMD else 0 end) ,2 ) as "HODGDON:wSUPER-FLD",
round( a.volume / sum(case when brand ='HODGDON' and powder='wSUPER-LIT' then VMD else 0 end) ,2 ) as "HODGDON:wSUPER-LIT",
round( a.volume / sum(case when brand ='HODGDON' and powder='TITEGROUP' then VMD else 0 end) ,2 ) as "HODGDON:TITEGROUP",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN SUPER HANDI' then VMD else 0 end) ,2 ) as "HODGDON:WIN SUPER HANDI",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR BLUE' then VMD else 0 end) ,2 ) as "HODGDON:IMR BLUE",
round( a.volume / sum(case when brand ='HODGDON' and powder='HP38' then VMD else 0 end) ,2 ) as "HODGDON:HP38",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN 231' then VMD else 0 end) ,2 ) as "HODGDON:WIN 231",
round( a.volume / sum(case when brand ='HODGDON' and powder='SR7625' then VMD else 0 end) ,2 ) as "HODGDON:SR7625",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 800X' then VMD else 0 end) ,2 ) as "HODGDON:IMR 800X",
round( a.volume / sum(case when brand ='HODGDON' and powder='UNIVERSAL' then VMD else 0 end) ,2 ) as "HODGDON:UNIVERSAL",
round( a.volume / sum(case when brand ='HODGDON' and powder='SR4756' then VMD else 0 end) ,2 ) as "HODGDON:SR4756",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR TARGET' then VMD else 0 end) ,2 ) as "HODGDON:IMR TARGET",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR PB' then VMD else 0 end) ,2 ) as "HODGDON:IMR PB",
round( a.volume / sum(case when brand ='HODGDON' and powder='wSUPER-TAR' then VMD else 0 end) ,2 ) as "HODGDON:wSUPER-TAR",
round( a.volume / sum(case when brand ='HODGDON' and powder='INTERNATIONAL' then VMD else 0 end) ,2 ) as "HODGDON:INTERNATIONAL",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN AA LITE' then VMD else 0 end) ,2 ) as "HODGDON:WIN AA LITE",
round( a.volume / sum(case when brand ='HODGDON' and powder='WIN AA PLUS' then VMD else 0 end) ,2 ) as "HODGDON:WIN AA PLUS",
round( a.volume / sum(case when brand ='HODGDON' and powder='TITEWAD' then VMD else 0 end) ,2 ) as "HODGDON:TITEWAD",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR 700X' then VMD else 0 end) ,2 ) as "HODGDON:IMR 700X",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR RED' then VMD else 0 end) ,2 ) as "HODGDON:IMR RED",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR GREEN' then VMD else 0 end) ,2 ) as "HODGDON:IMR GREEN",
round( a.volume / sum(case when brand ='HODGDON' and powder='CLAYS' then VMD else 0 end) ,2 ) as "HODGDON:CLAYS",
round( a.volume / sum(case when brand ='HODGDON' and powder='IMR TRAIL BOSS' then VMD else 0 end) ,2 ) as "HODGDON:IMR TRAIL BOSS",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 204' then VMD else 0 end) ,2 ) as "NORMA:NORMA 204",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA MRP' then VMD else 0 end) ,2 ) as "NORMA:NORMA MRP",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 217' then VMD else 0 end) ,2 ) as "NORMA:NORMA 217",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA URP' then VMD else 0 end) ,2 ) as "NORMA:NORMA URP",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 203B' then VMD else 0 end) ,2 ) as "NORMA:NORMA 203B",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 201' then VMD else 0 end) ,2 ) as "NORMA:NORMA 201",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 200' then VMD else 0 end) ,2 ) as "NORMA:NORMA 200",
round( a.volume / sum(case when brand ='NORMA' and powder='NORMA 202' then VMD else 0 end) ,2 ) as "NORMA:NORMA 202",
round( a.volume / sum(case when brand ='SOCHEM' and powder='MP200' then VMD else 0 end) ,2 ) as "SOCHEM:MP200",
round( a.volume / sum(case when brand ='SOCHEM' and powder='MS200 ' then VMD else 0 end) ,2 ) as "SOCHEM:MS200 ",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N560' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N560",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N550' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N550",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N540' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N540",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='V-N530' then VMD else 0 end) ,2 ) as "VIHTAVUORI:V-N530",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N165' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N165",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N170' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N170",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N140' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N140",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N160' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N160",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N150' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N150",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N130' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N130",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N133' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N133",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N120' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N120",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N135' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N135",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N110' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N110",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='V-3N38' then VMD else 0 end) ,2 ) as "VIHTAVUORI:V-3N38",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N105' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N105",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-3N37' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-3N37",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N350' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N350",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N340' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N340",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N330' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N330",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N320' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N320",
round( a.volume / sum(case when brand ='VIHTAVUORI' and powder='v-N310' then VMD else 0 end) ,2 ) as "VIHTAVUORI:v-N310",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR #5' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR #5",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR #7' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR #7",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 1680' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 1680",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2460' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2460",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR #9' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR #9",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2230' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2230",
round( a.volume / sum(case when brand ='WESTERN' and powder='RAM MAGNUM' then VMD else 0 end) ,2 ) as "WESTERN:RAM MAGNUM",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACC MAG PRO' then VMD else 0 end) ,2 ) as "WESTERN:ACC MAG PRO",
round( a.volume / sum(case when brand ='WESTERN' and powder='R HUNTER' then VMD else 0 end) ,2 ) as "WESTERN:R HUNTER",
round( a.volume / sum(case when brand ='WESTERN' and powder='LRT' then VMD else 0 end) ,2 ) as "WESTERN:LRT",
round( a.volume / sum(case when brand ='WESTERN' and powder='RAM TAC' then VMD else 0 end) ,2 ) as "WESTERN:RAM TAC",
round( a.volume / sum(case when brand ='WESTERN' and powder='X-TERMINATOR' then VMD else 0 end) ,2 ) as "WESTERN:X-TERMINATOR",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2520' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2520",
round( a.volume / sum(case when brand ='WESTERN' and powder='R TRUE BLUE' then VMD else 0 end) ,2 ) as "WESTERN:R TRUE BLUE",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2700' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2700",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 8700' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 8700",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 100' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 100",
round( a.volume / sum(case when brand ='WESTERN' and powder='R ENFORCER' then VMD else 0 end) ,2 ) as "WESTERN:R ENFORCER",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2200' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2200",
round( a.volume / sum(case when brand ='WESTERN' and powder='11FS' then VMD else 0 end) ,2 ) as "WESTERN:11FS",
round( a.volume / sum(case when brand ='WESTERN' and powder='RAM BIG GAME' then VMD else 0 end) ,2 ) as "WESTERN:RAM BIG GAME",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2015' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2015",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 4350' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 4350",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 2495' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 2495",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 3100' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 3100",
round( a.volume / sum(case when brand ='WESTERN' and powder='LT-30' then VMD else 0 end) ,2 ) as "WESTERN:LT-30",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 5744' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 5744",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR 4064' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR 4064",
round( a.volume / sum(case when brand ='WESTERN' and powder='LT-32' then VMD else 0 end) ,2 ) as "WESTERN:LT-32",
round( a.volume / sum(case when brand ='WESTERN' and powder='TCM' then VMD else 0 end) ,2 ) as "WESTERN:TCM",
round( a.volume / sum(case when brand ='WESTERN' and powder='R SILHOUETTE' then VMD else 0 end) ,2 ) as "WESTERN:R SILHOUETTE",
round( a.volume / sum(case when brand ='WESTERN' and powder='RAM ZIP' then VMD else 0 end) ,2 ) as "WESTERN:RAM ZIP",
round( a.volume / sum(case when brand ='WESTERN' and powder='ACCUR #2' then VMD else 0 end) ,2 ) as "WESTERN:ACCUR #2",
round( a.volume / sum(case when brand ='WESTERN' and powder='BLACKHORN 209' then VMD else 0 end) ,2 ) as "WESTERN:BLACKHORN 209",
round( a.volume / sum(case when brand ='WESTERN' and powder='SOLO 1500' then VMD else 0 end) ,2 ) as "WESTERN:SOLO 1500",
round( a.volume / sum(case when brand ='WESTERN' and powder='R COMPETITION' then VMD else 0 end) ,2 ) as "WESTERN:R COMPETITION",
round( a.volume / sum(case when brand ='WESTERN' and powder='SOLO 000' then VMD else 0 end) ,2 ) as "WESTERN:SOLO 000",
round( a.volume / sum(case when brand ='WESTERN' and powder='A NITRO100' then VMD else 0 end) ,2 ) as "WESTERN:A NITRO100"
from volume1s a join VMDs b
group by combination;
