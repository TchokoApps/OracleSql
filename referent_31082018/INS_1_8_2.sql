delete from notiz;
delete from person;
delete from firma;

-------------------------------------------------------------------------------
insert into Firma values (1, 'Integrata Training AG', 'München');
insert into Firma values (2, 'ING DiBa', 'Frankfurt');
insert into Firma values (3, 'ALTER data GmbH', 'Tübingen ');
insert into person values (1, 1, 'Herr Huber', 10);
insert into person values (1, 2, 'Herr Maier', 20);
insert into person values (2, 1, 'Frau Nürnberger', 20);
insert into person values (3, 1, 'Herr Bejic', 10);
insert into notiz values (1, 1, 1, 'Hat angerufen', 'OFFEN', '01-JAN-99');
insert into notiz values (1, 1, 2, 'Termin vereinbart', 'ERLEDIGT', '01-MAI-99');

commit;