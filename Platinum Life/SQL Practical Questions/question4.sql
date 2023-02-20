CREATE TABLE Table1(
  Make CHAR(255) PRIMARY KEY,
  Model CHAR(255) NOT NULL,
  Manufacture_Date DATE,
  cost DECIMAL NOT NULL,
  model_id INT NOT NULL
);
CREATE TABLE Table2(
	Manufacturer CHAR(255) NOT NULL,
	City CHAR(255) NOT NULL,
	Parts INT NOT NULL,
	Warranty_Expiry_Date DATE,
	model_id INT NOT NULL,
	FOREIGN KEY (model_id) REFERENCES Table1 (model_id)
);
CREATE TRIGGER trigTable1 ON Table1
AFTER INSERT
AS
declare @numOfRows int;
SELECT @numOfRows = COUNT(*) FROM Table1;
begin
	if @numOfRows>5
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
END;
CREATE TRIGGER trigTable1 ON Table2
AFTER INSERT
AS
declare @numOfRows int;
SELECT @numOfRows = COUNT(*) FROM Table2;
begin
	if @numOfRows>5
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
END;

INSERT INTO Table1  
VALUES ('ford','big','2001-01-01',12,1),
('ford','medium','2001-01-02',11,2),
('ford','small','2001-01-03',10,3),
('tesla','medium','2001-02-02',17,4),
('tesla','small','2001-02-03',16,5);

INSERT INTO Table2  
VALUES ('ford_man','nelspruit',13,'2001-02-01',1),
('ford_man','nelspruit',14,'2001-05-01',3),
('tesla_man','tembisa',12,'2010-01-01',2),
('tesla_man','tembisa',1,'2003-01-01',4),
('tesla_man','edenvale',5,'2002-01-01',1);

/* The following should fail */
INSERT INTO Table1  VALUES ('ford','pikinini','2006-05-01',45,6);
INSERT INTO Table2  VALUES ('tesla_man','nowhere',13,'2004-02-02',5);