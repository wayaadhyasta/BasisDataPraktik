CREATE DATABASE SDM
USE SDM

# TYPO SPASI 
CREATE TABLE karyawan(
kode_cabang VARCHAR(10) DEFAULT NULL,
kode_karyawan VARCHAR(10) NOT NULL,
nama_depan VARCHAR(8) DEFAULT NULL,
nama_belakang VARCHAR(9) DEFAULT NULL, 
jenis_kelamin VARCHAR(1) DEFAULT NULL,
PRIMARY KEY(kode_karyawan)
)

SELECT*FROM karyawan

INSERT INTO karyawan(
kode_cabang,
kode_karyawan,
nama_depan,
nama_belakang,
jenis_kelamin)
VALUES ('cab-001','kar-001','Feris','Thia','Laki-laki');

INSERT INTO karyawan VALUES ('cab-002','kar-002','Ferisha','Thia','P')

# COBA DENGAN MEMBUAT TABLE TIDAK NORMAL
INSERT INTO karyawan(
kode_cabang,
kode_karyawan,
nama_depan)
VALUES ('cab-004','kar-004','Gilang');

#UPDATE DATA KARYAWAN KARNA DATA YG DI ATAS TIDAK NORMAL
# cantumkan WHERE untuk table yang mau di update
UPDATE karyawan SET nama_belakang='Faldi', jenis_kelamin='L' WHERE kode_cabang='cab-004'