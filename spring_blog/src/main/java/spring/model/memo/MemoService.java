package spring.model.memo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.memo.MemoDAO;
import spring.model.memo.MemoDTO;
import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;
@Service
public class MemoService {
	@Autowired
	private MemoDAO dao;
	
	public boolean reply(MemoDTO dto) {
		boolean flag = false;
		try {
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("grpno", dto.getGrpno());
			map.put("ansnum", dto.getAnsnum());
			dao.upAnsnum(map);
			flag = dao.replyCreate(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return flag;
	}

}
