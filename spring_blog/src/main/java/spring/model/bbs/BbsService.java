package spring.model.bbs;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDTO;
@Service
public class BbsService {
	@Autowired
	private BbsDAO dao;
	
	@Autowired
	private ReplyDAO rdao;
	
	public void delete(int bbsno) throws Exception{
		rdao.bdelete(bbsno);
		dao.delete(bbsno);
	}
	public boolean reply(BbsDTO dto) throws Exception {
		boolean flag = false;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		
		dao.upAnsnum(map);
		flag = dao.replyCreate(dto);

		return flag;
	}
	
}
