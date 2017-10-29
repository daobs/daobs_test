package spring.model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public String getGrade(String id){
		return mybatis.selectOne("member.getGrade", id);
		}
	
	public boolean loginCheck(Map map){
		
		return (Integer)mybatis.selectOne("member.loginCheck", map)>0;
		}
	
	public String getFname(String id){
		
		return mybatis.selectOne("member.getFname", id);
		}
	
	public boolean updatePw(Map map){
		return mybatis.update("member.updatePw", map)>0;
	}
	
	public boolean updateFile(Map map){
		return mybatis.update("member.updateFile", map)>0;
	}
	
	public MemberDTO read(String id) {
		return mybatis.selectOne("member.read", id);

	}
	public boolean update(MemberDTO dto) {
		return mybatis.update("member.update", dto)>0;
		}
	
	public boolean delete(String id) {
		return mybatis.delete("member.delete", id)>0;
	} 
	
	public int total(Map map){
		return mybatis.selectOne("member.total", map);
	}
		
	public List<MemberDTO> list(Map map) { 
		return mybatis.selectList("member.list", map); 
	} 
	
	public boolean create(MemberDTO dto){
		return mybatis.insert("member.create", dto)>0;
	}
	
	public boolean duplicateId(String id) {
		return (Integer)mybatis.selectOne("member.duplicateId", id)>0;
	}

	public boolean duplicateEmail(String email) {
		return (Integer)mybatis.selectOne("member.duplicateEmail", email)>0;
	}
}
