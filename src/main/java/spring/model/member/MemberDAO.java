package spring.model.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public boolean create(MemberVO vo) {
		return mybatis.insert("member.create", vo)>0;
	}

	public Object duplicateId(String id) {
		return (Integer)mybatis.selectOne("member.duplicateId", id)>0;
	}
	public Object duplicateEmail(String email) {
		return (Integer)mybatis.selectOne("member.duplicateEmail", email)>0;
	}
	public Object duplicate_UpEmail(Map map) {
		return (Integer)mybatis.selectOne("member.duplicate_UpEmail", map)>0;
	}
	public boolean loginCheck(Map map){
		return (Integer)mybatis.selectOne("member.loginCheck", map)>0;
	}
	public String getGrade(String id){
		return mybatis.selectOne("member.getGrade", id);
		}

	public MemberVO read(String id) {
		return mybatis.selectOne("member.read", id);
	}

	public boolean update(MemberVO vo) {
		return mybatis.update("member.update", vo)>0;
	}

	public boolean delete(String id) {
		return mybatis.delete("member.delete", id)>0;
	}

	public boolean passwdCheck(Map<String, Object> map) {
		return (Integer)mybatis.selectOne("member.passwdCheck", map)>0;
	}

	public String findId(Map map) {
		return mybatis.selectOne("member.findId", map);
		
	}

	public String findPw(Map<String, Object> map) {
		return mybatis.selectOne("member.findPw", map);
	}
	

}



