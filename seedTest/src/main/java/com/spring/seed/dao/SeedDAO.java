package com.spring.seed.dao;



import java.util.List;
import java.util.Map;

import com.spring.seed.vo.SeedVO;


public interface SeedDAO {

	public boolean create(SeedVO vo) throws Exception;

	public int total(Map<String, Object> map);

	public List<SeedVO> list(Map<String, Object> map);
	

}
