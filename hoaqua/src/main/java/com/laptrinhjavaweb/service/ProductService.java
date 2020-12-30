package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.Product;
import com.laptrinhjavaweb.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;

	public void save(Product product) {
		productRepository.save(product);
	}

	public List<Product> listAll() {
		return (List<Product>) productRepository.findAll();
	}

	public Product get(Long id) {
		return productRepository.findOne(id);
	}

	public void delete(Long id) {
		productRepository.delete(id);
	}

	public int getTotalItem() {
		return (int) productRepository.count();
	}

	public String findByname(String name) {
		Product entity = productRepository.findByname(name);
		return (entity == null) ? "Unique" : "Duplicate";
	}
	public List<String> autocompletesearch(String keyword) {
		return productRepository.autocompletesearch(keyword);
	}
	public List<Product> search(String keyword) {
		return productRepository.search(keyword);
	}
}
