CREATE DATABASE toko_penjualan

USE toko_penjualan

CREATE TABLE Jenis_kue(
kode_jenis_kue VARCHAR(3) NOT NULL,
nama_jenis_kue VARCHAR(10) DEFAULT NULL,
jangka_expired VARCHAR(10) NOT NULL,
PRIMARY KEY(kode_jenis_kue)
)

CREATE TABLE Kue(
kode_kue VARCHAR(4) NOT NULL,
nama_kue VARCHAR(100) DEFAULT NULL,
harga_kue INT(10) NOT NULL,
kode_jenis_kue VARCHAR (3) NOT NULL,
PRIMARY KEY (kode_kue),
FOREIGN KEY (kode_jenis_kue) REFERENCES Jenis_kue(kode_jenis_kue)
)