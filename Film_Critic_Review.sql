Drop Table 	Review_Publication	;							
Drop Table Publication;
Drop Table Review;
Drop Table Cinema;
Drop Table Critic;
Drop Table Film;
Drop Table Producer;

Drop Table Producer;
Create Table Producer (
Producer_Id Number(2),
Fname Varchar2(7),
Sname Varchar2(11),
Address Varchar2(29),
City Varchar2(22),
Country Varchar2(8),
Date_Of_Birth Date,
Year_Died Varchar2(4),
Web_Site Varchar2(25),
Career_Earninngs Varchar2(6));








Drop Table Film;
Create Table Film(
Film_Id Number(2),
Name Varchar2(16),
Duration Number(1),
Year_Made Number(4),
Cost Number(7),
Lead_Role Varchar2(7),
Category Varchar2(10),
Producer_Id Number(2));









Drop Table Critic;
Create Table Critic(
Critic_Id Varchar2(2),
Fname Varchar2(5),
Sname Varchar2(7),
Address Varchar2(21),
County Varchar2(8),
Gender Varchar2(6),
Date_Of_Birth Date,
Telephone_No Number(9),
Mobie_No Number(9),
Specialism Varchar2(10),
Qualifications Varchar2(6));








Drop Table Cinema;
Create Table Cinema(
Cinema_Id Number(3),
Name Varchar2(17),
Address Varchar2(11),
Town Varchar2(14),
County Varchar2(8),
Date_Opened Date,
Telephone Number(9),
Email Varchar2(29),
Web_Site Varchar2(25),
Capacity Number(3));









Drop Table Review;
Create Table Review(
Review_Id Number(3),
Title Varchar2(16),
Topic Varchar2(10),
Length Number(4),
Date_Written Date,
Critic_Id Varchar2(2),
Film_Id Varchar2(2),
Verdict Varchar2(9),
Cinema_Id Varchar2(3));









Drop Table Publication;
Create Table Publication(
Publication_Id Number(4),
Name Varchar2(26),
Address Varchar2(11),
County Varchar2(8),
Email_Address Varchar2(33),
Web_Site Varchar2(31),
Frequency Varchar2(7),
Readership Number(5),
Circulation Varchar2(10),
Format Varchar2(10),
Selling_Price Number(6));








Drop Table Review_Publication;
Create Table Review_Publication(
Review_Id Number(3),
Publication_Id Number(4),
Date_Published Date,
Reader_Feedback Varchar2(8));




 --primary keys (PK)
Alter table   Producer  Add constraint  Producer_Producer_Id_Pk Primary Key (Producer_Id);
Alter table   Film  Add constraint  Film_Film_Id_Pk Primary Key (Film_Id);
Alter table   Critic  Add constraint  Critic_Critic_Id_Pk Primary Key (Critic_Id);
Alter table   Cinema  Add constraint  Cinema_Cinema_Id_Pk Primary Key (Cinema_Id);
Alter table   Review  Add constraint  Review_Review_Id_Pk Primary Key (Review_Id);
Alter table   Publication  Add constraint  Publication_Publication_Id_Pk Primary Key (Publication_Id);
Alter table   Review_Publication  Add constraint  RB_Review_Publication_Id_Pk Primary Key (Review_Id,Publication_Id);



  -- Foreign Keys (FK)
Alter table   Film  Add constraint  Film_Producer_Id_Fk Foreign Key (Producer_Id) references Producer(Producer_Id)
Alter table   Review  Add constraint  Review_Critic_Id_Fk Foreign Key (Critic_Id) references Critic(Critic_Id)
Alter table   Review  Add constraint  Review_Cinema_Id_Fk Foreign Key (Cinema_Id) references Cinema(Cinema_Id)
Alter table   Review  Add constraint  Review_Film_Id_Fk Foreign Key (Film_Id) references Film(Film_Id)
Alter table   Review_Publication  Add constraint  RB_Review_Id_Fk Foreign Key (Review_Id) references Review(Review_Id)
Alter table   Review_Publication  Add constraint  RB_Publication_Id_Fk Foreign Key (Publication_Id) references Publication(Publication_Id)
  -- Check Constraints (CK)
