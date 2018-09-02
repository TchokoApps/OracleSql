load data
infile 's:\kunden2.csv'
append
into table kunden
fields terminated by ";" optionally enclosed by '"'
(KundenNr ,Firma  ,Land   ,Bundesland ,Ort   )
