/* data type */
-- int
-- float(m, d) : m -> how long(in total) / d -> how long to the decimal point // appoximate -> rounds
-- decimal(m, d) : fixed precision -> dosen't round // 'm': precision(maximum number of total digits -> 1 ~ 65) / 'd': scale(the number of digits to the right of the decimal -> 0 ~ 30 *but cannot be greater than precision)
-- char(n) : fixed length, 'n' is the maximum number of charater between 0 ~ 255 // MySQL must reserve 4 byte for each character so 'n * 4'
-- varchar(n) : Variable length, 'n' 'n' is the maximum number of charater between 0 ~ 255 // for English and Latin, needs 1 byte more so 'n' + 1
-- enum('m', 'f') : for defined value
-- boolean
-- date : date(YYYY-MM-DD)
-- datetime : combination date and time from midnight Jan. 1. 1970 to Dec. 31. 9999. (YYYY-MM-DD HH:MM:SS)
-- time : time(HHH-MM-SS)
-- year : year(YYYY) // allowed vales -> 1901 ~ 2155
-- timestamp : automaticaaly updated time when a row is inserted or updated combination date and time from midnight Jan. 1. 1970 to the year 2037 (YYYY-MM-DD HH:MM:SS)

/* data usages under utf8mb4 character set */
-- 1 byte: Latin, digits, punctuations
-- 2 byte: European,  Middle East letters
-- 3 byte: Korean, Chinese, Japanese
-- 4 byte: Emojis, icons

/* tips */
-- there is a concept of return type(value, list) so use it accordingly

/* data conversion 
My SQL
** implicit conversion
string  in a numeric expression 
-> if the string starts with a letter of character: 0
-> if the string starts with a number: returns that number until encountered with no numeric values

** explicit conversion
-> syntaxes:
--> CAST(exp AS type): ANSI-standard
--> CONVERT(exp, type)
--> cast types
--- CHAR[(N)]: N-> maximum
--- DATE
--- DATETIME
--- TIME
--- SIGNED[INT]
--- UNSIGNED[INT]
--- DECIMAL[(M[,D])]: M-> precision / D -> scale
*/
SELECT invoice_id, invoice_date, invoice_total,
	   CAST(invoice_date AS CHAR(10)) AS char_date,
       CAST(invoice_total AS SIGNED) AS integer_total
FROM invoices;

SELECT invoice_id, invoice_date, invoice_total,
	   CONVERT(invoice_date, CHAR(10)) AS char_date,
       CONVERT(invoice_total, SIGNED) AS integer_total
FROM invoices;

/*================ cast sorting ================*/
/*
-- when a column that is defined with VCHAR type that has numbers as its values is sorted, 
the numbers are considered as char -> so the result is not in numeric order
*/
USE ex;
SELECT * FROM string_sample ORDER BY emp_id;

-- Sorted with explicit cast
SELECT * FROM string_sample ORDER BY CAST(emp_id AS SIGNED);

-- Sorted with implicit cast
SELECT * FROM string_sample ORDER BY emp_id + 0;

-- Sorted with padding
SELECT LPAD(emp_id, 2, '0') AS emp_id, emp_name FROM string_sample ORDER BY emp_id;
