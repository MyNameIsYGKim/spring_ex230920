package com.yedam.app.user.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class UserVO implements UserDetails {
	
	private String id;
	private String pwd;
	private String role;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<>();
		auth.add(new SimpleGrantedAuthority(this.role));
		return auth;
	}

	@Override
	public String getPassword() {
		return this.pwd;
	}

	@Override
	public String getUsername() {
		return this.id;
	}

	@Override
	public boolean isAccountNonExpired() { // 계정 만료됐는지
		return true;
	}

	@Override
	public boolean isAccountNonLocked() { // 계정 잠겼는지
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() { // 비밀번호 만료됐는지
		return true;
	}

	@Override
	public boolean isEnabled() { // 대상인지
		return true;
	}

}
