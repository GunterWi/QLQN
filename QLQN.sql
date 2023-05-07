DROP DATABASE QLQN
CREATE DATABASE QLQN
GO 
USE QLQN
GO
CREATE TABLE PHONG(
MAPHONG VARCHAR(10) PRIMARY KEY ,
TENPHONG NVARCHAR(100) NOT NULL,
SOTIEN int not NULL,
)
GO

CREATE TABLE THANHVIEN(
MATAIKHOAN int identity(1,001) primary key,
TENTAIKHOAN VARCHAR (20) not null,
MATKHAU VARCHAR(20) NOT NULL,
SOTIENHIENCO int NULL,
NGAYLAP DATE not null,
NGAYHETHAN DATE NOT NULL,
MOTA NVARCHAR(50) NULL
)
GO

CREATE TABLE MAYKHACH(
MAMT VARCHAR(10) primary key,
TENMAYTINH Nvarchar (20) not null,
TRANGTHAI VARCHAR(20) NOT NULL,
MAPHONG VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES PHONG(MAPHONG)
)
go
CREATE TABLE CTSUDUNG( 
MAMT VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES MAYKHACH(MAMT),
MATAIKHOAN INT NOT NULL FOREIGN KEY REFERENCES THANHVIEN(MATAIKHOAN),
GIOBATDAU datetime,
GIOKETTHUC DATETIME,
PRIMARY KEY(MAMT,MATAIKHOAN,GIOBATDAU)
)
GO
CREATE TABLE CHUCVU(
MACV VARCHAR(10) PRIMARY KEY,
TENCV NVARCHAR(100) NOT NULL,
)
GO
CREATE TABLE NHANVIEN(
MANV VARCHAR(10) PRIMARY KEY,
HO NVARCHAR(20) NOT NULL,
TEN NVARCHAR(20) NOT NULL,
GIOITINH NVARCHAR(5) NOT NULL,
NGAYSINH DATE NOT NULL,
DIACHI NVARCHAR(100) NULL,
DIENTHOAI VARCHAR(15) NOT NULL,
CMND VARCHAR(15) NOT NULL,
LUONGCOBAN int,
MACV varchar(10) NOT NULL FOREIGN KEY REFERENCES CHUCVU(MACV),
)
GO
CREATE TABLE NAPTIEN(
MANV VARCHAR (10) NOT NULL FOREIGN KEY REFERENCES NHANVIEN(MANV),
MATAIKHOAN INT NOT NULL FOREIGN KEY REFERENCES THANHVIEN(MATAIKHOAN),
THOIGIANNAPTIEN DATETIME NOT NULL,
SOTIEN int NOT NULL,
primary key(manv,mataikhoan,THOIGIANNAPTIEN)
)
CREATE TABLE LOAIHANG(
MALOAIHANG VARCHAR(10) NOT NULL PRIMARY KEY,
TENLOAIHANG NVARCHAR(10) NOT NULL ,
)
GO
CREATE TABLE MENU(
MAHANG VARCHAR(10) NOT NULL PRIMARY KEY,
TENHANG NVARCHAR(10) NOT NULL ,
SOLUONGTON SMALLINT NULL,
MALOAIHANG VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES LOAIHANG(MALOAIHANG),
DVT VARCHAR(5) NULL,
DONGIA int NULL,
)
go

CREATE TABLE HOADON(
MAHD VARCHAR(10) PRIMARY KEY,
MAMT VARCHAR(10) not null FOREIGN KEY REFERENCES MAYKHACH(MAMT) ,
MANV VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES NHANVIEN(MANV),
TRANGTHAITT VARCHAR(20),
NGAY DATEtIME NOT NULL
)
CREATE TABLE CTHOADON(
MAHD VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES HOADON(MAHD),
MAHANG VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES MENU(MAHANG),
SOLUONG int not null,
MUCGIAMGIA DECIMAL(4,2),
PRIMARY KEY(MAHD,MAHANG)
)
go
go
insert into PHONG(MAPHONG,TENPHONG,SOTIEN) values
('P1',N'Vip',10000),
('P2',N'Thường',8000)
go
insert into THANHVIEN(TENTAIKHOAN,MATKHAU,SOTIENHIENCO,NGAYLAP,NGAYHETHAN,MOTA) values
('Admin','123',9999999,'2023/3/12','2099/3/20','ACC Admin'), -- ACC Admin khi xài trên Maykhachc
('user','1',0,'2023/3/12','2099/3/20','acc trả tiền sau'),  -- tài khoản auto khi mà khách không có hội viên và muốn chơi trực tiếp
('VuWibu','WibuSo1',30000,'2023/3/12','2099/3/20','hội viên'),
('Nagori','Cunny',50000,'2023/3/12','2099/3/20','hội viên'),
('TThinh','BestChamber',5000,'2023/3/12','2099/3/20','hội viên')
go
insert into MAYKHACH(MAMT,TENMAYTINH,TRANGTHAI,MAPHONG) values 
('MAY1',N'MÁY 1','DA KET NOI','P2'),
('MAY2',N'MÁY 2','MAT KET NOI','P1'),
('MAY3',N'MÁY 3','MAT KET NOI','P1'),
('MAY4',N'MÁY 4','MAT KET NOI','P2'),
('MAY5',N'MÁY 5','MAT KET NOI','P2')
GO
insert into CTSUDUNG values
('MAY1',3,'2023-4-10 12:30:45','2023-4-10 13:40:22'),
('MAY2',2,'2023-4-10 12:40:25','2023-4-10 15:50:22'),
('MAY3',4,'2023-4-10 12:50:55','2023-4-10 14:20:22'),
('MAY4',5,'2023-4-10 12:20:15','2023-4-10 14:30:22'),
('MAY5',2,'2023-4-10 12:40:35','2023-4-10 11:40:22')
go
insert into CHUCVU(MACV, TENCV )VALUES
('CV01', N'Thu ngân'),
('CV02', N'Phục Vụ')
go
insert into NHANVIEN VALUES
('NV01', N'Trần Hoàng', N'Trọng',N'Nam', '2003/1/1',N' 63 Võ nguyên giáp ' ,'09094556452', '225944756', 5000000, 'CV01'),
('NV02', N'Nguyen Anh', N'Quân',N'Nam', '2003/12/8',N' 12 Lê đại hành ' , '0905426058', '225899124', 3500000, 'CV02'),
('NV03', N'Nguyen Quoc', N'Thái',N'Nam', '2003/4/9',N' 11 Sơn đoàng ' , '0707265138', '331344213', 3500000, 'CV01'),
('NV04', N'Huỳnh Nam', N'Vũ',N'Nữ', '2003/12/12',N' 33 Lê đại hành ' , '0707264065', '119293319', 3500000, 'CV02'),
('NV05', N'Trần Anh', N'Tín',N'Nam', '2003/7/1',N' 23 Sơn đoàng ' , '0456111321', '228693134', 3500000, 'CV02')
go
insert into NAPTIEN(MANV,MATAIKHOAN,THOIGIANNAPTIEN,SOTIEN) values
('NV01',3,'2023/2/5 12:30:25',10000),
('NV01',4,'2023/2/5 12:31:25',50000),
('NV03',5,'2023/2/5 12:32:25',10000),
('NV01',3,'2023/2/5 12:33:25',20000),
('NV01',3,'2023/2/5 12:34:25',10000)
go

insert into LOAIHANG(MALOAIHANG, TENLOAIHANG) VALUES
('ML01', N'Đồ ăn'),
('ML02', N'Nước uống')
go
insert into MENU(MAHANG,TENHANG, SOLUONGTON, MALOAIHANG, DVT,DONGIA) VALUES 
('MH01',N'Mì trứng', 20, 'ML01', 'Goi', 10000),
('MH02',N'Cơm chiên', 10, 'ML01', 'Dia', 20000),
('MH03',N'7UP', 20, 'ML02', 'Lon', 7000),
('MH04',N'Coca', 20, 'ML02', 'Lon', 7000),
('MH05',N'Cà phê', 15, 'ML02', 'Ly', 12000)
go

INSERT INTO HOADON(MAHD, MAMT,MANV,NGAY) VALUES
('HD01','MAY1', 'NV01','2023/2/28'),
('HD02','MAY2', 'NV01','2023/4/28'),
('HD03','MAY3', 'NV03','2023/3/28'),
('HD04','MAY4', 'NV03','2023/2/28'),
('HD05','MAY5', 'NV01','2023/2/28')
go
INSERT INTO CTHOADON(MAHD, MAHANG,SOLUONG,MUCGIAMGIA) VALUES
('HD01','MH01', 3,0.25),
('HD01','MH02', 1,0),
('HD02','MH01', 2,0),
('HD03','MH03', 3,0),
('HD04','MH04', 5,0)


--a Truy vấn đơn giản 3 câu
--a1) Cho biết họ, tên, địa chỉ, điện thoại, cmnd của các nhân viên.
select nv.HO, nv.TEN, nv.DIACHI, nv.DIENTHOAI, nv.CMND
from NHANVIEN nv

--a2) Cho biết các món được phục vụ trong hóa đơn 1.
select mn.TENHANG
from HOADON hd, CTHOADON cthd, MENU mn
where hd.MAHD = 'HD01' and hd.MAHD = cthd.MAHD and cthd.MAHANG = mn.MAHANG

--a3) Cho biết các máy đang sử dụng dịch vụ trả sau.
select  mk.TENMAYTINH, p.TENPHONG
from THANHVIEN tv, CTSUDUNG ctsd, MAYKHACH mk, PHONG p
where ctsd.MATAIKHOAN = 2 and ctsd.MAMT = mk.MAMT and mk.MAPHONG = p.MAPHONG
group by TENMAYTINH, TENPHONG

--b Truy vấn với Aggregate functions 7 câu

--b1) Cho viết số hóa đơn trong ngày 2023/2/28.
select count(*) as tongsohoadon
from HOADON
where NGAY = '2023/2/28'

--b2) Có tất cả bao nhiêu nhân viên.
select count(*) as tongsonhanvien
from NHANVIEN

--b3) Có bao nhiêu tài khoản hội viên (tài khoản khác user và admin).
select count(tv.MATAIKHOAN) as tongsotaikhoan
from THANHVIEN tv
where tv.MATAIKHOAN != 1 and tv.MATAIKHOAN !=2

--b4) Tính tổng lương của từng chức vụ.
select cv.TENCV, sum (LUONGCOBAN) as tongluong
from  CHUCVU cv, NHANVIEN nv
where nv.MACV = cv.MACV 
group by cv.TENCV

--b5) Tính lương trung bình của chức vụ thu ngân.
select cv.TENCV, AVG(nv.LUONGCOBAN) as trungbinhluong
from  CHUCVU cv, NHANVIEN nv
where nv.MACV = cv.MACV and cv.MACV = N'CV01'
group by cv.TENCV

--b6) Tính tổng tiền mà thành viên ‘vuwibu’ đã nạp.
select sum(nt.SOTIEN) as tongtien
from NAPTIEN nt
where nt.MATAIKHOAN = 3

--b7) Tính tổng tiền mà các thu ngân đã phụ trách.
select nv.HO, nv.TEN, nv.CMND , nv.DIACHI, nv.DIENTHOAI, sum(nt.SOTIEN) as tongtienphutrach
from NHANVIEN nv, NAPTIEN nt
where nv.MANV = nt.MANV 
group by nv.HO, nv.TEN, nv.CMND , nv.DIACHI, nv.DIENTHOAI

--c	Truy vấn với mệnh đề having: 5 câu

--Cho biết nhân viên thực hiện ít giao dịch nạp tiền
select nv.TEN
from NHANVIEN nv,NAPTIEN nt
where nv.MANV=nt.MANV
group by (nv.TEN)
having count(nt.MATAIKHOAN)<=all(select count(nt.MATAIKHOAN)
					from NHANVIEN nv,NAPTIEN nt
					where nv.MANV=nt.MANV group by nt.MATAIKHOAN)
--Cho biết nhân viên thực hiện nhiều giao dịch nạp tiền
select nv.TEN
from NHANVIEN nv,NAPTIEN nt
where nv.MANV=nt.MANV
group by (nv.TEN)
having count(nt.MATAIKHOAN)>=all(select count(nt.MATAIKHOAN)
					from NHANVIEN nv,NAPTIEN nt
					where nv.MANV=nt.MANV group by nt.MATAIKHOAN)
--Cho biết nhân viên giao dịch có lương cơ bản TB >3500000
select nv.MANV, nv.HO, nv.TEN
from NHANVIEN nv, NAPTIEN nt
where nt.MANV = nv.MANV
group by nv.MANV, nv.HO, nv.TEN
having AVG(nv.LUONGCOBAN) >3500000
--Cho biết thành viên nạp tiền chỉ 1 lần
select tv.MATAIKHOAN, tv.TENTAIKHOAN
from NAPTIEN nt, THANHVIEN tv
where nt.MATAIKHOAN = tv.MATAIKHOAN 
group by tv.MATAIKHOAN, tv.TENTAIKHOAN
having count(nt.MATAIKHOAN)=1
--Cho biết tên thành viên nạp tiền >= 50000
select tv.MATAIKHOAN, tv.TENTAIKHOAN
from NAPTIEN nt, THANHVIEN tv
where nt.MATAIKHOAN = tv.MATAIKHOAN 
group by tv.MATAIKHOAN, tv.TENTAIKHOAN, nt.SOTIEN
having nt.SOTIEN>=50000

--d Truy vấn lớn nhất, nhỏ nhất: 3 câu

--Cho biết tên khách hàng có số tiền hiện có cao nhất
select TENTAIKHOAN,SOTIENHIENCO
from THANHVIEN
where SOTIENHIENCO=(select max(tv.SOTIENHIENCO)
						from THANHVIEN tv)
--Cho biết thông tin của nhân viên có mức lương cơ bản nhỏ nhất
select MANV,HO,TEN,NGAYSINH,NGAYSINH,DIACHI,DIENTHOAI
from NHANVIEN
where LUONGCOBAN=(select min(nv.LUONGCOBAN)
						from NHANVIEN nv)
--Cho biết số lượng tồn nhỏ nhất của các mặt hàng
select TENHANG
from MENU
where SOLUONGTON=(select min(m.SOLUONGTON)
						from MENU m)

--e	Truy vấn Không/chưa có: (Not In và left/right join): 5 câu

--e1) Cho biết món ăn không được phục vụ trong ngày 2023/2/28.
select distinct mn.TENHANG
from  MENU mn
where  mn.MAHANG not in
(select cthd.MAHANG
from CTHOADON cthd, HOADON hd
where hd.NGAY = '2023/2/28' and hd.MAHD = cthd.MAHD )

--e2) Cho biết máy nào chưa có mã phòng.
select TENMAYTINH
from MAYKHACH 
where MAPHONG not in (select MAPHONG from PHONG )

--e3) Cho biết tài khoản chưa được sử dụng.(Trừ admin với user)
select tv.TENTAIKHOAN 
from  THANHVIEN tv
where tv.MATAIKHOAN !='1' and tv.MATAIKHOAN <> '2' and  tv.MATAIKHOAN not in 
(select distinct MATAIKHOAN
from CTSUDUNG )

--e4) Cho biết những tài khoàn mà ‘Thai’ không thực hiện nạp tiền.(Trừ admin với user)
select tv.TENTAIKHOAN 
from  THANHVIEN tv
where  tv.MATAIKHOAN !='1'
and tv.MATAIKHOAN <> '2'
and  tv.MATAIKHOAN not in 
(select distinct MATAIKHOAN
from NAPTIEN nt, NHANVIEN nv 
where nt.MANV = nv.MANV
and nv.TEN = 'Thai')

--e5) Cho biết những mặt hàng được giảm giá.
select TENHANG
from MENU
where MAHANG not in 
( select MAHANG 
from CTHOADON 
where MUCGIAMGIA = '0')

--f	Truy vấn Hợp/Giao/Trừ: 3 câu

--Cho biết tên máy nào đã sử dụng dịch vụ ngày hôm nay và ngày hôm qua
select mk.MAMT
from MAYKHACH mk,CTSUDUNG sd
where mk.MAMT=sd.MAMT and day(sd.GIOBATDAU)=day(GETDATE()) and MONTH(sd.GIOBATDAU)=MONTH(GETDATE())
intersect 
select mk.MAMT
from MAYKHACH mk,CTSUDUNG sd
where mk.MAMT=sd.MAMT and day(sd.GIOBATDAU)=day(GETDATE()-1) and MONTH(sd.GIOBATDAU)=MONTH(GETDATE()-1)
---Cho biết lương nhân viên nam lương > 3500000 và nữ > 5000000
select*
from NHANVIEN 
where Gioitinh='Nam' and LUONGCOBAN>3500000
union
select*
from NHANVIEN 
where Gioitinh=N'Nữ' and LUONGCOBAN>5000000
--Cho biêt tên tài khoản mà chưa nạp tiền trong ngày hôm nay
select distinct tv.TENTAIKHOAN
from THANHVIEN tv
except
	select tv.TENTAIKHOAN
	from THANHVIEN tv,NAPTIEN nt
	where day(nt.THOIGIANNAPTIEN)=day(GetDate()) and tv.MATAIKHOAN=nt.MATAIKHOAN

--g	Truy vấn Update, Delete:  7 câu

--1.Cập nhật giá phòng vip lên 12k
update PHONG
set SOTIEN=12000
where TENPHONG='Vip'
--2. Tăng 10% lương đối với các nhân viên là Nam có chức vụ là Thu ngân
update NHANVIEN
set LUONGCOBAN=LUONGCOBAN+LUONGCOBAN*0.1
from NHANVIEN nv join CHUCVU cv on nv.MACV=cv.MACV 
where nv.Gioitinh like 'Nữ' and cv.TENCV='Thu ngân'
--3.Giảm 25% lương của những nhân viên trong năm 2023 có chức vụ là thu ngân không lập được hóa đơn nào.
update NHANVIEN
set LUONGCOBAN=LUONGCOBAN+LUONGCOBAN*0.25
select nv.MANV 
from NHANVIEN nv join CHUCVU cv on cv.MACV=nv.MACV
where cv.TENCV='Thu ngân' and manv not in (SELECT nv1.MANV
					FROM NHANVIEN nv1 join HOADON hd on nv1.MANV=hd.MANV
					where year(hd.ngay)=2023 )
--4.Tăng SOLUONGTON những LOAIHANG là 'do uong' len gap doi 
UPDATE MENU
SET SOLUONGTON = SOLUONGTON * 2
from menu m join LOAIHANG lh on m.MALOAIHANG=lh.MALOAIHANG
WHERE lh.TENLOAIHANG = N'Nước uống';
--5.Xóa khỏi bảng NHANVIEN những nhân viên là nam mà hơn 40 tuổi
DELETE FROM NHANVIEN 
WHERE Gioitinh = 'Nam' AND DATEDIFF(year, NGAYSINH, GETDATE()) > 40
--6.Xóa những hóa đơn trước năm 2022 ra khỏi cơ sở dữ liệu
DELETE FROM HOADON
WHERE YEAR(NGAY) < 2022;
--7. Xóa khỏi bảng MATHANG những mặt hàng hiện không có bất kỳ hóa đơn nào trong quán.
DELETE FROM MENU
WHERE MAHANG NOT IN (
    SELECT DISTINCT MAHANG
    FROM HOADON hd join CTHOADON ct on ct.MAHD=hd.MAHD
    WHERE YEAR(ngay) >= YEAR(GETDATE()) - 1
)

--h	Truy vấn sử dụng phép Chia: 2 câu

--Cho biết những tên máy đã gọi tất cả các mặt hàng (menu)
select mk.TENMAYTINH
from MAYKHACH mk
where not exists (select MAHANG from MENU except select distinct ct.MAHANG from HOADON hd join CTHOADON ct on hd.MAHD=ct.MAHD where  hd.MAMT= mk.MAMT )

--Cho biết tên những nhân viên mà phụ trách tất cả nạp tiền của thành viên vuwibu
select nv.TEN
from NHANVIEN nv
where not exists (select MATAIKHOAN from THANHVIEN where TENTAIKHOAN='VuWibu' except select distinct nt.MATAIKHOAN from NAPTIEN nt where  nt.MANV= nv.MANV )
-- thu tuc
CREATE PROCEDURE THEM_THANHVIEN
    @TENTAIKHOAN VARCHAR(20),
    @MATKHAU VARCHAR(20),
    @SOTIENHIENCO INT,
    @NGAYLAP DATE,
    @NGAYHETHAN DATE,
    @MOTA NVARCHAR(50)
AS
BEGIN
    INSERT INTO THANHVIEN (TENTAIKHOAN, MATKHAU, SOTIENHIENCO, NGAYLAP, NGAYHETHAN, MOTA)
    VALUES (@TENTAIKHOAN, @MATKHAU, @SOTIENHIENCO, @NGAYLAP, @NGAYHETHAN, @MOTA)
END
Exec THEM_THANHVIEN 'VuNgu', '123',2000,'2023/02/20','2059/02/20','Hoi vien'
-- lấy thông tin thành viên
CREATE PROCEDURE GetThongTinThanhVien
AS
BEGIN
    SELECT TV.TENTAIKHOAN AS 'TenThanhVien',
           MK.TENMAYTINH AS 'MaySuDung',
           NT.SOTIEN AS 'SoTienDaNap'
    FROM THANHVIEN TV
    JOIN CTSUDUNG CT ON TV.MATAIKHOAN = CT.MATAIKHOAN
    JOIN MAYKHACH MK ON CT.MAMT = MK.MAMT
    JOIN NAPTIEN NT ON TV.MATAIKHOAN = NT.MATAIKHOAN
END
Exec GetThongTinThanhVien
--Xóa thành viên
CREATE PROCEDURE XoaThanhVien (
	@MATAIKHOAN INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

		DELETE FROM THANHVIEN
		WHERE MATAIKHOAN = @MATAIKHOAN

		COMMIT

		PRINT N'Xóa tài khoản thành viên thành công'
	END TRY
	BEGIN CATCH
		ROLLBACK

		PRINT N'Xóa tài khoản thành viên thất bại'
	END CATCH
END
Exec XoaThanhVien 5
--Sửa thành viên
CREATE PROCEDURE SuaThanhVien (
	@MATAIKHOAN INT,
	@TENTAIKHOAN VARCHAR(20),
	@MATKHAU VARCHAR(20),
	@SOTIENHIENCO INT,
	@NGAYLAP DATE,
	@NGAYHETHAN DATE,
	@MOTA NVARCHAR(50)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

		-- Cập nhật thông tin thành viên
		UPDATE THANHVIEN
		SET TENTAIKHOAN = @TENTAIKHOAN,
			MATKHAU = @MATKHAU,
			SOTIENHIENCO = @SOTIENHIENCO,
			NGAYLAP = @NGAYLAP,
			NGAYHETHAN = @NGAYHETHAN,
			MOTA = @MOTA
		WHERE MATAIKHOAN = @MATAIKHOAN

		COMMIT

		PRINT N'Sửa thông tin thành viên thành công'
	END TRY
	BEGIN CATCH
		-- Nếu xảy ra lỗi, rollback giao dịch
		ROLLBACK

		PRINT N'Sửa thông tin thành viên thất bại'
	END CATCH
END
exec SuaThanhVien '5','TThinh','BestChamber',10000,'2023/3/12','2099/3/20','hội viên'

--Hàm
--Hàm trả về tài khoản có số tiền nhiều nhất
Drop function SoTienMax_TV
CREATE FUNCTION SoTienMax_TV()
RETURNS INT
AS
BEGIN
	DECLARE @SoTienMax INT
	SELECT @SoTienMax = MAX(SOTIENHIENCO)
	FROM THANHVIEN
	Where TENTAIKHOAN!='Admin'
	RETURN @SoTienMax
END
SELECT TENTAIKHOAN AS 'Tên Thành Viên', SOTIENHIENCO AS 'Số Tiền Hiện Có'
FROM THANHVIEN
WHERE SOTIENHIENCO = dbo.SoTienMax_TV()
--Hàm trả về thông tin đầy đủ của nhân viên
Create function XemTT_NV
( @MaNV varchar(10) )
returns table
as
return ( select *
from NHANVIEN
where MANV = @MaNV )
select *
from dbo.XemTT_NV ('NV04')

--trigger thêm tiền
DROP TRIGGER tr_NapTien 
CREATE TRIGGER tr_NapTien
ON NAPTIEN
AFTER INSERT
AS
BEGIN
UPDATE THANHVIEN
SET SOTIENHIENCO = SOTIENHIENCO + inserted.SOTIEN
FROM THANHVIEN JOIN inserted ON THANHVIEN.MATAIKHOAN = inserted.MATAIKHOAN
END
GO
--Trigger số lượng tồn
CREATE TRIGGER tr_CTHoaDon
ON CTHOADON
AFTER INSERT
AS
BEGIN
UPDATE MENU
SET SOLUONGTON = CASE WHEN (SOLUONGTON - inserted.SOLUONG) >= 0 THEN (SOLUONGTON - inserted.SOLUONG) ELSE 0 END
FROM MENU
JOIN inserted ON MENU.MAHANG = inserted.MAHANG
END
GO
-- trigger tru tien
drop trigger tr_TinhTienSudung
CREATE TRIGGER tr_TinhTienSudung
ON CTSUDUNG
AFTER INSERT, UPDATE
AS
BEGIN
-- Tính số giờ sử dụng của mỗi record được thêm vào hoặc cập nhật trong CTSUDUNG
	DECLARE @mamay varchar(10), @mataikhoan int, @giobatdau datetime, @gioketthuc datetime, @songio int, @sophut int, @sotien int, @maphong varchar(10)
    SELECT @mamay = inserted.MAMT, @mataikhoan = inserted.MATAIKHOAN, @giobatdau = inserted.GIOBATDAU, @gioketthuc = inserted.GIOKETTHUC
    FROM inserted

    SELECT @songio = DATEDIFF(MINUTE, @giobatdau, @gioketthuc) / 60,
           @sophut = DATEDIFF(MINUTE, @giobatdau, @gioketthuc) % 60

    SELECT @maphong = MAPHONG
    FROM MAYKHACH
    WHERE MAMT = @mamay

	DECLARE @SOTIENPHONG INT
	SELECT @SOTIENPHONG=SOTIEN
    FROM PHONG
    WHERE MAPHONG = @maphong
	/*Cách 2
	@sotienphong* DATEDIFF(MINUTE, @giobatdau, @gioketthuc)/60*/
    IF @maphong = 'P1'
        SET @sotien = @songio * @SOTIENPHONG + @sophut * (@SOTIENPHONG/60)
    ELSE
        SET @sotien = @songio * @SOTIENPHONG + @sophut * (@SOTIENPHONG/60)

    UPDATE THANHVIEN
    SET SOTIENHIENCO = SOTIENHIENCO - @sotien
    WHERE MATAIKHOAN = @mataikhoan
END
GO
SELECT CAST(ROUND(1 * 8000 + 10 * 8000/60, -3) AS INT) as sotien
select 29 * 10000/60.0
-- PHÂN QUYỀN 
CREATE LOGIN Vu
WITH PASSWORD = 'VU'
create user vu for login Vu

CREATE LOGIN Thaingu
WITH PASSWORD = 'THAINGU'
create user thaingu for login Thaingu

CREATE LOGIN Tin
WITH PASSWORD = 'TIN'
create user tin for login Tin

Create ROLE quanly
Create ROLE thungan

EXEC sp_addrolemember 'quanly','Vu'
exec sp_addrolemember 'thungan','Thaingu'
exec sp_addrolemember 'thungan','Tin'


GRANT  SELECT, INSERT, UPDATE, DELETE ON NHANVIEN to quanly with grant option
GRANT  SELECT, INSERT, UPDATE, DELETE ON MENU to quanly with grant option
GRANT  SELECT, INSERT, UPDATE, DELETE ON LOAIHANG to quanly with grant option
GRANT  SELECT, INSERT, UPDATE, DELETE ON CHUCVU to quanly with grant option
GRANT  SELECT, INSERT, UPDATE, DELETE ON THANHVIEN to quanly with grant option
GRANT  SELECT, INSERT, UPDATE, DELETE ON PHONG to quanly with grant option
GRANT  SELECT, INSERT, UPDATE, DELETE ON MAYKHACH to quanly with grant option

GRANT  SELECT ON NHANVIEN to thungan
GRANT  SELECT ON MENU to thungan
GRANT  SELECT ON LOAIHANG to thungan
GRANT  SELECT ON CHUCVU to thungan
GRANT  SELECT,INSERT, UPDATE, DELETE ON THANHVIEN to thungan
GRANT  SELECT ON PHONG to thungan
GRANT  SELECT ON MAYKHACH to thungan
/*
UPDATE THANHVIEN
SET SOTIENHIENCO = SOTIENHIENCO + inserted.SOTIEN
FROM THANHVIEN JOIN inserted ON THANHVIEN.MATAIKHOAN = inserted.MATAIKHOAN
*/
CREATE LOGIN Vu
WITH PASSWORD = 'VU'
create user vu for login Vu

CREATE LOGIN Thaingu
WITH PASSWORD = 'THAINGU'
create user thaingu for login Thaingu

CREATE LOGIN Tin
WITH PASSWORD = 'TIN'
create user tin for login Tin

Create ROLE quanly
Create ROLE thungan

EXEC sp_addrolemember 'quanly','Vu'
exec sp_addrolemember 'thungan','Thaingu'
exec sp_addrolemember 'thungan','Tin'

GRANT ALTER ANY DATABASE, VIEW ANY DEFINITION TO quanly;



/*select mk.MAMT as [Mã Máy Tính], mk.TENMAYTINH as [Tên Máy tính], tv.MATAIKHOAN as[Mã tài khoản], tv.TENTAIKHOAN as[Tên tài khoản],GIOBATDAU as[Giờ bắt đầu], GIOKETTHUC as[Giờ kết thúc ] from CTSUDUNG ct join MAYKHACH mk on ct.MAMT=mk.MAMT join THANHVIEN tv on tv.MATAIKHOAN = ct.MATAIKHOAN
where mk.MAMT like '%%' or  mk.TENMAYTINH like '%%' or  tv.MATAIKHOAN like '%%' or  tv.TENTAIKHOAN like '%%' or  GIOBATDAU like '%%' or  GIOKETTHUC like '%%' 

select FORMAT(THOIGIANNAPTIEN, 'yyyy-MM-dd HH:mm:ss')as [Thời gian] ,nv.TEN as [Người thu],nt.SOTIEN as [Số tiền] from NAPTIEN nt join NHANVIEN nv on nt.MANV=nv.MANV   
ORDER BY THOIGIANNAPTIEN ASC;

select Tenhang, lh.Tenloaihang,SOLUONGTON AS [Số lượng còn],DVT, Dongia from MENU mn join LOAIHANG lh on mn.MALOAIHANG = lh.MALOAIHANG where LH.MALOAIHANG='ML01' and (TENHANG like N'%%' or SOLUONGTON like '%%' or DVT like '%%' or DONGIA like '%%')

update CTHOADON
set MAHD='', MAHANG='', SOLUONG='',MUCGIAMGIA=''
where MAHD='' and MAHANG=''

select ct.MAHD as[Mã hóa đơn],m.TENHANG as[Tên hàng], SOLUONG as[Số lượng], MUCGIAMGIA as[Giảm giá]
from CTHOADON ct join MENU m on ct.MAHANG=m.MAHANG
where ct.MAHD like '%%' or m.TENHANG like '%%' or SOLUONG like '%%' or MUCGIAMGIA like '%%'

select hd.MAHD as[Mã hóa đơn],mk.TENMAYTINH as[Tên máy tính],nv.HO +' '+nv.TEN as[Tên nhân viên phụ trách], TRANGTHAITT as[Trạng thái thanh toán], Format(NGAY, 'dd-MM-yyyy HH:mm:ss') as[Ngày lập]
FROM HOADON hd join NHANVIEN nv on hd.MANV=nv.MANV join MAYKHACH mk on mk.MAMT=hd.MAMT 
where hd.MAHD like '%%' or mk.TENMAYTINH like N'% %' or nv.HO +' '+nv.TEN like N'%%' or TRANGTHAITT like '%%' or Format(NGAY, 'dd-MM-yyyy HH:mm:ss') like '%%' 

select MAMT as[Mã máy tính],TENMAYTINH as[Tên máy tính], TRANGTHAI as[Trạng thái máy] ,p.TENPHONG as[Tên phòng] from MayKhach mk join PHONG p on p.MAPHONG=mk.MAPHONG where MAMT like '%%' or TENMAYTINH like '%%' or TRANGTHAI like '%%' or p.TENPHONG like '%%' 

update HOADON
set TRANGTHAITT='Da thanh toan'
FROM HOADON hd join MAYKHACH mk on mk.MAMT = hd.MAMT 
where TENMAYTINH = ''*/