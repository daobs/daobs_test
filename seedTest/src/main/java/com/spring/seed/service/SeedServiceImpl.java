package com.spring.seed.service;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.seed.dao.SeedDAO;
import com.spring.seed.vo.SeedVO;

@Service("SeedService")
public class SeedServiceImpl implements SeedService {
	
	@Resource(name = "SeedDAO")
	SeedDAO dao;
	
	public boolean create(SeedVO vo) throws Exception {
		return dao.create(vo);
	}
	
	public int total(Map<String, Object> map) {
		return dao.total(map);
	}

	public List<SeedVO> list(Map<String, Object> map){
		return dao.list(map);
	}
	

}
