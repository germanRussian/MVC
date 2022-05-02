package service;

import domain.LoginVO;
import domain.MyPageDTO;
import mapper.MyPageMapper;

public class MyPageServiceImpl implements MyPageService {

	@Override
	public LoginVO read(MyPageDTO dto) {
		return new MyPageMapper().read(dto);
	}

}
