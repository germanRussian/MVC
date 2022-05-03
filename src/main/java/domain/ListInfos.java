package domain;

import java.util.Collection;

public class ListInfos {

	private Collection<UseHistoryVO> goList;
	private Collection<UseHistoryVO> backList;
	
	public Collection<UseHistoryVO> getGoList() {
		return goList;
	}
	public void setGoList(Collection<UseHistoryVO> goList) {
		this.goList = goList;
	}
	public Collection<UseHistoryVO> getBackList() {
		return backList;
	}
	public void setBackList(Collection<UseHistoryVO> backList) {
		this.backList = backList;
	}	

}
