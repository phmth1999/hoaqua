package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.model.SanPham;

@Repository()
public interface SanPhamRepository extends JpaRepository<SanPham, Long> {
	
	public SanPham findByTensanpham(String tensanpham);
	@Query("SELECT tensanpham FROM SanPham where tensanpham like %:keyword%")
	public List<String> autocompletesearch(@Param("keyword") String keyword);
	 @Query(value = "SELECT c FROM SanPham c WHERE c.tensanpham LIKE :keyword")
	public List<SanPham> search(@Param("keyword") String keyword);
}