Alter table   Film  Add constraint  Film_Lead_Role_Ck check (Lead_Role In ('Actor', 'Actress', 'Villian'));
Alter table   Film  Add constraint  Film_Category_Ck check (Category In ('Comady','Horror','Art','Historical','Romance'));
Alter table   Critic  Add constraint  Critic_Specialism_Ck check (Specialism In ('Comady', 'Horror', 'Art', 'Historical', 'Romance', 'War'));
Alter table   Review  Add constraint  Review_Verdict_Quality_Ck check (Verdict In ('Terrible', 'Good', 'Poor', 'Excellent', 'Fair'));
Alter table   Publication  Add constraint  Publication_Frequency_Ck check (Frequency In ('Monthly', 'Daily', 'Weekly'));
Alter table   Publication  Add constraint  Publication_Circulation_Ck check (Circulation In ('Local', 'National', 'Provincial'));
Alter table   Publication  Add constraint  Publication_Format_Ck check (Format In ('Broadsheet', 'Tabloid'));
Alter table   Review_Publication  Add constraint  RB_Reader_Feedback_Ck check (Reader_Feedback In ('Positive', 'Negative', 'Neutral'));

  -- Unique Constraints (UQ)
Alter table   Producer  Add constraint  Producer_Web_Site_Uq  unique  ( Web_Site );
Alter table   Critic  Add constraint  Critic_Mobile_No_Uq  unique  ( Mobie_No );
Alter table   Cinema  Add constraint  Cinema_Email_Uq  unique  ( Email );
Alter table   Cinema  Add constraint  Cinema_Web_Site_Uq  unique  ( Web_Site );
Alter table   Cinema  Add constraint  Cinema_Telephone_Uq  unique  ( Telephone );
Alter table   Critic  Add constraint  Critic_Telephone_No_Uq  unique  ( Telephone_No );
Alter table   Publication  Add constraint  Publication_Web_Site_Uq  unique  ( Web_Site );


  -- Not Null Constraints (NN)
Alter table   Producer  Modify   Fname Constraint Producer_Fname_Nn Not Null;
Alter table   Producer  Modify   Sname Constraint Producer_Sname_Nn Not Null;
Alter table   Critic  Modify   Fname Constraint Critic_Fname_Nn Not Null;
Alter table   Critic  Modify   Sname Constraint Critic_Sname_Nn Not Null;
Alter table   Film  Modify   Name Constraint Film_Name_Nn Not Null;
Alter table   Cinema  Modify   Name Constraint Cinema_Name_Nn Not Null;




Describe Producer;
Describe Film;
Describe Critic;
Describe Cinema;
Describe Review;
Describe Publication;
Describe Review_Publication;




Select * from Producer;
Select * from Film;
Select * from Critic;
Select * from Cinema;
Select * from Review;
Select * from Publication;





Select count(*) from Producer;
Select count(*) from Film;
Select count(*) from Critic;
Select count(*) from Cinema;
Select count(*) from Review;
Select count(*) from Publication;
Select count(*) from Review_Publication;

 /* Table Name:Producer  */

  /*Producer_Id,Fname,Sname,Address,City,Country,Date_Of_Birth,Year_Died,Web_Site,Career_Earninngs */
