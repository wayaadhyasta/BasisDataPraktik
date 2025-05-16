#BUAT BASIS DATA DENGAN NAMA kocipolite_3digitnimterakhir
CREATE DATABASE kocipolite_3digitnimterakhir
USE kocipolite_3digitnimterakhir

#BUAT TABEL DENGAN NAMA jenis_simpanan (jangan lupa tambahkan pk)
CREATE TABLE jenis_simpanan(
kd_jns_simpan VARCHAR(10) NOT NULL,
nm_simpanan VARCHAR(10) DEFAULT NULL,
PRIMARY KEY(kd_jns_simpan)
)

SELECT*FROM jenis_simpanan

INSERT INTO jenis_simpanan VALUES ('PKK','Simpanan Pokok');
INSERT INTO jenis_simpanan VALUES ('WJB','Simpanan Wajib');
INSERT INTO jenis_simpanan VALUES ('SKR','Simpanan Sukarela');

#BUAT TABEL DENGAN NAMA simpanan (jangan lupa tambahkan pk)

CREATE TABLE simpanan(
kd_jns_simpan VARCHAR(10) NOT NULL,
nm_simpanan VARCHAR(10) DEFAULT NULL,
PRIMARY KEY(kd_jns_simpan)
)

INSERT INTO simpanan VALUES ('TR01','2013-01-01','ID01',270000);
INSERT INTO simpanan VALUES ('TR21','2012-03-01','ID01',20000);

#BUAT TABEL DENGAN NAMA detail_simpanan (TAMBAHKAN FK)
CREATE TABLE detail_simpanan (
no_simpan CHAR(5) NOT NULL,
kd_jns_simpan CHAR(3) NOT NULL,
subtotal INT(5) DEFAULT NULL,
FOREIGN KEY (no_simpan) REFERENCES simpanan(no_simpan),
FOREIGN KEY (kd_jns_simpan) REFERENCES jenis_simpanan(kd_jns_simpan)
)

