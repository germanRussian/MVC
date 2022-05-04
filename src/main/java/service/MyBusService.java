package service;

import domain.LoginVO;
import domain.MyPageDTO;

public interface MyBusService {
	public LoginVO read(MyPageDTO dto);
}