Insert Into  Producer Values (10,'Damier','Diver','1º Mayo','Santa Cruz de Tenerife','Cavan','01-Feb-64',2015,'www.dmie.com',200000);
Insert Into  Producer Values (12,'Noel','Hegarty','39 -3 Ayamonte-Huelva','Oviedo','Mayo','24-Jan-77',2016,'www.noel.com',250000);
Insert Into  Producer Values (14,'Noel','McGinley','29651 Málaga','Vitoria','Offaly','14-Dec-71',2010,'www.Gunn.com',300000);
Insert Into  Producer Values (16,'Ollie','Reid','4 Gernika-Lumo','Elx','Monaghan','28-Nov-76',2012,'www.ollie.com',350000);
Insert Into  Producer Values (18,'James','Ruane','callede Franklin Benjamín 34','Madrid','Cork','12-Feb-73',2010,'www.jjms.com',200000);
Insert Into  Producer Values (20,'Raymond','Sweeney','Ctra. del Rincón, 29','Barcelona','Derry','18-Mar-78',2015,'www.raymond.com',250000);
Insert Into  Producer Values (22,'Tony','Boyle','17 - A Riouxa','Santa Cruz de Tenerife','Cavan','28-Jan-59',2016,'www.ubertech.com',300000);
Insert Into  Producer Values (24,'Brendan','Devenney','3 Vigo-Pontevedra','Oviedo','Mayo','24-Nov-67',2010,'www.nixs.com',350000);
Insert Into  Producer Values (26,'Andrew','Gallagher','Ctra. del Rincón, 29','Barcelona','Derry','02-Dec-66',2011,'www.ajnara.com',180000);
Insert Into  Producer Values (28,'James','Gallagher','Carlos Egea Krauel 13-14','Elx','Monaghan','18-Jan-59',2006,'www.ajanta.com',300000);
Insert Into  Producer Values (30,'John','Gildea','5, Retreat Road','Madrid','Cork','23-Feb-69',2008,'www.republic.com',320000);
Insert Into  Producer Values (32,'Michael','Hegarty','19, Croi Oige','Barcelona','Derry','14-Feb-78',2013,'www.goalby.com',330000);
Insert Into  Producer Values (34,'Brian','Roper','7, Glen','Donostia','Cavan','28-Jan-56',2010,'www.chichi.com',300000);
Insert Into  Producer Values (36,'Adrian','Sweeney','88, Malwani','Vitoria','Monaghan','24-Nov-77',2017,'www.ambani.com',280000);
Insert Into  Producer Values (38,'Tony','Blake','254, Proper Road','Valencia','Offaly','02-Dec-56',2007,'www.redchilly.com',250000);
Insert Into  Producer Values (40,'Paul','Callaghan','1º Mayo','Santa Cruz de Tenerife','Cavan','18-Jan-57',2016,'www.kkprod.com',280000);
Insert Into  Producer Values (42,'J','Friel','39 -3 Ayamonte-Huelva','Oviedo','Mayo','23-Feb-67',2009,'www.brprod.com',250000);
Insert Into  Producer Values (44,'Jim','McGuinness','29651 Málaga','Vitoria','Offaly','14-Feb-77',2006,'www.everymove.com',280000);
Insert Into  Producer Values (46,'Brian','McLoughlin','4 Gernika-Lumo','Elx','Monaghan','18-Mar-78',2012,'www.Logics.com',330000);
Insert Into  Producer Values (48,'Ciaran','Byrne','1 - Local Las Tablas','Vitoria','Offaly','28-Jan-66',2013,'www.avg.com',320000);

  /* Table Name:Film  */

  /*Film_Id,Name,Duration,Year_Made,Cost,Lead_Role,Category,Producer_Id */
Insert Into  Film Values (9,'Avatar',3,2006,1114601,'Actor','Horror',10);
Insert Into  Film Values (11,'Avenger',3,2008,2724274,'Actor','Comady',12);
Insert Into  Film Values (13,'Lagaan',3,2009,2374378,'Actor','Romance',14);
Insert Into  Film Values (15,'Quantico',3,2000,2020938,'Actor','Art',16);
Insert Into  Film Values (17,'Suits',3,2006,2486331,'Actor','Historical',18);
Insert Into  Film Values (19,'Two And Half Man',3,2000,1853992,'Actor','Horror',20);
Insert Into  Film Values (21,'Sacred Games',3,2016,1164960,'Actor','Comady',22);
Insert Into  Film Values (23,'Holy Games',2,2008,1652506,'Actor','Romance',24);
Insert Into  Film Values (25,'Halloween',2,2010,1181630,'Actress','Art',26);
Insert Into  Film Values (27,'Padman',2,2016,2784989,'Actress','Historical',28);
Insert Into  Film Values (29,'Padmavat',2,2016,1525793,'Actress','Horror',30);
Insert Into  Film Values (31,'Bajirao',2,2015,1213581,'Actress','Comady',32);
Insert Into  Film Values (33,'Zero',3,2018,2555492,'Actress','Romance',34);
Insert Into  Film Values (35,'Kedarnath',2,2011,1218542,'Actress','Art',36);
Insert Into  Film Values (37,'Titanic',2,2018,1515785,'Actress','Historical',38);
Insert Into  Film Values (39,'Jurassic World',3,2005,1535042,'Actress','Horror',40);
Insert Into  Film Values (41,'Marvel',2,1999,1626473,'Actress','Comady',42);
Insert Into  Film Values (43,'XXX',3,2018,1083846,'Villian','Romance',44);
Insert Into  Film Values (45,'Inception',2,1999,1097309,'Villian','Art',46);
Insert Into  Film Values (47,'Star Wars',3,2015,2567102,'Villian','Historical',48);

  /* Table Name:Critic  */

  /*Critic_Id,Fname,Sname,Address,County,Gender,Date_Of_Birth,Telephone_No,Mobie_No,Specialism,Qualifications */
