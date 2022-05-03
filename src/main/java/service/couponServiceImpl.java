package service;

import mapper.couponMapper;

public class couponServiceImpl implements couponService{

	@Override
	public String read(String uid) {
		// TODO Auto-generated method stub
		return new couponMapper().read(uid);
	}

	

}
