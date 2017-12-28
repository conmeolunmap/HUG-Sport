SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `jestersport` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `jestersport` ;

-- -----------------------------------------------------
-- Table `jestersport`.`nhasanxuat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jestersport`.`nhasanxuat` ;

CREATE  TABLE IF NOT EXISTS `jestersport`.`nhasanxuat` (
  `id_nsx` INT NOT NULL AUTO_INCREMENT ,
  `ten_nsx` VARCHAR(50) NOT NULL ,
  `quocgia_nsx` VARCHAR(50) NOT NULL ,
  `mota_nsx` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_nsx`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jestersport`.`loaisanpham`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jestersport`.`loaisanpham` ;

CREATE  TABLE IF NOT EXISTS `jestersport`.`loaisanpham` (
  `id_lsp` INT NOT NULL AUTO_INCREMENT ,
  `ten_lsp` VARCHAR(50) NOT NULL ,
  `mota_lsp` VARCHAR(50) NULL ,
  PRIMARY KEY (`id_lsp`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jestersport`.`khuyenmai`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jestersport`.`khuyenmai` ;

CREATE  TABLE IF NOT EXISTS `jestersport`.`khuyenmai` (
  `id_km` INT NOT NULL AUTO_INCREMENT ,
  `ten_km` VARCHAR(50) NOT NULL ,
  `mota_km` VARCHAR(255) NULL ,
  `ngaybatdau_km` DATE NOT NULL ,
  `ngayketthuc_km` DATE NOT NULL ,
  `giatriphantram_km` INT NULL ,
  `giatrigiamgia_km` DECIMAL(12,2) NULL ,
  PRIMARY KEY (`id_km`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jestersport`.`sanpham`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jestersport`.`sanpham` ;

CREATE  TABLE IF NOT EXISTS `jestersport`.`sanpham` (
  `id_sp` VARCHAR(50) NOT NULL ,
  `ten_sp` VARCHAR(100) NOT NULL ,
  `gia_sp` DECIMAL(12,2) NOT NULL ,
  `giacu_sp` DECIMAL(12,2) NOT NULL ,
  `trongluong_sp` FLOAT NULL ,
  `size_sp` VARCHAR(5) NULL ,
  `soluong_sp` INT NOT NULL ,
  `nhasanxuat_id_nsx` INT NOT NULL ,
  `khuyenmai_id_km` INT NOT NULL ,
  `loaisanpham_id_lsp` INT NOT NULL ,
  `nhasanxuat_id_nsx1` INT NOT NULL ,
  `khuyenmai_id_km1` INT NOT NULL ,
  PRIMARY KEY (`id_sp`, `nhasanxuat_id_nsx`, `khuyenmai_id_km`) ,
  CONSTRAINT `fk_sanpham_loaisanpham1`
    FOREIGN KEY (`loaisanpham_id_lsp` )
    REFERENCES `jestersport`.`loaisanpham` (`id_lsp` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sanpham_nhasanxuat1`
    FOREIGN KEY (`nhasanxuat_id_nsx1` )
    REFERENCES `jestersport`.`nhasanxuat` (`id_nsx` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sanpham_khuyenmai1`
    FOREIGN KEY (`khuyenmai_id_km1` )
    REFERENCES `jestersport`.`khuyenmai` (`id_km` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_sanpham_loaisanpham1_idx` ON `jestersport`.`sanpham` (`loaisanpham_id_lsp` ASC) ;

CREATE INDEX `fk_sanpham_nhasanxuat1_idx` ON `jestersport`.`sanpham` (`nhasanxuat_id_nsx1` ASC) ;

CREATE INDEX `fk_sanpham_khuyenmai1_idx` ON `jestersport`.`sanpham` (`khuyenmai_id_km1` ASC) ;


-- -----------------------------------------------------
-- Table `jestersport`.`hinhsanpham`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jestersport`.`hinhsanpham` ;

CREATE  TABLE IF NOT EXISTS `jestersport`.`hinhsanpham` (
  `id_hsp` INT NOT NULL AUTO_INCREMENT ,
  `tenfile_hsp` VARCHAR(255) NOT NULL ,
  `sanpham_id_sp` VARCHAR(50) NOT NULL ,
  `sanpham_nhasanxuat_id_nsx` INT NOT NULL ,
  `sanpham_khuyenmai_id_km` INT NOT NULL ,
  PRIMARY KEY (`id_hsp`) ,
  CONSTRAINT `fk_hinhsanpham_sanpham1`
    FOREIGN KEY (`sanpham_id_sp` , `sanpham_nhasanxuat_id_nsx` , `sanpham_khuyenmai_id_km` )
    REFERENCES `jestersport`.`sanpham` (`id_sp` , `nhasanxuat_id_nsx` , `khuyenmai_id_km` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_hinhsanpham_sanpham1_idx` ON `jestersport`.`hinhsanpham` (`sanpham_id_sp` ASC, `sanpham_nhasanxuat_id_nsx` ASC, `sanpham_khuyenmai_id_km` ASC) ;


-- -----------------------------------------------------
-- Table `jestersport`.`hinhthucthanhtoan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jestersport`.`hinhthucthanhtoan` ;

CREATE  TABLE IF NOT EXISTS `jestersport`.`hinhthucthanhtoan` (
  `id_httt` INT NOT NULL AUTO_INCREMENT ,
  `ten_httt` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`id_httt`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jestersport`.`taikhoan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jestersport`.`taikhoan` ;

CREATE  TABLE IF NOT EXISTS `jestersport`.`taikhoan` (
  `username_kh` VARCHAR(50) NOT NULL ,
  `pass_kh` VARCHAR(255) NOT NULL ,
  `ten_tk` VARCHAR(50) NOT NULL ,
  `gioitinh_tk` TINYINT(1) NOT NULL ,
  `diachi_tk` VARCHAR(100) NOT NULL ,
  `sodienthoai_tk` VARCHAR(15) NULL ,
  `email_tk` VARCHAR(50) NULL ,
  `ngaysinh_tk` DATE NOT NULL ,
  `cmnd_tk` VARCHAR(15) NOT NULL ,
  `makichhoat_tk` VARCHAR(50) NULL ,
  `trangthai_tk` INT NOT NULL ,
  `loaitk` TINYINT NOT NULL ,
  PRIMARY KEY (`username_kh`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jestersport`.`hoadon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jestersport`.`hoadon` ;

CREATE  TABLE IF NOT EXISTS `jestersport`.`hoadon` (
  `id_hd` INT NOT NULL AUTO_INCREMENT ,
  `ngaylap_hd` DATE NOT NULL ,
  `ngaygiao_hd` DATE NOT NULL ,
  `noigiao_hd` VARCHAR(255) NOT NULL ,
  `trangthaithanhtoan_hd` INT NULL ,
  `taikhoan_username_kh` VARCHAR(50) NOT NULL ,
  `hinhthucthanhtoan_id_httt` INT NOT NULL ,
  `taikhoan_username_kh1` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`id_hd`, `taikhoan_username_kh`, `hinhthucthanhtoan_id_httt`) ,
  CONSTRAINT `fk_hoadon_hinhthucthanhtoan1`
    FOREIGN KEY (`hinhthucthanhtoan_id_httt` )
    REFERENCES `jestersport`.`hinhthucthanhtoan` (`id_httt` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hoadon_taikhoan1`
    FOREIGN KEY (`taikhoan_username_kh1` )
    REFERENCES `jestersport`.`taikhoan` (`username_kh` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_hoadon_hinhthucthanhtoan1_idx` ON `jestersport`.`hoadon` (`hinhthucthanhtoan_id_httt` ASC) ;

CREATE INDEX `fk_hoadon_taikhoan1_idx` ON `jestersport`.`hoadon` (`taikhoan_username_kh1` ASC) ;


-- -----------------------------------------------------
-- Table `jestersport`.`sanpham_hoadon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jestersport`.`sanpham_hoadon` ;

CREATE  TABLE IF NOT EXISTS `jestersport`.`sanpham_hoadon` (
  `hoadon_id_hd` INT NOT NULL ,
  `hoadon_taikhoan_username_kh` VARCHAR(50) NOT NULL ,
  `sanpham_id_sp` VARCHAR(50) NOT NULL ,
  `sanpham_nhasanxuat_id_nsx` INT NOT NULL ,
  `sanpham_khuyenmai_id_km` INT NOT NULL ,
  PRIMARY KEY (`hoadon_id_hd`, `hoadon_taikhoan_username_kh`, `sanpham_id_sp`, `sanpham_nhasanxuat_id_nsx`, `sanpham_khuyenmai_id_km`) ,
  CONSTRAINT `fk_sanpham_hoadon_hoadon1`
    FOREIGN KEY (`hoadon_id_hd` , `hoadon_taikhoan_username_kh` )
    REFERENCES `jestersport`.`hoadon` (`id_hd` , `taikhoan_username_kh` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sanpham_hoadon_sanpham1`
    FOREIGN KEY (`sanpham_id_sp` , `sanpham_nhasanxuat_id_nsx` , `sanpham_khuyenmai_id_km` )
    REFERENCES `jestersport`.`sanpham` (`id_sp` , `nhasanxuat_id_nsx` , `khuyenmai_id_km` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_sanpham_hoadon_sanpham1_idx` ON `jestersport`.`sanpham_hoadon` (`sanpham_id_sp` ASC, `sanpham_nhasanxuat_id_nsx` ASC, `sanpham_khuyenmai_id_km` ASC) ;


-- -----------------------------------------------------
-- Table `jestersport`.`chudegopy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jestersport`.`chudegopy` ;

CREATE  TABLE IF NOT EXISTS `jestersport`.`chudegopy` (
  `id_cd` INT NOT NULL AUTO_INCREMENT ,
  `ten_cd` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_cd`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jestersport`.`gopy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jestersport`.`gopy` ;

CREATE  TABLE IF NOT EXISTS `jestersport`.`gopy` (
  `id_gy` INT NOT NULL AUTO_INCREMENT ,
  `ten_gy` VARCHAR(45) NOT NULL ,
  `email_gy` VARCHAR(45) NULL ,
  `diachi_gy` VARCHAR(45) NULL ,
  `sdt_gy` VARCHAR(13) NOT NULL ,
  `noidung_gy` TEXT NOT NULL ,
  `ngay_gy` DATE NOT NULL ,
  `chudegopy_id_cd` INT NOT NULL ,
  PRIMARY KEY (`id_gy`) ,
  CONSTRAINT `fk_gopy_chudegopy1`
    FOREIGN KEY (`chudegopy_id_cd` )
    REFERENCES `jestersport`.`chudegopy` (`id_cd` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_gopy_chudegopy1_idx` ON `jestersport`.`gopy` (`chudegopy_id_cd` ASC) ;

USE `jestersport` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