Insert Into  Critic Values (1,'Craig','Nolan','G-254 Regalia Heights','Cavan','Male','01-Jan-76',891260398,669460569,'Comady','Level1');
Insert Into  Critic Values (2,'Mike','Nash','71 Cypress Garden','Mayo','Male','01-Jan-74',904872385,945297940,'War','Level2');
Insert Into  Critic Values (3,'Enda','Farrell','5 Willow Park','Offaly','Female','01-Feb-78',940822718,923963919,'Romance','Level3');
Insert Into  Critic Values (4,'Susan','Baker','8 Heggins','Monaghan','Female','01-Mar-74',962119108,789276798,'Historical','Level1');
Insert Into  Critic Values (5,'Tom','Leslie','4 Retreat Mews','Cork','Male','01-Sep-81',905064114,946301657,'Art','Level2');
Insert Into  Critic Values (6,'Ham','Daly','9 Monkland','Derry','Male','01-Feb-85',911767660,877203855,'Comady','Level3');
Insert Into  Critic Values (7,'Judy','Lewis','9 Retreat Height','Mayo','Female','01-Apr-73',944094614,756483850,'War','Level4');
Insert Into  Critic Values (8,'Dave','Weir','7 Coosan','Cavan','Female','01-May-77',975023701,897079259,'Romance','Level5');
Insert Into  Critic Values (9,'Doug','West','166 Gravefield','Mayo','Male','01-Mar-71',906224361,674676647,'Historical','Level3');
Insert Into  Critic Values (10,'Sue','Wilson','58 Monksland','Offaly','Male','01-May-86',992017552,985647899,'Art','Level4');
Insert Into  Critic Values (11,'Berti','Folan','88 Givernland','Offaly','Male','01-Feb-74',898032463,763713115,'Comady','Level5');
Insert Into  Critic Values (12,'Tom','Harty','24 Exotica Fresco','Cork','Male','01-Mar-87',975183885,693226804,'War','Level2');
Insert Into  Critic Values (13,'Linda','Egan','999 yeilder','Monaghan','Female','01-Apr-85',975860297,913314503,'Romance','Level1');
Insert Into  Critic Values (14,'Grace','Gill','320 SusuRoad','Cavan','Female','01-Apr-85',921085017,256598764,'Historical','Level2');
Insert Into  Critic Values (15,'Mary','Walsh','40 Victory Land','Cork','Male','01-Mar-76',928952183,741552256,'Art','Level3');
Insert Into  Critic Values (16,'Henry','Stein','5 Death Valley','Derry','Female','28-Nov-98',905217469,929097325,'Comady','Level4');
Insert Into  Critic Values (17,'Ray','Allen','990 Gusan','Derry','Male','01-May-77',767349200,774762860,'War','Level5');
Insert Into  Critic Values (18,'Jim','Teacy','41 RedBlue Appartment','Cavan','Male','11-May-76',986547852,981303340,'Romance','Level3');
Insert Into  Critic Values (19,'Sean','Brown','55 Glenabbn','Cavan','Male','01-Feb-74',365412589,794415818,'Historical','Level4');
Insert Into  Critic Values (20,'Keith','Jervis','67 Rockbrook','Monaghan','Female','01-Mar-87',421569874,933507864,'Art','Level5');

  /* Table Name:Cinema  */

  /*Cinema_Id,Name,Address,Town,County,Date_Opened,Telephone,Email,Web_Site,Capacity */
