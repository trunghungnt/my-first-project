/*----------------------------------------------------------
MASV:42.01.104.230
HO TEN:Nguyễn Trần Trung Hưng
MA ĐE:A-02 				-	CA THI:Chiều T2
----------------------------------------------------------*/

CREATE DATABASE A02
GO

USE A02
GO


CREATE TABLE CANHAN
(
	MaCN VARCHAR(5) NOT NULL,
	HoTen NVARCHAR(50)NOT NULL,
	Phai BIT DEFAULT 0 NOT NULL,
	NgaySinh DATETIME,
	CONSTRAINT pk_cn PRIMARY KEY (MaCN),
)

CREATE TABLE SINHHOAT
(
	MaSH INT IDENTITY(1,1) NOT NULL,
	TenSinhHoat NVARCHAR(50) NOT NULL,
	NgayBD DATETIME,
	NgayKT DATETIME,
	ChiPhiDauNguoi INT NOT NULL,
	CONSTRAINT pk_sh PRIMARY KEY (MaSH)
)

CREATE TABLE THAMGIA
(
	MaSH INT NOT NULL,
	MaCN VARCHAR(5) NOT NULL,
	NgDangKy DATETIME,
	SoTien INT NOT NULL,
	CONSTRAINT pk_tg PRIMARY KEY(MaSH,MaCN)
)

INSERT INTO dbo.CANHAN
        ( MaCN, HoTen, Phai, NgaySinh )
VALUES  ( '001', -- MaCN - varchar(5)
          N'Nguyen Van Hung', -- HoTen - nvarchar(50)
          0 , -- Phai - bit
          15/08/1982 -- NgaySinh - date
          )

INSERT INTO dbo.CANHAN
        ( MaCN, HoTen, Phai, NgaySinh )
VALUES  ( '002', -- MaCN - varchar(5)
          N'Nguyen Van Manh', -- HoTen - nvarchar(50)
          0, -- Phai - bit
          11/07/1982  -- NgaySinh - datetime
          )
INSERT INTO dbo.CANHAN
        ( MaCN, HoTen, Phai, NgaySinh )
VALUES  ( '003', -- MaCN - varchar(5)
          N'Nguyen Thi Thuy', -- HoTen - nvarchar(50)
          1, -- Phai - bit
          13/07/1985  -- NgaySinh - datetime
          )

INSERT INTO dbo.CANHAN
        ( MaCN, HoTen, Phai, NgaySinh )
VALUES  ( '004', -- MaCN - varchar(5)
          N'Nguyen Manh Hung', -- HoTen - nvarchar(50)
          0, -- Phai - bit
          25/08/1983  -- NgaySinh - datetime
          )
INSERT INTO dbo.SINHHOAT
        ( MaSH ,
          TenSinhHoat ,
          NgayBD ,
          NgayKT ,
          ChiPhiDauNguoi
        )
VALUES  ( NULL , -- MaSH - int
          N'DV1' , -- TenSinhHoat - nvarchar(50)
          1/1/2005 , -- NgayBD - datetime
          30/04/2005 , -- NgayKT - datetime
          30000  -- ChiPhiDauNguoi - int
        )

INSERT INTO	dbo.SINHHOAT
        ( MaSH ,
          TenSinhHoat ,
          NgayBD ,
          NgayKT ,
          ChiPhiDauNguoi
        )
VALUES  ( NULL , -- MaSH - int
          N'DV2' , -- TenSinhHoat - nvarchar(50)
          NULL , -- NgayBD - datetime
          1/5/2005 , -- NgayKT - datetime
          30000  -- ChiPhiDauNguoi - int
        )

INSERT INTO dbo.THAMGIA
        ( MaSH, MaCN, NgDangKy, SoTien )
VALUES  ( 001, -- MaSH - int
          '1', -- MaCN - varchar(5)
          30/12/2004, -- NgDangKy - datetime
          30000  -- SoTien - int
          )

INSERT INTO dbo.THAMGIA
        ( MaSH, MaCN, NgDangKy, SoTien )
VALUES  ( 002, -- MaSH - int
          '2', -- MaCN - varchar(5)
          31/12/2004, -- NgDangKy - datetime
          30000  -- SoTien - int
          )

INSERT INTO dbo.THAMGIA
        ( MaSH, MaCN, NgDangKy, SoTien )
VALUES  ( 003, -- MaSH - int
          '1', -- MaCN - varchar(5)
          29/12/2004, -- NgDangKy - datetime
          30000  -- SoTien - int
          )

INSERT INTO dbo.THAMGIA
        ( MaSH, MaCN, NgDangKy, SoTien )
VALUES  ( 004, -- MaSH - int
          '2', -- MaCN - varchar(5)
		28/12/2004, -- NgDangKy - datetime
          30000  -- SoTien - int
          )

--cau3:
--a:
SELECT MaCN AS N'Mã Cá Nhân',HoTen AS N'Họ Tên',Phai AS N'Giới Tính'
FROM dbo.CANHAN AS CN
--WHERE CASE CN.Phai WHEN CN.Phai '1' THEN 'Nam'
					--WHEN CN.Phai '0' THEN	'Nu'		 
--b:
SELECT CN.MaCN,CN.HoTen,TG.NgDangKy,TG.SoTien
FROM	dbo.CANHAN AS CN,dbo.THAMGIA AS TG,dbo.SINHHOAT AS SH
WHERE TG.MaSH=CN.MaCN AND 
		TG.MaCN=SH.MaSH

--c:
SELECT CN.MaCN,CN.HoTen,CN.Phai,CN.NgaySinh
FROM dbo.CANHAN AS CN,dbo.SINHHOAT AS SH,dbo.THAMGIA AS TG
WHERE TG.MaSH=CN.MaCN AND 
		TG.MaCN=SH.MaSH AND CN.Phai= 'true'
--d:
