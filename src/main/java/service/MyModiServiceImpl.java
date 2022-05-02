package service;

import domain.LoginDTO;
import domain.LoginVO;
import domain.MyPageDTO;
import mapper.MyModiMapper;
import mapper.MyPageMapper;

public class MyModiServiceImpl implements MyModiService {

	@Override
	public LoginVO update(LoginVO dto) {
		// TODO Auto-generated method stub
		return new MyModiMapper().update(dto);
	}


}