Insert Into  Cinema Values (100,'Gaur','21 Wilson','Virginia','Cavan','02-Dec-06',416942523,'Gaur@gmail.com','www.Gaur.com',269);
Insert Into  Cinema Values (101,'Exotica','215 Raymond','Castlebar','Mayo','18-Jan-07',435146960,'Exotica@gmail.com','www.Exotica.com',232);
Insert Into  Cinema Values (102,'Mahagun','47 Chipwood','Tullamore','Offaly','12-Feb-07',591527930,'Mahagun@gmail.com','www.Mahagun.com',189);
Insert Into  Cinema Values (103,'JayPee','108 College','Carrickmacross','Monaghan','18-Mar-07',659742704,'JayPee@gmail.com','www.JayPee.com',229);
Insert Into  Cinema Values (104,'RMZ','602 Bridge','Youghal','Cork','01-Feb-08',552050862,'RMZ@gmail.com','www.RMZ.com',258);
Insert Into  Cinema Values (105,'BPTP','10 Oak','Maghera','Derry','24-Jan-08',532879645,'BPTP@gmail.com','www.BPTP.com',221);
Insert Into  Cinema Values (106,'Supertech','12 Bishop','Castlebar','Mayo','14-Dec-15',582552641,'Supertech@outlook.com','www.Supertech.com',279);
Insert Into  Cinema Values (107,'Purvanchal','208 Grayton','Shercock','Cavan','28-Nov-08',472529710,'Purvanchal@outlook.com','www.Purvanchal.com',163);
Insert Into  Cinema Values (108,'Apex','103 Bedford','Ballina','Mayo','23-Feb-16',538465387,'Apex@outlook.com','www.Apex.com',289);
Insert Into  Cinema Values (109,'Hiranandani','82 Harcourt','Birr','Offaly','14-Feb-00',579750931,'Hiranandani@outlook.com','www.Hiranandani.com',186);
Insert Into  Cinema Values (110,'Crossing Republic','212 Wilson','Birr','Offaly','01-Mar-71',601811376,'Crossing Republic@outlook.com','www.Crossing Republic.com',280);
Insert Into  Cinema Values (111,'Golden Builders','213 Raymond','Youghal','Cork','01-May-86',635582248,'Golden Builders@yahoo.com','www.Golden Builders.com',237);
Insert Into  Cinema Values (112,'Unnati','41 Harper','Clones','Monaghan','01-Feb-74',493036081,'Unnati@yahoo.com','www.Unnati.com',227);
Insert Into  Cinema Values (113,'DLF','12 Main','Ballyjamesduff','Cavan','01-Mar-87',590591531,'DLF@yahoo.com','www.DLF.com',226);
Insert Into  Cinema Values (114,'Vatika','10 Raymond','Macroom','Cork','01-Apr-85',626367083,'Vatika@team.net','www.Vatika.com',229);
Insert Into  Cinema Values (115,'Omaxe','31 Mantin','Coleraine','Derry','01-Apr-85',420455439,'Omaxe@team.net','www.Omaxe.com',290);
Insert Into  Cinema Values (116,'Shipra','45 Richmond','Coleraine','Derry','01-Mar-76',513465349,'Shipra@team.net','www.Shipra.com',228);
Insert Into  Cinema Values (117,'Arihant','15 Draper','Cootehill','Cavan','28-Nov-98',541192861,'Arihant@team.net','www.Arihant.com',258);
Insert Into  Cinema Values (118,'Logix ','35 Mondson','Ballyjamesduff','Cavan','01-May-77',596332072,'Logix@team.net','www.Logix .com',208);
Insert Into  Cinema Values (119,'ATS','4 Retreat M','Clones','Monaghan','11-May-76',505666157,'ATS@team.net','www.ATS.com',287);

  /*  Table Name:Review  */

  /*Review_Id,Title,Topic,Length,Date_Written,Critic_Id,Film_Id,Verdict,Cinema_Id */
