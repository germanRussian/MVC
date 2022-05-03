package service;

import java.util.Collection;

import domain.ListInfos;
import domain.UseHistoryVO;
import mapper.ListMapper;

public class ListServiceImpl implements ListService {

	@Override
	public ListInfos read(String uid) {
		
		Collection<UseHistoryVO> goList = new ListMapper().read(uid, "등교");
		Collection<UseHistoryVO> backList = new ListMapper().read(uid, "하교");
		
		ListInfos listInfos = new ListInfos();
		listInfos.setGoList(goList);
		listInfos.setBackList(backList);
		
		return listInfos;
	}


}
