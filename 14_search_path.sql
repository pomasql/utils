/*
  Настройка пути поиска
  Далее все объекты будут создаваться и искать других в схеме :PKG
*/

\set QUIET on
SET SEARCH_PATH = :PKG, 'public';
\set QUIET off
