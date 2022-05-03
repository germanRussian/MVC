package service;

import domain.LoginVO;
import domain.MyPageDTO;

public interface MyPageService {

	public abstract LoginVO read(MyPageDTO dto);
	
	public void update(LoginVO vo);
}