Insert Into Review Values (200,'Avatar','Comady',1296,'28-Jan-08',19,9,'Fair',108);
Insert Into Review Values (201,'Avenger','Romance',830,'24-Nov-07',7,11,'Good',111);
Insert Into Review Values (202,'Lagaan','Art',1488,'02-Dec-06',1,13,'Terrible',114);
Insert Into Review Values (203,'Quantico','Historical',887,'18-Jan-07',18,15,'Excellent',113);
Insert Into Review Values (204,'Suits','Comady',1074,'12-Feb-07',4,17,'Fair',101);
Insert Into Review Values (205,'Two And Half Man','Romance',869,'18-Mar-07',14,19,'Good',116);
Insert Into Review Values (206,'Sacred Games','Art',1098,'01-Feb-08',14,21,'Poor',113);
Insert Into Review Values (207,'Holy Games','Historical',1419,'24-Jan-08',18,23,'Excellent',101);
Insert Into Review Values (208,'Halloween','Horror',1241,'14-Dec-15',5,25,'Fair',119);
Insert Into Review Values (209,'Padman','Comady',1344,'28-Nov-08',3,27,'Poor',107);
Insert Into Review Values (210,'Padmavat','Romance',1027,'23-Feb-16',7,29,'Terrible',106);
Insert Into Review Values (211,'Bajirao','Art',1158,'14-Feb-00',3,31,'Excellent',107);
Insert Into Review Values (212,'Zero','Historical',1077,'12-Feb-07',17,33,'Fair',107);
Insert Into Review Values (213,'Kedarnath','Romance',832,'18-Mar-07',12,35,'Good',109);
Insert Into Review Values (214,'Titanic','Romance',1277,'01-Feb-08',13,37,'Terrible',102);
Insert Into Review Values (215,'Jurassic World','Comady',964,'24-Jan-08',3,39,'Excellent',102);
Insert Into Review Values (216,'Marvel','Romance',955,'14-Dec-15',9,41,'Poor',115);
Insert Into Review Values (217,'XXX','Art',1378,'28-Nov-08',19,43,'Good',108);
Insert Into Review Values (218,'Inception','Historical',1041,'23-Feb-16',12,45,'Terrible',100);
Insert Into Review Values (219,'Star Wars','Horror',1396,'28-Nov-08',12,47,'Excellent',104);

  /*  Table Name:Publication  */

  /*  Publication_Id,Name,Address,County,Email_Address,Web_Site,Frequency,Readership,Circulation,Format,Selling_Price*/
