package com.laptrinhjavaweb.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.model.Quyen;
import com.laptrinhjavaweb.model.TaiKhoan;
import com.laptrinhjavaweb.model.ThongtinTaikhoan;
import com.laptrinhjavaweb.repository.TaiKhoanRepository;
import com.laptrinhjavaweb.repository.ThongtinTaiKhoanRepository;
import com.laptrinhjavaweb.security.MyUser;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private TaiKhoanRepository userRepository;
	@Autowired
	private ThongtinTaiKhoanRepository tttkRepository;

	@Override
	public UserDetails loadUserByUsername(String tendangnhap) throws UsernameNotFoundException {
		TaiKhoan userEntity = userRepository.findOneByTendangnhapAndActive(tendangnhap, SystemConstant.ACTIVE_STATUS);
		
		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (Quyen role: userEntity.getQuyens()) {
			authorities.add(new SimpleGrantedAuthority(role.getTenquyen()));
		}
		System.out.println(userEntity.getTendangnhap()+ " "+userEntity.getMatkhau());
		MyUser myUser = new MyUser(userEntity.getTendangnhap(), userEntity.getMatkhau(), 
							true, true, true, true, authorities);
		ThongtinTaikhoan ttTaiKhoan = tttkRepository.findOne(userEntity.getId());
		myUser.setFullName(ttTaiKhoan.getHoten());
		System.out.println(myUser.getUsername()+ " "+myUser.getPassword());

		return myUser;
	}

}
