package spring.model.image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;

@Repository
public class ImageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	public Map readImg(int imageno){
		
		return mybatis.selectOne("image.readImg", imageno);
	}
	public List<ImageDTO> list(Map<String,Object> map) {
		
		return mybatis.selectList("image.list", map);
	}
	public int total(Map<String,Object> map){
		
		return mybatis.selectOne("image.total", map);
	}
	public boolean create(ImageDTO dto){
		
		return mybatis.insert("image.create", dto)>0;
	}
	
	public boolean passwdCheck(Map map){
		
		return (Integer)mybatis.selectOne("image.passwdCheck", map)>0;
	}
	
	public boolean updateFile(Map map) { // 아이디와 fname 2개 넣을것. 2개 이상은 무조건 맵에
		
		return mybatis.update("image.updateFile", map)>0;
	}
	public boolean replyCreate(ImageDTO dto){
		return mybatis.insert("image.replyCreate", dto)>0;
	}
	
	public ImageDTO replyRead(int imageno){
		
		return mybatis.selectOne("image.replyRead", imageno);
	}
	public void upAnsnum(Map map){
		mybatis.update("image.upAnsnum",map);
	}
	
	
	
	public boolean getRefnum(int imageno){
		
		return (Integer)mybatis.selectOne("image.getRefnum", imageno)>0;
	}
	//---------------------------------------re
	
	
	public boolean delete(int imageno) {
		
		return mybatis.delete("image.delete", imageno)>0;
	}
	
	public boolean update(ImageDTO dto) {
		
		return mybatis.update("image.update", dto)>0;
	}
	
	public ImageDTO read(int imageno) {
		
		return mybatis.selectOne("image.read", imageno);
	}
	

}
