package com.spring.seed.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.seed.vo.SeedVO;

@Repository("SeedDAO")
public class SeedDAOImpl implements SeedDAO {
	
	private SqlSessionTemplate mybatis;
	
	@Override
	public boolean create(SeedVO vo) {
		return mybatis.insert("seed.create", vo)>0;
	}

}
