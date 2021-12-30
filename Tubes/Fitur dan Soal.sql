--Select--

SELECT * FROM pegawai;

SELECT * FROM pemilik;

SELECT * FROM dokter;

SELECT * FROM pelanggan;

SELECT * FROM paket;

SELECT * FROM detailPaket;

SELECT * FROM transaksi;

SELECT * FROM perawatan;

SELECT * FROM pembayaran;


---------------------------------------------------------------------------------------------------
												--view--
--pemilik--
CREATE VIEW getpemilik 
AS SELECT id_pemilik, 
		nama_pemilik,
		jenisKelamin_pemilik, 
		noTelp_pemilik, 
		alamat_pemilik 
FROM pemilik WHERE alamat_pemilik = 'Malang';

SELECT * From getpemilik;

--pegawai--
CREATE VIEW getpegawai
AS SELECT id_pegawai, 
		nama_pegawai,
		jenisKelamin_pegawai, 
		noTelp_pegawai, 
		alamat_pegawai 
FROM pegawai WHERE alamat_pegawai = 'Probolinggo';

SELECT * From getpegawai;

--dokter--
CREATE VIEW getdokter
AS SELECT id_dokter, 
		nama_dokter,
		jenisKelamin_dokter, 
		noTelp_dokter, 
		alamat_dokter 
FROM dokter WHERE alamat_dokter = 'Solo';

SELECT * From getdokter;

--pelanggan--
CREATE VIEW getpelanggan
AS SELECT id_pelanggan, 
		nama_pelanggan,
		jenisKelamin_pelanggan, 
		noTelp_pelanggan, 
		alamat_pelanggan,
		status 
FROM pelanggan WHERE status = 'pelanggan';

SELECT * From getpelanggan;

--Transaksi--
CREATE VIEW gettransaksi
AS SELECT id_transaksi, 
		id_pelanggan,
		tanggal,
		totalBayar 
FROM transaksi WHERE MONTH(tanggal) = 10;

SELECT * From gettransaksi;

--Pembayaran--
CREATE VIEW getpembayaran
AS SELECT id_pembayaran, 
		id_transaksi,
		total_pembayaran,
		status_pembayaran 
FROM pembayaran WHERE status_pembayaran = 'success';

SELECT * From getpembayaran;
------------------------------------------------------------------------------------------------------------
						--Procedure--
CREATE PROCEDURE UspPegawai
AS SELECT id_pegawai, 
		nama_pegawai,
		jenisKelamin_pegawai,
		tanggalLahir_pegawai, 
		noTelp_pegawai, 
		alamat_pegawai
FROM pegawai WHERE YEAR(tanggalLahir_pegawai) = 1999
GO

EXEC UspPegawai;

------------------------------------------------------------------------------------------------------------
								--Function--
--Pemilik--
GO
    CREATE FUNCTION Fpemilik()
    RETURNS TABLE 
    AS
    RETURN (
        SELECT * FROM pemilik WHERE jenisKelamin_pemilik ='L'
    )
GO
SELECT * FROM Fpemilik() ;

--Pelanggan--
GO
    CREATE FUNCTION Fpelanggan()
    RETURNS TABLE 
    AS
    RETURN (
        SELECT * FROM pelanggan WHERE alamat_pelanggan = 'Malang'
    )
GO
SELECT * FROM Fpelanggan() ;

--dokter--
GO
    CREATE FUNCTION Fdokter()
    RETURNS TABLE 
    AS
    RETURN (
        SELECT * FROM dokter WHERE MONTH(tanggalLahir_dokter) = '09'
    )
GO
SELECT * FROM Fdokter() ;

--Pegawai--
GO
    CREATE FUNCTION Fpegawai()
    RETURNS TABLE 
    AS
    RETURN (
        SELECT * FROM pegawai WHERE alamat_pegawai ='Probolinggo'
    )
GO
SELECT * FROM Fpegawai() ;

--Paket--
GO
    CREATE FUNCTION Fpaket()
    RETURNS TABLE 
    AS
    RETURN (
        SELECT * FROM paket
    )
GO
SELECT * FROM Fpaket() ;

