package service;

import java.util.Collection;

import domain.ListInfos;
import domain.UseHistoryVO;

public interface ListService {

	public ListInfos read(String uid);
}
