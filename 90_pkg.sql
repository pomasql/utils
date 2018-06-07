/*

    Copyright (c) 2010, 2016 Tender.Pro http://tender.pro.
    [SQL_LICENSE]

    Тестирование пакета ws
*/

/* ------------------------------------------------------------------------- */
SELECT poma.test('pg_store_proc'); -- BOT
/*
  Описание ф-и pg_store_proc_descr
*/
SELECT * FROM utils.pg_store_proc_descr('utils') WHERE name = 'pg_store_proc_descr' ORDER BY name ASC; -- EOT
/* ------------------------------------------------------------------------- */
