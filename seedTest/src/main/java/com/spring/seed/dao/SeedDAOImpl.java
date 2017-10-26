package com.spring.seed.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.seed.vo.SeedVO;

@Repository("SeedDAO")
public class SeedDAOImpl implements SeedDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public boolean create(SeedVO vo) {
		return mybatis.insert("seed.create", vo)>0;
	}

	public int total(Map<String, Object> map) {
		return mybatis.selectOne("seed.total", map);
	}

	public List<SeedVO> list(Map<String, Object> map){
		return mybatis.selectList("seed.list", map);
	}
}
