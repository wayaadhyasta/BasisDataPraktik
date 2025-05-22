tolong dari soal itu jawab dengan 

CREATE DATABASE toko_kue;

USE toko_kue

CREATE TABLE jenis_kue (
  kode_jenis_kue CHAR(5) NOT NULL,
  nama_jenis_kue VARCHAR(25) NOT NULL,
  jangka_expired VARCHAR(10) NOT NULL,
  
  PRIMARY KEY (kode_jenis_kue)
);

CREATE TABLE kue (
  kode_kue CHAR(5) NOT NULL,
  nama_kue VARCHAR(50) NOT NULL,
  harga_satuan INT(11) NOT NULL,
  kode_jenis_kue CHAR(5) NOT NULL,
  
  PRIMARY KEY (kode_kue),
  FOREIGN KEY (kode_jenis_kue) REFERENCES jenis_kue(kode_jenis_kue)
);

CREATE TABLE outlet (
  kode_outlet CHAR(5) NOT NULL,
  nama_outlet VARCHAR(100) NOT NULL,
  alamat TEXT NOT NULL,
  telp VARCHAR(25) NOT NULL,
  
  PRIMARY KEY (kode_outlet)
);

CREATE TABLE penjualan (
  no_nota CHAR(5) NOT NULL,
  tgl_jual DATE NOT NULL,
  total_jual INT(11) NOT NULL,
  discount INT(11) NOT NULL,
  total_bayar INT(11) NOT NULL,
  kode_outlet CHAR(5) NOT NULL,
  
  PRIMARY KEY (no_nota),
  FOREIGN KEY (kode_outlet) REFERENCES outlet(kode_outlet)
);

CREATE TABLE detail_jual (
  no_nota CHAR(5) NOT NULL,
  kode_kue CHAR(5) NOT NULL,
  jumlah INT(11) NOT NULL,
  harga_detail INT(11) NOT NULL,
  subtotal INT(11) NOT NULL,
  
  FOREIGN KEY (no_nota) REFERENCES penjualan(no_nota)
);

#===========================
# INSERT DATA
#===========================
INSERT INTO jenis_kue (kode_jenis_kue, nama_jenis_kue, jangka_expired) VALUES
('KUBA', 'Kue Basah', '3 hari'),
('KUKE', 'Kue Kering', '3 bulan');

INSERT INTO kue (kode_kue, nama_kue, harga_satuan, kode_jenis_kue) VALUES
('BABZ', 'Brownies Banana Bizz', 30000, 'KUBA'),
('BAKR', 'Brownies Bakar', 28000, 'KUKE'),
('BDUO', 'Bangket Duo', 20000, 'KUKE'),
('BLCK', 'Pisang Bolen Cokelat', 28000, 'KUBA'),
('BLKJ', 'Pisan Bolen Keju', 28000, 'KUBA'),
('BLUE', 'Brownies Blueberry', 32000, 'KUBA'),
('CHCR', 'Brownies Cheese Cream', 52000, 'KUBA'),
('CHRL', 'Cheese Roll', 37000, 'KUKE'),
('CHST', 'Cheese Stick', 27000, 'KUKE'),
('COMA', 'Brownies Choco Marble', 30000, 'KUBA'),
('GREE', 'Brownies Green Marble', 32000, 'KUBA'),
('KTBK', 'Cake Ketan Bakar', 26000, 'KUBA'),
('ORIG', 'Brownies Original', 26000, 'KUBA'),
('PINK', 'Brownies Pink Marble', 30000, 'KUBA'),
('PNBT', 'Peanut Butter', 28000, 'KUBA'),
('SRKY', 'Brownies Srikaya Pandan', 28000, 'KUBA'),
('SWST', 'Sweet Stik', 24000, 'KUKE'),
('TRMS', 'Brownies Tiramisu Marble', 32000, 'KUBA');