------------------------------------------------------------------------------------------------------------
--SOAL--
--1. pelanggan baru akan didata dulu oleh pegawai.--

INSERT INTO pelanggan (id_pelanggan, email_pelanggan, 
						password_pelanggan, nama_pelanggan, 
						jenisKelamin_pelanggan, noTelp_pelanggan, 
						alamat_pelanggan, tanggalLahir_pelanggan, status) VALUES
('C011', 'ilyass12@gmail.com', 'Ilyas123', 'Ilyas Ramadhan', 'L', '08763746372', 'Jember', '1980', 'pelanggan');

CREATE VIEW getpelanggannew
AS SELECT id_pelanggan,
		email_pelanggan,
		password_pelanggan, 
		nama_pelanggan,
		jenisKelamin_pelanggan, 
		noTelp_pelanggan, 
		alamat_pelanggan,
		status 
FROM pelanggan WHERE id_pelanggan = 'C011';

SELECT * From getpelanggannew;

--2. pelanggan bisa memesan paket kecantikan dan hari/tanggal perawatan kecantikan.--

GO
    CREATE PROCEDURE orderPelanggan(
        @id_transaksi VARCHAR(10),
        @id_rawat VARCHAR(10),
        @id_pembayaran VARCHAR(10),
        @id_pelanggan VARCHAR(10),
        @id_pegawai VARCHAR(10),
        @id_paket VARCHAR(10),
        @id_dokter VARCHAR(10),
        @tanggal_perawatan DATE,
        @totalBayar float
    )
    AS
    BEGIN
        IF @id_transaksi is not NULL
            BEGIN
                insert into transaksi values('OD021', 'C009', 'P010', 'PC005', GETDATE(), '1250000')
                insert into perawatan values('R021', 'DC001','OD021',  '', '', '2021-12-31')
                insert into pembayaran values('PAY0021', 'OD021','1250000', '0', 'pending')
            END
    END
GO

EXEC orderPelanggan @id_transaksi = 'OD021',@id_rawat ='R001',@id_pembayaran ='PAY0021',@id_pelanggan = 'C021',
@id_pegawai = 'P010',@id_paket = 'PC005', @id_dokter ='DC001',@tanggal_perawatan = '2021-12-31',@totalBayar = '125000000';


--3. pelanggan yang sudah berstatus pelanggan tetap dapat mengakses paket premium--
CREATE VIEW getpaketPremium
AS SELECT id_paket, 
		nama_paket,
		deskripsi, 
		harga_paket
FROM paket;

SELECT * From getpaketPremium;

--4. pegawai dan pemilik klinik bisa memeriksa pembayaran pelanggan--

GO
    CREATE FUNCTION Fpembayaran()
    RETURNS TABLE 
    AS
    RETURN (
        select * from pembayaran
    )
GO
SELECT * FROM Fpembayaran() ;

--5. setiap pelanggan mempunyai track record perawatan yang dapat diakses oleh dokter klinik dan pemilik klinik.--

GO
    CREATE FUNCTION Frecord()
    RETURNS TABLE 
    AS
    RETURN (
        select * from perawatan
    )
GO
SELECT * FROM Frecord() ;

--6. dokter klinik  bisa menentukan paket2 kecantikan apa saja yang dapat diakses dan dipesan pelanggan.--

GO
    CREATE FUNCTION Fpaket()
    RETURNS TABLE 
    AS
    RETURN (
        select * from paket
    )
GO
SELECT * FROM Fpaket() ;

--7. pemilik klinik bisa menentukan seluruh paket-paket kecantikan yang ada.--

SELECT * From getpaketPremium;

--8. pemilik klinik bisa melihat rekap kunjungan pelanggan perbulan--

GO
	CREATE FUNCTION Ftransaksi()
    RETURNS TABLE 
    AS
    RETURN (
		SELECT id_transaksi,
		YEAR(tanggal) AS Tahun, MONTH(tanggal) AS Bulan,
		DAY(tanggal) AS Hari, COUNT(tanggal)
		FROM transaksi
		GROUP BY ROLLUP(YEAR(tanggal), MONTH(tanggal), DAY(tanggal))

    )
GO
SELECT * FROM Ftransaksi() ;
