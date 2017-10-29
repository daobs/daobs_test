package spring.model.bbs;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BbsDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public int total(Map map){
		return mybatis.selectOne("bbs.total", map);
		}
	
	public boolean getRefnum(int bbsno){
		boolean flag = false;
		int cnt = mybatis.selectOne("bbs.getRefnum", bbsno);
		System.out.println(mybatis.selectOne("bbs.getRefnum", bbsno)+":::bbsdao getrefnum");
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}
	
	public List<BbsDTO> list(Map map) {
		return mybatis.selectList("bbs.list", map);
	}
	public BbsDTO read(int bbsno) {
		return mybatis.selectOne("bbs.read", bbsno);
	}

	public boolean create(BbsDTO dto) {
		boolean flag = false;
		int cnt = mybatis.insert("bbs.create",dto);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean delete(int bbsno) {
		boolean flag = false;
		int cnt = mybatis.delete("bbs.delete", bbsno);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean update(BbsDTO dto) { 
		boolean flag = false;
		int cnt = mybatis.update("bbs.update",dto);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean passwdCheck(Map map) {
		boolean flag = false;
		int cnt = mybatis.selectOne("bbs.passwdCheck", map);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public void upViewcnt(int bbsno) {
		mybatis.update("bbs.upViewcnt",bbsno);
	}

	public BbsDTO replyRead(int bbsno) {
		
		return mybatis.selectOne("bbs.replyRead", bbsno);
	}

	public boolean replyCreate(BbsDTO dto){
		boolean flag = false;
		int cnt = mybatis.insert("bbs.replyCreate", dto);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public void upAnsnum(Map map) {
		mybatis.update("bbs.upAnsnum", map);
	}
}