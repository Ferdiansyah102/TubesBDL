--
-- Database: db_kecantikan
--

-- --------------------------------------------------------

--
-- Struktur dari tabel pemilik
--

CREATE TABLE pemilik (
  id_pemilik varchar(10) PRIMARY KEY NOT NULL,
  email_pemilik varchar(255) NOT NULL,
  password_pemilik varchar(255) NOT NULL,
  nama_pemilik varchar(255) NOT NULL,
  jenisKelamin_pemilik char(2) NOT NULL,
  noTelp_pemilik varchar(255) NOT NULL,
  alamat_pemilik varchar(255) NOT NULL,
  tanggalLahir_pemilik date NOT NULL
);

--
-- Struktur dari tabel pelanggan
--

CREATE TABLE pelanggan (
  id_pelanggan varchar(10) PRIMARY KEY NOT NULL,
  email_pelanggan varchar(255) NOT NULL,
  password_pelanggan varchar(255) NOT NULL,
  nama_pelanggan varchar(255) NOT NULL,
  jenisKelamin_pelanggan char(2) NOT NULL,
  noTelp_pelanggan varchar(255) NOT NULL,
  alamat_pelanggan varchar(2555) NOT NULL,
  tanggalLahir_pelanggan date NOT NULL,
  status varchar(255) NOT NULL
);

--
-- Struktur dari tabel pegawai
--

CREATE TABLE pegawai (
  id_pegawai varchar(10) PRIMARY KEY NOT NULL,
  email_pegawai varchar(255) NOT NULL,
  password_pegawai varchar(255) NOT NULL,
  nama_pegawai varchar(255) NOT NULL,
  jenisKelamin_pegawai char(2) NOT NULL,
  noTelp_pegawai varchar(255) NOT NULL,
  alamat_pegawai varchar(255) NOT NULL,
  tanggalLahir_pegawai date NOT NULL
);

--
-- Struktur dari tabel dokter
--

CREATE TABLE dokter (
  id_dokter varchar(10) PRIMARY KEY NOT NULL,
  email_dokter varchar(255) NOT NULL,
  password_dokter varchar(255) NOT NULL,
  nama_dokter varchar(255) NOT NULL,
  jenisKelamin_dokter char(2) NOT NULL,
  noTelp_dokter varchar(255) NOT NULL,
  alamat_dokter varchar(255) NOT NULL,
  tanggalLahir_dokter date NOT NULL,
  spesialis varchar(255) NOT NULL
);

--
-- Struktur dari tabel paket
--

CREATE TABLE paket (
  id_paket varchar(10) PRIMARY KEY NOT NULL,
  nama_paket varchar(255) NOT NULL,
  deskripsi varchar(255) NOT NULL,
  harga_paket float NOT NULL
);

--
-- Struktur dari tabel detailpaket
--

CREATE TABLE detailpaket (
  id_detail varchar(10) PRIMARY KEY NOT NULL,
  id_paket varchar(10) NOT NULL,
  fitur varchar(255) NOT NULL,
  FOREIGN KEY(id_paket) REFERENCES paket(id_paket)
);

--
-- Struktur dari tabel pembayaran
--

CREATE TABLE pembayaran (
  id_pembayaran varchar(10) NOT NULL,
  id_transaksi varchar(10) NOT NULL,
  total_pembayaran float NOT NULL,
  bayar float NOT NULL,
  status_pembayaran varchar(255) NOT NULL,
  FOREIGN KEY(id_transaksi) REFERENCES transaksi(id_transaksi)
);

--
-- Struktur dari tabel perawatan
--

CREATE TABLE perawatan (
  id_perawatan varchar(10) PRIMARY KEY NOT NULL,
  id_dokter varchar(10) NOT NULL,
  id_transaksi varchar(10) NOT NULL,
  hasil varchar(255) NOT NULL,
  solusi varchar(255) NOT NULL,
  tanggal_perawatan date NOT NULL,
  FOREIGN KEY(id_dokter) REFERENCES dokter(id_dokter),
  FOREIGN KEY(id_transaksi) REFERENCES transaksi(id_transaksi)
);

