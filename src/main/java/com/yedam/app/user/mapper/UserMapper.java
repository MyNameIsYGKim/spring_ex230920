package com.yedam.app.user.mapper;

import com.yedam.app.user.service.UserVO;

public interface UserMapper {
	public UserVO getUser(String username);
}
