package spring.model.team;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeamDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	public boolean updateFile(Map map){
		boolean flag = false;
		int cnt = mybatis.update("team.updateFile", map);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}
	public List<TeamDTO> list(Map map){
		
		return mybatis.selectList("team.list", map);
	}
	
	public int total(Map map){
		return mybatis.selectOne("team.total", map);
	}
	
	public TeamDTO read(int teamno){
		return mybatis.selectOne("team.read", teamno);
		
	}
	public boolean create(TeamDTO dto){
		boolean flag = false;
		int cnt = mybatis.insert("team.create", dto);
		if(cnt > 0) {
			flag = true;
		}
		return flag; 
	}
	public boolean update(TeamDTO dto){
		boolean flag = false;
		int cnt = mybatis.update("team.update", dto);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}
	public boolean delete(int teamno){
		boolean flag = false;
		int cnt = mybatis.delete("team.delete", teamno);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}
}
