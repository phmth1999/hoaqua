package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.Product;

@Repository("productRepository")
public interface ProductRepository extends JpaRepository<Product, Long> {
	
	public Product findByname(String name);
	@Query("SELECT name FROM Product where name like %:keyword%")
	public List<String> autocompletesearch(@Param("keyword") String keyword);
	 @Query(value = "SELECT c FROM Product c WHERE c.name LIKE :keyword")
	public List<Product> search(@Param("keyword") String keyword);
}
