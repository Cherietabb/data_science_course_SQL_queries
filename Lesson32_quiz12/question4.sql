/*
Write a query to change the date into the correct SQL date format.  You will need to use at least SUBSTR and CONCAT to perform this operation.
*/

SELECT
  date                                                                      orig_date,
  (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) new_date
FROM sf_crime_data;

SELECT
  date                                                                              orig_date,
  (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) :: DATE new_date
FROM sf_crime_data;