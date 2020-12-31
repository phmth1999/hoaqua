package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.model.ThongtinTaikhoan;


public interface ThongtinTaiKhoanRepository extends JpaRepository<ThongtinTaikhoan, Long>{
	ThongtinTaikhoan findOne(long id);
}
