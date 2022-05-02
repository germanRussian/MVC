package service;

import domain.LoginDTO;
import mapper.LoginMapper;

public class LoginServiceImpl implements LoginService {

	public boolean read(LoginDTO dto) {
		// TODO Auto-generated method stub
		return new LoginMapper().read(dto);
	}

}