Insert Into  Publication Values (1001,'Allen Enterprise Ltd.','21 Wilson','Cavan','AllenEnterpriseLtd@gmail.com','www.AllenEnterpriseLtd.com','Monthly',67360,'Provincial','Tabloid',200000);
Insert Into  Publication Values (1002,'Peterson Pvt Ltd.','215 Raymond','Mayo','PetersonPvtLtd@gmail.com','www.PetersonPvtLtd.com','Daily',67795,'Local','Broadsheet',250000);
Insert Into  Publication Values (1003,'Sanchez Enterprise Ltd.','47 Chipwood','Offaly','SanchezEnterpriseLtd@gmail.com','www.SanchezEnterpriseLtd.org','Weekly',68982,'National','Tabloid',300000);
Insert Into  Publication Values (1004,'Tran Pvt Ltd.','108 College','Monaghan','TranPvtLtd@gmail.com','www.TranPvtLtd.com','Monthly',66824,'Provincial','Broadsheet',350000);
Insert Into  Publication Values (1005,'Roberts Solutions','602 Bridge','Cork','RobertsSolutions@gmail.com','www.RobertsSolutions.com','Monthly',68791,'Local','Tabloid',200000);
Insert Into  Publication Values (1006,'MacDonald Pvt Ltd.','10 Oak','Derry','MacDonaldPvtLtd@gmail.com','www.MacDonaldPvtLtd.org','Monthly',66525,'National','Broadsheet',250000);
Insert Into  Publication Values (1007,'VanderJagt Enterprise Ltd.','12 Bishop','Mayo','VanderJagtEnterpriseLtd@gmail.com','www.VanderJagtEnterpriseLtd.ie','Daily',65166,'Provincial','Broadsheet',300000);
Insert Into  Publication Values (1008,'Shippers Solutions','208 Grayton','Cavan','ShippersSolutions@gmail.com','www.ShippersSolutions@gmail.net','Weekly',68869,'Local','Tabloid',350000);
Insert Into  Publication Values (1009,'Franklin Solutions','103 Bedford','Mayo','FranklinSolutions@outlook.com','www.FranklinSolutions.net','Monthly',69522,'National','Broadsheet',180000);
Insert Into  Publication Values (1010,'Steln Enterprise Ltd.','82 Harcourt','Offaly','StelnEnterprise@outlook.com','www.StelnEnterprise.org','Weekly',68377,'Provincial','Tabloid',300000);
Insert Into  Publication Values (1011,'Allen Solutions','212 Wilson','Offaly','AllenSoltions@outlook.com','www.AllenSoltions.net','Monthly',69564,'Local','Broadsheet',320000);
Insert Into  Publication Values (1012,'Peterson Enterprise Ltd.','213 Raymond','Cork','PetersonEnterpriseLtd@outlook.com','www.PetersonEnterpriseLtd.org','Daily',66078,'National','Tabloid',330000);
Insert Into  Publication Values (1013,'Arkham House','481 Oak','Monaghan','ark@yahoo.com','www.ark.in','Weekly',65707,'National','Broadsheet',300000);
Insert Into  Publication Values (1014,'Arcade Publishing','215 Pete','Cavan','ap@yahoo.com','www.ap.in','Monthly',63238,'Local','Tabloid',280000);
Insert Into  Publication Values (1015,'Random House','48 College','Cork','RandomHouse@outlook.com','www.RandomHouse.org','Monthly',63797,'National','Broadsheet',250000);
Insert Into  Publication Values (1016,'Hudson Bay','914 Cherry','Derry','HudsonBay@outlook.com','www.HudsonBay.ie','Daily',63755,'Provincial','Tabloid',280000);
Insert Into  Publication Values (1017,'W.W. Norton','519 Watson','Derry','W.W. Norton@outlook.com','www.W.W.Norton.org','Weekly',64762,'Local','Broadsheet',250000);
Insert Into  Publication Values (1018,'Schoken','16 Elm','Cavan','Schoken@outlook.com','www.Schoken.com','Monthly',63643,'National','Tabloid',280000);
Insert Into  Publication Values (1019,'Rizzoli','108 Pine','Cavan','Rizzoli@outlook.com','www.Rizzoli.com','Daily',67012,'Provincial','Broadsheet',330000);
Insert Into  Publication Values (1020,'Jamesosn','412 Chip','Monaghan','Jamesosn@outlook.com','www.Jameson.org','Monthly',65258,'Local','Tabloid',320000);

  /*  Table Name:Review_Publication  */

  /*Review_Id,Publication_Id,Date_Published,Reader_Feedback */
Insert Into Review_Publication Values (206,1015,'28-Jan-08','Positive');
Insert Into Review_Publication Values (211,1015,'24-Nov-07','Negative');
Insert Into Review_Publication Values (200,1008,'02-Dec-06','Neutral');
Insert Into Review_Publication Values (211,1017,'18-Jan-07','Negative');
Insert Into Review_Publication Values (212,1019,'12-Feb-07','Positive');
Insert Into Review_Publication Values (201,1017,'18-Mar-07','Neutral');
Insert Into Review_Publication Values (216,1012,'01-Feb-08','Positive');
Insert Into Review_Publication Values (219,1011,'24-Jan-08','Negative');
Insert Into Review_Publication Values (208,1020,'14-Dec-15','Neutral');
Insert Into Review_Publication Values (212,1018,'28-Nov-08','Negative');
Insert Into Review_Publication Values (219,1019,'23-Feb-16','Positive');
Insert Into Review_Publication Values (216,1004,'14-Feb-00','Positive');
Insert Into Review_Publication Values (208,1018,'12-Feb-07','Positive');
Insert Into Review_Publication Values (214,1006,'18-Mar-07','Negative');
Insert Into Review_Publication Values (218,1006,'01-Feb-08','Neutral');
Insert Into Review_Publication Values (206,1016,'24-Jan-08','Negative');
Insert Into Review_Publication Values (215,1018,'14-Dec-15','Positive');
Insert Into Review_Publication Values (219,1016,'28-Nov-08','Negative');
Insert Into Review_Publication Values (203,1006,'23-Feb-16','Neutral');
Insert Into Review_Publication Values (218,1009,'28-Nov-08','Negative');