--
-- Struktur dari tabel transaksi
--

CREATE TABLE transaksi (
  id_transaksi varchar(10) PRIMARY KEY NOT NULL,
  id_pelanggan varchar(10) NOT NULL,
  id_pegawai varchar(10) NOT NULL,
  id_paket varchar(10) NOT NULL,
  tanggal date NOT NULL,
  totalBayar float NOT NULL,
  FOREIGN KEY(id_pelanggan) REFERENCES pelanggan(id_pelanggan),
  FOREIGN KEY(id_pegawai) REFERENCES pegawai(id_pegawai),
  FOREIGN KEY(id_paket) REFERENCES paket(id_paket)
);

--
-- Dumping data untuk tabel `pemilik`
--

INSERT INTO `pemilik` (`id_pemilik`, `email_pemilik`, `password_pemilik`, `nama_pemilik`, `jenisKelamin_pemilik`, `noTelp_pemilik`, `alamat_pemilik`, `tanggalLahir_pemilik`) VALUES
('D001', 'kuncarabakti@gmail.com', 'baktikun', 'Kuncara', 'L', '08464733', 'Malang', '1999-09-11'),
('D002', 'auliagusti01@gmail.com', 'auliagst12', 'Gusti', 'L', '08674663', 'Malang', '1998-04-02'),
('D003', 'diltafebi@gmail.com', 'dilta0210', 'Dilta', 'P', '08657388', 'Lumajang', '2001-02-18'),
('D004', 'gustaniameisi99@gmail.com', 'gustaniameisi99', 'Gusta', 'P', '08756737', 'Probolinggo', '1999-12-01'),
('D005', 'dewilailatu@gmail.com', 'dewilai12345', 'Dewi', 'P', '08948847', 'Lumajang', '1999-04-18'),
('D006', 'dekifirmansyah13@gmail.com', 'dekifrmnsyh13', 'Deki', 'L', '08988472', 'Malang', '1998-06-10'),
('D007', 'safira123@gmail.com', 'safiradjn123', 'Safira', 'P', '08174774', 'Malang', '2000-09-07'),
('D008', 'satrya29rfq@gmail.com', 'satryarfq29', 'Satrya', 'L', '08874663', 'Malang', '2002-11-11'),
('D009', 'melicapek@gmail.com', 'meliusa4321', 'Meliusa', 'P', '08998373', 'Malang', '2000-02-10'),
('D010', 'iftitahhidaya32@gmail.com', 'iftitahhidaya354', 'Iftitah', 'P', '08876773', 'Malang', '1999-05-25');

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `jenisKelamin_pelanggan`, `noTelp_pelanggan`, `alamat_pelanggan`, `tanggalLahir_pelanggan`, `status`) VALUES
('C001', 'yasminealiya@gmail.com', 'aliyasmine', 'Yasmine', 'P', '08763746372', 'Bandung', '1999-09-03', 'pelanggan'),
('C002', 'dealina10@gmail.com', 'dealina1001', 'Dea', 'P', '08763746746', 'Malang', '1999-12-04', 'guest'),
('C003', 'ainiqudusi@gmail.com', 'ainiqids45', 'Aini', 'P', '08763746652', 'Jakarta', '2003-03-29', 'guest'),
('C004', 'catherine14@gmail.com', 'catherine345', 'Catherin', 'P', '08762146372', 'Madura', '2000-02-03', 'pelanggan'),
('C005', 'abithaputri@gmail.com', 'abithasaputri', 'Abitha', 'P', '08237483889', 'Malang', '1999-09-06', 'pelanggan'),
('C006', 'wuripribadi11@gmail.com', 'wurianggraini', 'Wuri', 'P', '08126356478', 'Malang', '2001-08-02', 'pelanggan'),
('C007', 'rarandani@gmail.com', 'rarandani', 'Rara', 'P', '08029300499', 'Malang', '1999-09-08', 'pelanggan'),
('C008', 'nabiel09@gmail.com', '123nabiel', 'Nabiel', 'P', '08657388273', 'Surabaya', '1999-09-09', 'guest'),
('C009', 'desinovita04@gmail.com', 'novitasarides42', 'Desi', 'P', '08562377283', 'Jember', '1997-05-17', 'guest'),
('C010', 'sherlytadinda89@gmail.com', 'umikzher13', 'Sherlyta', 'P', '08645533625', 'Surabaya', '1999-07-02', 'pelanggan');

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `email_pegawai`, `password_pegawai`, `nama_pegawai`, `jenisKelamin_pegawai`, `noTelp_pegawai`, `alamat_pegawai`, `tanggalLahir_pegawai`) VALUES
('id_pegawai', 'email_pegawai', 'password_pegawai', 'nama_pegawai', 'je', 'noTelp_pegawai', 'alamat_pegawai', '0000-00-00'),
('P001', 'ferdiansyah@gmail.com', 'ferdiansyah12', 'Ferdiansyah Wardana Putra', 'L', '8521234', 'Probolinggo', '1999-07-01'),
('P002', 'aulia@gmail.com', 'aulia12', 'Aulia Gusti Ramadahan', 'L', '8523521', 'Bondowoso', '1998-12-16'),
('P003', 'faiza10@gmail.com', 'faiza12', 'Faiza Kurnia', 'P', '8527890', 'Probolinggo', '2000-09-01'),
('P004', 'aida14@gmail.com', 'aidaMillati', 'Aida Millati', 'P', '8125725', 'Malang', '2001-02-10'),
('P005', 'cintya44@gmail.com', 'cicin44', 'Cintya Aprila', 'P', '8541245', 'Situbondo', '1999-04-25'),
('P006', 'angger123@gmail.com', 'angger12', 'Angger Dwi', 'L', '8169310', 'Bondowoso', '0000-00-00'),
('P007', 'yoga11@gmail.com', 'yoga 12', 'Yoga Rahmahadi', 'L', '8234679', 'Mojokerto', '0000-00-00'),
('P008', 'dio@gmail.com', 'dio1233', 'Dio Fanny', 'L', '8871028', 'Bondowoso', '1999-09-05'),
('P009', 'wkna10@gmail.com', 'wkna11', 'Wahyu Kurnia', 'P', '8766182', 'Probolinggo', '1999-01-01'),
('P010', 'tirtaa@gmail.com', 'tirta22', 'Tirta Aditiya', 'L', '8876412', 'Bandung', '1999-06-07');

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `email_dokter`, `password_dokter`, `nama_dokter`, `jenisKelamin_dokter`, `noTelp_dokter`, `alamat_dokter`, `tanggalLahir_dokter`, `spesialis`) VALUES
('DC001', 'danielputra10@gmail.com', 'danielputra111', 'Daniel', 'L', '08763746752', 'Bondowoso', '1990-09-20', 'kecantikan'),
('DC002', 'danianjar@gmail.com', '99danianjar', 'Dani', 'L', '08763747464', 'Jember', '1980-09-21', 'kecantikan'),
('DC003', 'ginanjar12@gmail.com', 'giginanjar12', 'Gigin', 'L', '08763746947', 'Probolinggo', '1970-11-22', 'kecantikan'),
('DC004', 'auliyayak@gmail.com', 'sulthonauliyayak', 'Yayak', 'L', '08762146736', 'Malang', '1983-12-23', 'kecantikan'),
('DC005', 'rizaldarmawan@gmail.com', 'rzldmwn13', 'Rizal', 'L', '08647388283', 'Situbondo', '1994-08-24', 'kecantikan'),
('DC006', 'fajarkurniawan@gmail.com', 'fajarhadi67', 'Fajar', 'L', '08126357487', 'Bandung', '1993-11-25', 'kecantikan'),
('DC007', 'usamabintang1@gmail.com', 'uusbintang1', 'Usama', 'L', '08029388730', 'Sidoarjo', '1998-12-26', 'kecantikan'),
('DC008', 'rohmanardianto@gmail.com', 'rohmanardianto', 'Rohman', 'L', '08657387784', 'Lumajang', '1992-01-27', 'kecantikan'),
('DC009', 'zakariayhy@gmail.com', 'zakariyahya', 'Zakari', 'L', '08562376346', 'Solo', '1984-09-28', 'kecantikan'),
('DC010', 'ezrasaputa01@gmail.com', 'ezrasaputra1', 'Ezra', 'L', '08645537488', 'Surabaya', '1987-04-29', 'kecantikan');

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id_paket`, `nama_paket`, `deskripsi`, `harga_paket`) VALUES
('PC001', 'facial', 'facial merupakan metode perawatan yang efektif untuk meremajakan kulit wajah ', 200000),
('PC002', 'chemical peeling', 'chemical peeling adalah perawatan yang dilakukan untuk mengatasi berbagai masalah kulit seperti kulit kusam, berjerawat, bekas luka, keriput, hingga garis-garis halus di wajah.', 400000),
('PC003', 'microneedling', 'terapi ini bertujuan untuk memperbaiki tekstur kulit dengan merangsang produksi kolagen.', 600000),
('PC004', 'laser', 'perawatan ini digunakan untuk meremajakan kulitwajah, laser menghilangkan lapisan kult mati menggunakan sinar', 850000),
('PC005', 'botox', 'Suntik Botox adalah perawatan Anti-Wrinkle Injection atau biasa disebut Botox (Botox adalah nama brand bukan sebuah treatment) menjadi perawatan wajah populer.', 1250000);

--
-- Dumping data untuk tabel `detailpaket`
--

INSERT INTO `detailpaket` (`id_detail`, `id_paket`, `fitur`) VALUES
('DT001', 'PC001', 'deep cleansing'),
('DT002', 'PC001', 'penguapan wajah'),
('DT003', 'PC001', 'eksfoliasi'),
('DT004', 'PC001', 'clean komedo'),
('DT005', 'PC001', 'masker wajah'),
('DT006', 'PC001', 'astringen'),
('DT007', 'PC002', 'cleansing'),
('DT008', 'PC002', 'pengoleskan cairan kimia '),
('DT009', 'PC003', 'facial'),
('DT010', 'PC003', 'anestasi krim'),
('DT011', 'PC003', 'dilukai dengan dermarolle'),
('DT012', 'PC003', 'dioles serum'),
('DT013', 'PC004', 'cream'),
('DT014', 'PC004', 'facial wash'),
('DT015', 'PC004', 'laser wajah'),
('DT016', 'PC005', 'suntikan protein'),
('DT017', 'PC005', 'cleasing');

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_transaksi`, `total_pembayaran`, `bayar`, `status_pembayaran`) VALUES
('PAY0001', 'OD001', 1250000, 1250000, 'pending'),
('PAY0002', 'OD002', 850000, 850000, 'process'),
('PAY0003', 'OD003', 600000, 600000, 'success'),
('PAY0004', 'OD004', 1250000, 1250000, 'pending'),
('PAY0005', 'OD005', 1250000, 1250000, 'process'),
('PAY0006', 'OD006', 200000, 200000, 'success'),
('PAY0007', 'OD007', 1250000, 1250000, 'pending'),
('PAY0008', 'OD008', 850000, 850000, 'process'),
('PAY0009', 'OD009', 100000, 200000, 'success'),
('PAY0010', 'OD010', 400000, 400000, 'success'),
('PAY0011', 'OD011', 200000, 100000, 'pending'),
('PAY0012', 'OD012', 1250000, 1250000, 'process'),
('PAY0013', 'OD013', 600000, 600000, 'success'),
('PAY0014', 'OD014', 850000, 850000, 'success'),
('PAY0015', 'OD015', 200000, 200000, 'success'),
('PAY0016', 'OD016', 1250000, 1250000, 'pending'),
('PAY0017', 'OD017', 600000, 600000, 'success'),
('PAY0018', 'OD018', 200000, 200000, 'success'),
('PAY0019', 'OD019', 400000, 400000, 'process'),
('PAY0020', 'OD020', 400000, 400000, 'process');

