package com.laptrinhjavaweb.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.model.ThongtinTaikhoan;


public interface ThongtinTaikhoanRepository extends JpaRepository<ThongtinTaikhoan, Long>{
	ThongtinTaikhoan findOne(long id);
}
