package com.spring.seed.service;


import java.util.List;
import java.util.Map;

import com.spring.seed.vo.SeedVO;

public interface SeedService {

	public boolean create(SeedVO vo) throws Exception;

	public int total(Map<String, Object> map) throws Exception;

	public List<SeedVO> list(Map<String, Object> map) throws Exception;

}
