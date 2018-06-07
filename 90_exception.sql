/*

  PGWS. Тесты исключений.

*/

/* ------------------------------------------------------------------------- */



/* ------------------------------------------------------------------------- */
-- тест с исключением
SELECT poma.test('test_exception'); -- BOT
SELECT :PKG.exception_test('select now();');--EOT

SELECT poma.test('test_without_exception'); -- BOT
SELECT :PKG.exception_test('select no();');--EOT

/* ------------------------------------------------------------------------- */
