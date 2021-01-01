package com.laptrinhjavaweb.service;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.dao.TaiKhoanRepository;
import com.laptrinhjavaweb.dao.ThongtinTaikhoanRepository;
import com.laptrinhjavaweb.model.Quyen;
import com.laptrinhjavaweb.model.TaiKhoan;
import com.laptrinhjavaweb.model.ThongtinTaikhoan;
import com.laptrinhjavaweb.security.MyUser;

@Service
public class TaiKhoanService implements UserDetailsService {

	@Autowired
	private TaiKhoanRepository tkRepository;

	@Autowired
	private ThongtinTaikhoanRepository tttkRepository;

	@Override
	public UserDetails loadUserByUsername(String tendangnhap) throws UsernameNotFoundException {
		TaiKhoan tk = tkRepository.findOneByTendangnhapAndActive(tendangnhap, 1);
		if (tk == null) {
			throw new UsernameNotFoundException("Tai khoan khong ton tai");
		}
		//
		Set<GrantedAuthority> dsquyen = new HashSet<GrantedAuthority>();
		for (Quyen quyen : tk.getQuyens()) {
			dsquyen.add(new SimpleGrantedAuthority(quyen.getTenquyen()));
		}
		//
		MyUser myUser = new MyUser(tk.getTendangnhap(), tk.getMatkhau(), true, true, true, true, dsquyen);
		ThongtinTaikhoan ttTaiKhoan = tttkRepository.findOne(tk.getId());
		myUser.setFullName(ttTaiKhoan.getHoten());

		return myUser;
	}


	}

