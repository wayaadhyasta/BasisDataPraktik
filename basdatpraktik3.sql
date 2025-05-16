CREATE DATABASE HRD

USE HRD

CREATE TABLE Karyawan(
karyawan_id VARCHAR(3) NOT NULL,
karyawan_nama VARCHAR(10) DEFAULT NULL,
PRIMARY KEY(karyawan_id)
)

CREATE TABLE Gaji(
gaji_id VARCHAR(5) NOT NULL,
karyawan_id VARCHAR(3) NOT NULL,
gaji_pokok INT(7) DEFAULT NULL,
PRIMARY KEY (gaji_id),
FOREIGN KEY (karyawan_id) REFERENCES Karyawan(karyawan_id)
)

INSERT INTO Karyawan VALUES ('001', 'Santi');
INSERT INTO Karyawan VALUES ('002', 'Dewi');
INSERT INTO Karyawan VALUES ('003', 'Santo');
INSERT INTO Karyawan VALUES ('004', 'Sinti');
INSERT INTO Karyawan VALUES ('005', 'Wawa');
INSERT INTO Karyawan VALUES ('006', 'Intan');

INSERT INTO Gaji VALUES ('GF01', '001',2000000);
INSERT INTO Gaji VALUES ('GF02', '002',3000000);
INSERT INTO Gaji VALUES ('GF03', '003',4000000);
INSERT INTO Gaji VALUES ('GF04', '004',5000000);
INSERT INTO Gaji VALUES ('GF05', '005',6000000);

# INNER JOIN
SELECT * FROM Karyawan INNER JOIN Gaji ON Karyawan.Karyawan_id=gaji.karyawan_id;
# SELECT * FROM Karyawan, Gaji WHERE Karyawan.karyawan_id-gaji.karyawan_id;

# LEFT JOIN
SELECT * FROM Karyawan LEFT JOIN Gaji ON Karyawan.Karyawan_id=gaji.karyawan_id;
SELECT * FROM Karyawan LEFT JOIN Gaji ON Karyawan.karyawab_id=gaji.karyawan_id WHERE gaji.karyawan_id IS NULL;

# RIGHT JOIN
SELECT * FROM Gaji RIGHT JOIN Karyawan ON gaji.karyawan_id=Karyawan.karyawan_id;SE

SELECT gaji_id, karyawan_id, gaji_pokok
FROM Gaji
WHERE gaji_pokok>=2000000
GROUP BY gaji_pokok;

SELECT SUM(gaji_pokok)
FROM Gaji;

SELECT MIN(gaji_pokok)
FROM Gaji;

SELECT AVG(gaji_pokok)
FROM Gaji;