INSERT INTO outlet (kode_outlet, nama_outlet, alamat, telp) VALUES
('ABC', 'AB Karno', 'Jl Sleman No 2', '0274123456'),
('ABD', 'AB Harto', 'Jl Bantul No 3', '0274222222'),
('ABP', 'AB Paskal', 'Jl Wonosari No 4', '0274111111'),
('ABR', 'AB Buono', 'Jl Kraton No 5', '0274888888'),
('ABT', 'AB Kusuma', 'Jl Kusuma No 5', '0274999999');

INSERT INTO penjualan (no_nota, tgl_jual, total_jual, discount, total_bayar, kode_outlet) VALUES
('J008', '2013-01-01', 676000, 10, 608400, 'ABR'),
('J009', '2013-01-01', 352000, 10, 316800, 'ABR'),
('J010', '2013-01-01', 131000, 0, 131000, 'ABR'),
('J011', '2013-01-02', 141000, 0, 141000, 'ABR'),
('R001', '2013-01-01', 270000, 0, 270000, 'ABC'),
('R002', '2013-01-01', 104000, 0, 104000, 'ABC'),
('R003', '2013-01-02', 63000, 0, 63000, 'ABC');

INSERT INTO detail_jual (no_nota, kode_kue, jumlah, harga_detail, subtotal) VALUES
('J008', 'BLUE', 3, 32000, 96000),
('J008', 'CHCR', 10, 52000, 520000),
('J008', 'COMA', 2, 30000, 60000),
('J009', 'BABZ', 4, 30000, 120000),
('J009', 'BLUE', 4, 32000, 128000),
('J009', 'ORIG', 4, 26000, 104000),
('J010', 'CHCR', 2, 52000, 104000),
('J010', 'CHRL', 1, 37000, 37000),
('J011', 'CHCR', 2, 62000, 124000),
('J011', 'CHST', 1, 27000, 27000),
('R001', 'BLKJ', 3, 28000, 84000),
('R001', 'GREE', 3, 32800, 96000),
('R001', 'PINK', 3, 30000, 90000),
('R002', 'BLKJ', 2, 28000, 56000),
('R002', 'SWST', 2, 24000, 48000),
('R003', 'CHRL', 1, 37000, 37000),
('R003', 'ORIG', 10, 26000, 26000);

# Instruksi: Tampilkan seluruh data yang ada dalam tabel outlet
SELECT * FROM outlet;

# Instruksi: Tampilkan data transaksi penjualan yang terjadi di kode outlet 'ABC'
SELECT * FROM penjualan WHERE kode_outlet = 'ABC';

# Instruksi: Tampilkan nama kue dan harganya khusus untuk kue dengan harga di atas 30.000
SELECT nama_kue, harga_satuan FROM kue WHERE harga_satuan > 30000;

# Instruksi: Tampilkan nama kue beserta harganya khusus untuk kue yang memiliki harga antara 30.000 sampai dengan 40.000
SELECT nama_kue, harga_satuan FROM kue WHERE harga_satuan BETWEEN 30000 AND 40000;

# Instruksi: Tampilkan kode_akun dan nama_akun dari tabel akun dengan header_akun = 2 atau 21
SELECT kode_akun, nama_akun FROM akun WHERE header_akun = 2 OR header_akun = 21

# Tampilkan nama kue, kode jenis kuenya, harga aslinya, dan harga setelah potongan 10%
# dari tabel kue hanya untuk kue dengan jenis KUBA 
SELECT nama_kue, kode_jenis_kue, harga_satuan, harga_satuan * 0.9 AS harga_diskon FROM kue WHERE kode_jenis_kue = 'KUBA';

# Tampilkan harga satuan kode yang paling mahal.
SELECT MAX(harga_satuan) FROM kue;

# Tampilkan nama kue dan harga satuannya untuk kue yg paling mahal
SELECT nama_kue, harga_satuan FROM kue ORDER BY harga_satuan DESC LIMIT 1;

#no9 tampilkan kode_kue yang pernah terjual dengan menghilangkan data yang sama(duplikat)
SELECT DISTINCT kode_kue FROM kue;

#no 10 urutkan data outlet berdasarkan nama outlet dari 'z-a' (menurun)
SELECT nama_outlet FROM outlet BY DESC

