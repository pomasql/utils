/*
  Вспомогательные функции общего назначения

*/

/* ------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION array_remove(
  a ANYARRAY
, b ANYELEMENT
) RETURNS ANYARRAY IMMUTABLE LANGUAGE 'sql' AS
$_$
  -- a: массив
  -- b: элемент
SELECT array_agg(x) FROM unnest($1) x WHERE x <> $2;
$_$;
SELECT poma.pg_c('f', 'array_remove', 'удаляет элемент из массива', 'Используется в pkg_op_after');



/* ------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION pg_exec_func(a_name TEXT) RETURNS TEXT STABLE LANGUAGE 'plpgsql' AS
$_$
  -- a_name:  имя функции
  DECLARE
    v TEXT;
  BEGIN
    EXECUTE 'SELECT * FROM ' || a_name || '()' INTO v;
    RETURN v;
  END;
$_$;
SELECT poma.pg_c('f', 'pg_exec_func', 'Вернуть текстовый результат функции, вызвав ее по имени', 'Используется VIEW pg_const');

/* ------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION pg_exec_func(
  a_schema TEXT
, a_name   TEXT
) RETURNS TEXT STABLE LANGUAGE 'sql' AS
$_$
  -- a_schema: название пакета
  -- a_name:   имя функции
  SELECT utils.pg_exec_func($1 || '.' || $2)
$_$;
SELECT poma.pg_c('f', 'pg_exec_func', 'Вернуть текстовый результат функции, вызвав ее по имени', 'Используется VIEW pg_const');



/* ------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION pg_schema_by_oid(a_oid oid) RETURNS TEXT STABLE LANGUAGE 'sql' AS
$_$
  -- a_oid:  OID
  SELECT nspname::TEXT FROM pg_namespace WHERE oid = $1
$_$;
SELECT poma.pg_c('f', 'pg_schema_by_oid',         'получить название пакета по OID-у', 'Используется VIEW pg_const');

/* ------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION now0() RETURNS TIMESTAMPTZ(0) STABLE LANGUAGE 'sql' AS
$_$
SELECT now()::TIMESTAMPTZ(0);
$_$;
SELECT poma.pg_c('f', 'now0', 'текущее время, округленное до секунды', 'См РМ #31126');
