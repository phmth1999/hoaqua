package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.model.SanPham;
import com.laptrinhjavaweb.repository.SanPhamRepository;

@Service
public class ProductService {
	@Autowired
	private SanPhamRepository sanphamRepository;

	public void save(SanPham sanpham) {
		sanphamRepository.save(sanpham);
	}

	public List<SanPham> listAll() {
		return (List<SanPham>) sanphamRepository.findAll();
	}

	public SanPham get(Long id) {
		return sanphamRepository.findOne(id);
	}

	public void delete(Long id) {
		sanphamRepository.delete(id);
	}

	public int getTotalItem() {
		return (int) sanphamRepository.count();
	}

	public String findByTensanpham(String tensanpham) {
		SanPham entity = sanphamRepository.findByTensanpham(tensanpham);
		return (entity == null) ? "Unique" : "Duplicate";
	}
	public List<String> autocompletesearch(String keyword) {
		return sanphamRepository.autocompletesearch(keyword);
	}
	public List<SanPham> search(String keyword) {
		return sanphamRepository.search(keyword);
	}
}