SELECT kode_jenis_kue, COUNT(kode_jenis_kue) FROM kue GROUP BY (kode_jenis_kue)
# Berfungsi untuk mengelompokkan data kue berdasarkan jenisnya (kode_jenis_kue) dan menghitung jumlah kue untuk setiap jenis tersebut.
# Dengan menggunakan GROUP BY, query ini akan menghasilkan satu baris untuk setiap kode_jenis_kue, 
# bersama dengan total jumlah kue (COUNT(kode_jenis_kue)) yang termasuk dalam jenis tersebut. 
# Hasilnya memberi gambaran berapa banyak kue yang tersedia untuk masing-masing kategori atau jenis kue di tabel kue.

# menampilkan kode_jenis_kue beserta dengan jumlah kue yg termasuk ke dalam masing" kode_jenis_kue tersebut dengan nama kolom 'jumlah barang'
SELECT kode_jenis_kue, COUNT(kode_jenis_kue) AS 'jumlah barang' FROM kue GROUP BY kode_jenis_kue;


SELECT kode_jenis_kue, COUNT(kode_jenis_kue) FROM kue GROUP BY (kode_jenis_kue) HAVING COUNT(kode_jenis_kue)>10
# digunakan untuk mengelompokkan data berdasarkan kode_jenis_kue dan menghitung berapa banyak kue yang termasuk dalam setiap jenis.
# berbeda dengan WHERE, klausa HAVING digunakan setelah proses pengelompokan, sehingga di sini query hanya akan menampilkan
# jenis kue yang memiliki jumlah lebih dari 10 kue. Artinya, hanya kategori atau jenis kue dengan lebih dari 10 entri di tabel kue yang akan ditampilkan dalam hasil.

SELECT DISTINCT(MONTHNAME(tgl_jual)) AS bulan FROM penjualanl;
# Digunakan untuk mengambil nama-nama bulan unik dari kolom tgl_jual dalam tabel penjualan.
# Fungsi MONTHNAME(tgl_jual) mengubah tanggal menjadi nama bulan (misalnya: "January", "February"), dan DISTINCT memastikan bahwa setiap
# nama bulan hanya ditampilkan satu kali, meskipun muncul di banyak baris. Hasilnya adalah daftar bulan-bulan di mana penjualan pernah terjadi, tanpa duplikat.
# Kolom hasil diberi alias bulan untuk memperjelas isi data yang ditampilkan


SELECT UPPER(nama_jenis_kue) FROM jenis_kue;
# Arti:
# digunakan untuk mengambil data nama jenis kue dari tabel jenis_kue, lalu mengubah seluruh hurufnya menjadi huruf kapital (uppercase) menggunakan fungsi UPPER().
# Hasil query ini akan menampilkan daftar nama_jenis_kue dalam huruf besar semua, yang berguna untuk keperluan standarisasi
# tampilan data atau pencarian yang tidak peka terhadap huruf besar/kecil

SELECT nama_kue, nama_jenis_kue FROM kue a JOIN jenis_kue b ON a. 'kode_jenis_kue' =b. 'kode_jenis_kue'
# Arti:
# digunakan untuk menampilkan nama kue dari tabel kue dan nama jenis kue dari tabel jenis_kue, dengan mencocokkan kode_jenis_kue di kedua tabel.
# Karena menggunakan JOIN (secara default adalah INNER JOIN), hanya data kue yang memiliki relasi yang cocok dengan jenis kue di tabel jenis_kue yang akan ditampilkan.
# Query ini membantu untuk melihat tiap kue beserta kategorinya secara lengkap.

SELECT no_nota, nama_kue FROM kue a LEFT JOIN detail_jual b ON a.kode_kue=b.kode_kue WHERE no_nota IS NULL;
# Arti:
# Digunakan untuk menampilkan semua data kue dari tabel kue, beserta nomor nota (no_nota) dari tabel detail_jual jika kue tersebut pernah terjual. 
# Dengan menggunakan LEFT JOIN, query ini memastikan bahwa seluruh kue akan ditampilkan, termasuk kue yang belum pernah terjual — dalam kasus seperti itu,
# kolom no_nota akan bernilai NULL. Hasilnya adalah daftar nama kue beserta informasi transaksi (jika ada)

