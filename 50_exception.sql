/*
  Служебные функции
  Операции с исключениями
*/

-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION exception_test(a_sql TEXT DEFAULT NULL) 
RETURNS TEXT LANGUAGE 'plpgsql' AS
$_$
BEGIN
  EXECUTE a_sql; RETURN ''; -- Если исключения нет,- то возвращает пустую строку

  EXCEPTION WHEN OTHERS THEN RETURN 'SQLSTATE: ' || SQLSTATE || ' EXCEPTION: ' || SQLERRM;
END;
$_$;
SELECT poma.comment('f', 'exception_test', 'Протестировать sql код на исключения');
-- ----------------------------------------------------------------------------
