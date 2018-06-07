/*
  Макро для тестов
  Вызывается из 9?_name.sql
*/
\r

SELECT * FROM :PKG.epoch2timestamp(:STAMP); -- EOT
