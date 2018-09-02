SELECT
    *
FROM
    tbuch
    INNER JOIN tisbn ON tbuch.buchnr = tisbn.buchnr;
--------------------------------------------------------------------------------
-- zeige nun alle bücher,auch wenn sie keine ISBN haben

SELECT
    *
FROM
    tbuch
    LEFT JOIN tisbn ON tbuch.buchnr = tisbn.buchnr;
    
--------------------------------------------------------------------------------
-- zeige nun alle bücher,auch wenn sie keine ISBN haben

SELECT
    *
FROM
    tbuch
    RIGHT JOIN tisbn ON tbuch.buchnr = tisbn.buchnr;
--------------------------------------------------------------------------------
-- join zwischen TBUCH und TVAUTOR

SELECT
    *
FROM
    tbuch
    INNER JOIN tvautor ON tvautor.buchnr = tbuch.buchnr;
--------------------------------------------------------------------------------

SELECT
    *
FROM
    tbuch
    INNER JOIN tvautor ON tvautor.buchnr = tbuch.buchnr
    INNER JOIN tautor ON tvautor.autornr = tautor.autornr;
--------------------------------------------------------------------------------

SELECT
    *
FROM
    tbuch
    INNER JOIN tvautor ON tvautor.buchnr = tbuch.buchnr
    INNER JOIN tautor ON tvautor.autornr = tautor.autornr
    INNER JOIN tisbn ON tbuch.buchnr = tisbn.buchnr;
--------------------------------------------------------------------------------

SELECT
    *
FROM
    tbuch
    LEFT JOIN tvautor ON tvautor.buchnr = tbuch.buchnr
    LEFT JOIN tautor ON tvautor.autornr = tautor.autornr
    LEFT JOIN tisbn ON tbuch.buchnr = tisbn.buchnr
ORDER BY 1;
--------------------------------------------------------------------------------
--Zeigen Sie anzahl  bücher pro author

SELECT
    tautor.autornr,
    tautor.autor,
    COUNT(buchnr)
FROM
    tvautor
    INNER JOIN tautor ON tvautor.autornr = tautor.autornr
GROUP BY
    tautor.autornr,
    tautor.autor;
----------------------------------------------------------------------
-- zeigen sie die anzahl autoren pro buch: buchnr,titel,count(tvautor.autornr)

SELECT
    tbuch.buchnr,
    tbuch.titel,
    COUNT(tvautor.autornr) AS anz_buecher
FROM
    tbuch
    INNER JOIN tvautor ON tbuch.buchnr = tvautor.buchnr
GROUP BY
    tbuch.buchnr,
    tbuch.titel;