--
-- Dumping data untuk tabel `perawatan`
--

INSERT INTO `perawatan` (`id_perawatan`, `id_dokter`, `id_transaksi`, `hasil`, `solusi`, `tanggal_perawatan`) VALUES
('R001', 'DC001', 'OD012', 'Kulit tampak kusam', 'Facial', '2021-09-02'),
('R002', 'DC001', 'OD008', 'Jerawat', 'Facial', '2021-09-14'),
('R003', 'DC006', 'OD011', 'Kulit kusam', 'Exfoliate', '2021-09-17'),
('R004', 'DC004', 'OD002', 'Kulit gelap', 'Suntik Putih', '2021-09-29'),
('R005', 'DC002', 'OD013', 'Komedo Berlebihan', 'Clean komedo', '2021-10-01'),
('R006', 'DC005', 'OD004', 'Pasang Bulu mata', 'Eyelash extension', '2021-10-04'),
('R007', 'DC003', 'OD005', 'Lapisan Kulit terlalu tipis', 'Laser', '2021-10-04'),
('R008', 'DC007', 'OD020', 'Bibir gelap', 'Sulam bibir', '2021-10-14'),
('R009', 'DC010', 'OD007', 'Kulit tampak kusam', 'Facial', '2021-10-18'),
('R010', 'DC002', 'OD001', 'Kulit gelap', 'Suntik Putih', '2021-10-20'),
('R011', 'DC008', 'OD009', 'Jerawat', 'Facial', '2021-10-20'),
('R012', 'DC007', 'OD017', 'Pasang Bulu mata', 'Eyelash extension', '2021-10-26'),
('R013', 'DC009', 'OD003', 'Kulit kering', 'Moisturizer', '2021-10-30'),
('R014', 'DC006', 'OD018', 'Memutihkan Badan', 'Suntik DNA salmon', '2021-10-31'),
('R015', 'DC008', 'OD014', 'Kulit kering', 'Moisturizer', '2021-11-20'),
('R016', 'DC009', 'OD019', 'Bibir gelap', 'Sulam bibir', '2021-11-25'),
('R017', 'DC005', 'OD006', 'Kulit kering', 'Moisturizer', '2021-11-29'),
('R018', 'DC006', 'OD010', 'Jerawat', 'Facial', '2021-12-21'),
('R019', 'DC010', 'OD016', 'Flek Hitam', 'Microdermabrasi', '2021-12-25'),
('R020', 'DC004', 'OD015', 'Pasang Bulu mata', 'Eyelash extension', '2021-12-25');

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `id_pegawai`, `id_paket`, `tanggal`, `totalBayar`) VALUES
('OD001', 'C009', 'P001', 'PC005', '2021-09-02', 1250000),
('OD002', 'C001', 'P004', 'PC004', '2021-09-14', 850000),
('OD003', 'C010', 'P005', 'PC003', '2021-09-17', 600000),
('OD004', 'C004', 'P009', 'PC005', '2021-09-29', 1250000),
('OD005', 'C009', 'P005', 'PC005', '2021-10-01', 1250000),
('OD006', 'C006', 'P002', 'PC001', '2021-10-04', 200000),
('OD007', 'C007', 'P001', 'PC005', '2021-10-14', 1250000),
('OD008', 'C008', 'P008', 'PC004', '2021-10-18', 850000),
('OD009', 'C004', 'P009', 'PC001', '2021-10-20', 200000),
('OD010', 'C002', 'P006', 'PC002', '2021-10-20', 400000),
('OD011', 'C006', 'P003', 'PC001', '2021-10-26', 200000),
('OD012', 'C009', 'P010', 'PC005', '2021-10-30', 1250000),
('OD013', 'C001', 'P007', 'PC003', '2021-10-31', 600000),
('OD014', 'C001', 'P002', 'PC004', '2021-11-14', 850000),
('OD015', 'C005', 'P003', 'PC001', '2021-11-20', 200000),
('OD016', 'C009', 'P001', 'PC005', '2021-11-25', 1250000),
('OD017', 'C004', 'P006', 'PC003', '2021-11-29', 600000),
('OD018', 'C008', 'P010', 'PC001', '2021-12-21', 200000),
('OD019', 'C010', 'P005', 'PC002', '2021-12-25', 400000),
('OD020', 'C005', 'P007', 'PC002', '2021-12-25', 400000);