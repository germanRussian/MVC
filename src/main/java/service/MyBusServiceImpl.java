package service;

import domain.LoginVO;
import domain.MyPageDTO;
import mapper.MyBusMapper;

public class MyBusServiceImpl implements MyBusService{

	@Override
	public LoginVO read(MyPageDTO dto) {
		// TODO Auto-generated method stub
		return new MyBusMapper().read(dto);
	}

	
	
}
