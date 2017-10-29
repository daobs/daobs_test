package spring.model.memo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class MemoTest {

	public static void main(String[] args) {
		Resource rs = new ClassPathResource("META-INF/blog.xml");
		BeanFactory factory = new XmlBeanFactory(rs);
		MemoDAO dao = (MemoDAO)factory.getBean("mdao");
		
		//list(dao);
		//total(dao);
		//read(dao);
		//create(dao);
		//update(dao);
		//delete(dao);
		//getRefnum(dao);
		upViewcnt(dao);
		
	}

	private static void upViewcnt(MemoDAO dao) {
		MemoDTO dto = dao.read(105);
		p("11의 조회수 : "+dto.getViewcnt());
		dao.upViewcnt(105);
		p("11조회수 증가!!");
		dto = dao.read(105);
		p(dto);
		
	}

	private static void getRefnum(MemoDAO dao) {
		if(dao.getRefnum(105)) {
			p("부모글이 존재하므로 삭제불가");
		}else {
			p("삭제가능!");
		}
		
	}

	private static void delete(MemoDAO dao) {
		int memono = 103;
		if(!dao.getRefnum(memono)) {
			if(dao.delete(memono)) {
				p("성공");
			}else {
				p("실패");
			}
		}else {
			System.out.println("답글존재하므로 삭제 x");
		}
		
		
	}

	private static void update(MemoDAO dao) {
		MemoDTO dto = new MemoDTO();
		dto.setMemono(103);
		dto.setTitle("수정수정");
		dto.setContent("수정테스트");
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void create(MemoDAO dao) {
		MemoDTO dto = new MemoDTO();
		dto.setTitle("제목테스트");
		dto.setContent("ㅇㄴㅎ새 ㄱㄴㅇㄴㅇㄹ");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void read(MemoDAO dao) {
		MemoDTO dto = dao.read(103);
		p(dto);
	}

	private static void total(MemoDAO dao) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("col", "");
		map.put("word", "");
		p("레코드 갯수 : "+dao.total(map));
		
	}
	private static void list(MemoDAO dao) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sno", 1);
		map.put("eno", 5);
		map.put("col", "");
		map.put("word", "");
		
		List<MemoDTO> list = dao.list(map);
		Iterator<MemoDTO> iter = list.iterator();
		while(iter.hasNext()) {
			MemoDTO dto = iter.next();
			p(dto);
			p("===================");
		}
	}
	private static void p(String str) {
		System.out.println(str);
	}
	private static void p(MemoDTO dto) {
		System.out.println("번 호 : "+dto.getMemono());
		System.out.println("제 목 : "+dto.getTitle());
		System.out.println("내 용 : "+dto.getContent());
		System.out.println("조회수 : "+dto.getViewcnt());
		System.out.println("등록날짜 : "+dto.getWdate());	
		System.out.println("grpno : "+dto.getGrpno());
		System.out.println("indent : "+dto.getIndent());
		System.out.println("ansnum : "+dto.getAnsnum());
	}
}