# menampilkan nama kue yg expired dalam waktu 3 bulan
SELECT 'kue'.'nama_kue' FROM 'kue' JOIN 'jenis_kue' ON 'kue'.'kode_jenis_kue' = jenis_kue.'kode_jenis_kue' WHERE 'jenis_kue'.'jangka_expired' = '3 bulan';

# Tampilan nama kue yg termasuk jenis 'kue basah'
SELECT 'kue'.'nama_kue' FROM 'kue' JOIN 'jenis_kue' ON 'kue'.'kode_jenis_kue' = jenis_kue.'kode_jenis_kue' WHERE 'jenis_kue'.'kode_jenis_kue' = 'KUBA';

SELECT nama_kue FROM kue a, jenis_kue b, WHERE a.'kode_jenis_kue' =b.'kode_jenis_kue' AND b.'kode_jenis_kue'

# tampilkan data penjuaaln rinci pada outlet 'AB Rancangbolang'('AB Rancangbolang' memang tidak ada)
SELECT 'penjualan'. * FROM 'penjualan' JOIN 'outlet' ON 'penjualan'. 'kode_outlet' = 'outlet'.'kode_outlet' WHERE 'outlet'.'nama_outlet' = 'AB Rancangbolang'

SELECT * FROM penjualan a, outlet b WHERE a.kode_outlet = b.'kode_outlet' AND b.'nama_outlet' = 'AB Rancangbolang'

# tampilkan nama kue dan harga satuan yg termasuk jenis 'kue kering'
SELECT 'kue'.'nama_kue', 'kue'.'harga_satuan' FROM 'kue' JOIN 'jenis_kue' ON 'kue'.'kode_jenis_kue' = jenis_kue.'kode_jenis_kue' WHERE 'jenis_kue'.

SELECT nama_kue, harga_satuan FROM kue a, jenis_kue b WHERE a.kode_jenis_kue = b.kode_jenis_kue AND b.kode_jenis_kue = 'KUKE'

# tampilkan nama kue dan harga satuan yang paling mahal 'penjualan' 'penjualan'
SELECT 'nama_kue', 'harga_satuan' FROM 'kue' ORDER BY harga_satuan DESC LIMIT 1;

# tampilkan jumlah nilai total_jual kue pada outlet 'AB Rancangbolang' ('AB Rancangbolang' memang tidak ada)
SELECT SUM(total_jual) AS jumlah_total_jual FROM penjualan JOIN outlet ON penjualan. 'kode_outlet' = outlet.'kode_outlet' WHERE outlet. 'nama_outlet' = 'AB Rancangbolang'

#Tampilkan jumlah nilai total_jual kue pada outlet "AB Rancangbolang" ("AB Rancangbolang" memang tidak ada)
SELECT SUM(total_jual) AS jumlah_total_jual FROM penjualan JOIN outlet ON penjualan.`kode_outlet` = outlet.`kode_outlet` WHERE outlet.`nama_outlet` = 'AB Rancangbolang'

#Tampilkan jumlah nilai total_jual berdasarkan masing masing outlet
SELECT `outlet`.`nama_outlet`, SUM(`penjualan`.`total_jual`) AS jumlah_total_jual FROM `outlet` LEFT JOIN `penjualan` ON `outlet`.`kode_outlet` = `penjualan`.`kode_outlet` GROUP BY outlet.`kode_outlet`;

#Tampilkan nama outlet yang mempunyai nilai total_bayar paling banyak
SELECT `outlet`.`nama_outlet`, SUM(`penjualan`.`total_bayar`) AS jumlah_total_bayar FROM `outlet` LEFT JOIN `penjualan` ON `outlet`.`kode_outlet` = `penjualan`.`kode_outlet` GROUP BY outlet.`kode_outlet` ORDER BY jumlah_total_bayar DESC LIMIT 1: