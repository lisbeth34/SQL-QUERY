CREATE TABLE "BOOKS" (
	"B_ID"	INTEGER,
	"TITLE"	TEXT NOT NULL,
	"DESCRIPTION"	TEXT NOT NULL,
	"A_ID"	INTEGER NOT NULL,
	PRIMARY KEY("B_ID" AUTOINCREMENT),
	FOREIGN KEY("A_ID") REFERENCES "Authors"("a_ID")
);

CREATE TABLE "Authors" (
	"a_ID"	INTEGER,
	"F_NAME"	TEXT NOT NULL,
	"L_NAME"	TEXT NOT NULL,
	"NATIONALITY"	TEXT NOT NULL,
	PRIMARY KEY("a_ID" AUTOINCREMENT)
);

--count number of books

SELECT count(Title) as num_BOOKS
FROM Books;

--COUNT HOW MANY BOOKS AN AUTHOR HAS
SELECT a.F_Name, a.L_Name, COUNT(b.b_ID) AS BookCount
FROM Authors a
JOIN Books b ON a.a_ID = b.a_ID
GROUP BY a.a_ID, a.F_Name, a.L_Name
ORDER BY BookCount DESC
LIMIT 1;

--how many books there are according to nationality,
SELECT a.NATIONALITY, COUNT(b.b_ID) AS BookCount
FROM Authors a
JOIN Books b ON a.a_ID = b.a_ID
GROUP BY a.NATIONALITY