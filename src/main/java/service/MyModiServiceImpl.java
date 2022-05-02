package service;


import domain.LoginVO;

import mapper.MyModiMapper;


public class MyModiServiceImpl implements MyModiService {

	@Override
	public LoginVO update(LoginVO dto) {
		// TODO Auto-generated method stub
		return new MyModiMapper().update(dto);
	}


}
