-- create database bank
CREATE database bank;

-- create table nasabah
CREATE TABLE nasabah(
    id BIGSERIAL PRIMARY KEY,
    nama_depan VARCHAR(255) NOT NULL,
    nama_belakang VARCHAR(255) NOT NULL,
    alamat TEXT,
    pekerjaan VARCHAR(255) NOT NULL,
    penghasilan DECIMAL(15, 2) NOT NULL,
    nomor_telepon VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- create table akun
CREATE TABLE akun(
    id BIGSERIAL PRIMARY KEY,
    nasabah_id INT NOT NULL,
    jenis_akun VARCHAR(255) NOT NULL,
    nomor_akun VARCHAR(12) NOT NULL,
    pin INT NOT NULL,
    saldo DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (nasabah_id) REFERENCES nasabah(id)
);

-- create table transaksi
CREATE TABLE transaksi(
    id BIGSERIAL PRIMARY KEY,
    akun_id INT NOT NULL,
    jumlah_transaksi DECIMAL(15, 2) NOT NULL,
    tanggal_dan_jam_transaksi TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    jenis_transaksi VARCHAR (100) NOT NULL,
    FOREIGN KEY (akun_id) REFERENCES akun(id)
);

-- create data kedalam table nasabah
INSERT INTO nasabah (nama_depan, nama_belakang, 
    alamat, pekerjaan, penghasilan, 
    nomor_telepon, email) 
    VALUES
    ('Agus', 'Setiawan', 'Jl. Mekarwangi no.292, Bandung', 
    'Karyawan Swasta', '3500000', '081978546342', 
    'agussetiawan@gmail.com'),
    ('Ahmad', 'Syauqi', 'RT 01 RW02, Desa Ateuk Pahlawan, Aceh', 
    'Doktor Umum', '15000000', '083527825634', 
    'ahmadsyauqi@gmail.com'),
    ('Budi', 'Prakerti', 'Jl. Mangga Dua Raya No. 10, Medan', 
    'Sales Executive', '6500000', '083192835721', 
    'budi_sales@gmail.com'),
    ('Dadang', 'Nurjaman', 'Jl. Kenari No.100, Makassar', 
    'Marketing Manager', '7100000', '081345763647', 
    'dadangnur@gmail.com'),
    ('Edi', 'Kuswanto', 'Jl. Baros No. 17, Palembang', 
    'Sales Executive', '6500000', '089163375253', 
    'edikuswanto@gmail.com'),
    ('Entin', 'Kusiasti', 'Perumahan Indah Melati Blok 7A No. 26, Yogyakarta', 
    'Penulis Freelance', '5500000', '085123432854', 
    'entinkusiasti@gmail.com'),
    ('Ivan', 'Hamzah', 'Komplek Pasri Mulya B2 No. 10, Solo', 
    'Freelance', '7000000', '082746253817', 
    'ivanhamzah@gmail.com'),
    ('Regis Syawaludin', 'Rifaldi', 'Jl. Banjaran no.29, Bandung', 
    'Back End Engineering', '4000000', '0895703057031', 
    'regisrifaldi44@gmail.com'),
    ('Titi', 'Nurhamah', 'Jl. Anggrek No. 12, Jakarta Barat', 
    'Guru Bahasa Inggris', '6500000', '089342718293', 
    'titinur@gmail.com'),
    ('Zauqi', 'Ivandi', 'Jl. Kampung Rambutan No. 21, Jakarta', 
    'Programmer', '8200000', '085234584746', 
    'zauqivandi@gmail.com');
    

-- create data kedalam tabel akun
INSERT INTO akun(nasabah_id, jenis_akun,
    nomor_akun, pin, saldo)
    VALUES
    (1, 'Binar Tabungan Haji', '3029384756', '102938', 12000000),
    (10, 'Binar x','7281937493', '132718', 1000000),
    (1, 'Binar Prioritas ', '4758392748', '192837', 1000000000),
    (2, 'Binar x', '7324637483', '374632', 2140000),
    (6, 'Binar x','7936274832', '163845', 3430000),
    (4, 'Binar Bisnis','6824638293', '382734', 9200000),
    (3, 'Binar Prioritas','4482719383', '637283', 92000000),
    (3, 'Binar Tabungan Haji','3263729349', '582013', 1800000),
    (5, 'Binar Tabungan Haji','3846271283', '542134', 1700000),
    (6, 'Binar Gold','1736283743', '302031', 1840000),
    (8, 'Binar Gold','1237437485', '432124', 1200000),
    (9, 'Binar Platinum','5382736452', '423532', 84000000),
    (7, 'Binar x','7837483748', '435321', 74000000),
    (7, 'Binar Tabungan Haji','3637284935', '324134', 14000000),
    (10, 'Binar x','7123243945', '943823', 4500000);

-- create/membuat isi table transaksi
INSERT INTO transaksi(akun_id, jumlah_transaksi, 
    tanggal_dan_jam_transaksi, jenis_transaksi)
    VALUES
    (1, 500000, '2024-03-19 10:30:12', 'Pengeluaran'),
    (10, 1000000, '2023-10-11 11:12:00','Pemasukan'),
    (4, 200000, '2024-01-04 14:02:05', 'Pemasukan'),
    (2, 100000, '2024-03-21 10:14:02', 'Pengeluaran'),
    (3, 500000, '2023-10-24 12:12:02', 'Pemasukan'),
    (3, 200000, '2023-12-23 15:01:29', 'Pengeluaran'),
    (5, 200000, '2023-11-25 10:10:17', 'Pengeluaran'),
    (6, 800000, '2024-11-20 14:22:12', 'Pengeluaran'),
    (8, 700000, '2024-01-20 11:28:00', 'Pengeluaran'),
    (9, 300000, '2024-03-13 20:30:02', 'Pemasukan'),
    (7, 200000, '2024-01-15 12:27:01', 'Pengeluaran'),
    (7, 400000, '2024-01-24 17:19:00', 'Pemasukan'),
    (9, 900000, '2024-03-21 09:20:07', 'Pengeluaran'),
    (10, 100000, '2024-02-01 08:01:10', 'Pemasukan'),
    (1, 1000000, '2023-08-29 15:05:25', 'Pemasukan');

-- read data dari tabel nasabah
SELECT * FROM nasabah;

-- read data dari tabel akun
SELECT * FROM akun;

-- read data dari tabel transaksi
SELECT * FROM transaksi; 

-- update data pin dengan id = 3 pada table akun
UPDATE akun
SET pin = '777777'
WHERE id = 3;

-- delete data transaksi dengan id = 12 pada table transaksi 
DELETE FROM transaksi
WHERE id = 2;










