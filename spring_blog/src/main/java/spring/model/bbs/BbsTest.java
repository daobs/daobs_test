package spring.model.bbs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class BbsTest {

	public static void main(String[] args) {
		Resource rs = new ClassPathResource("META-INF/blog.xml");
		BeanFactory factory = new XmlBeanFactory(rs);
		BbsDAO dao = (BbsDAO)factory.getBean("dao");
		
		//list(dao);
		//total(dao);
		//read(dao);
		//create(dao);
		//update(dao);
		//delete(dao);
		//passwdCheck(dao);
		//getRefnum(dao);
		upViewcnt(dao);
		
	}

	private static void upViewcnt(BbsDAO dao) {
		BbsDTO dto = dao.read(11);
		p("11의 조회수 : "+dto.getViewcnt());
		dao.upViewcnt(11);
		p("11조회수 증가!!");
		dto = dao.read(11);
		
		
	}

	private static void getRefnum(BbsDAO dao) {
		if(dao.getRefnum(10)) {
			p("부모글이 존재하므로 삭제불가");
		}else {
			p("삭제가능!");
		}
		
	}

	private static void passwdCheck(BbsDAO dao) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bbsno", 10);
		map.put("passwd","123");
		if(dao.passwdCheck(map)){
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void delete(BbsDAO dao) {
		if(dao.delete(12)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void update(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setBbsno(15);
		dto.setWname("김민지");
		dto.setTitle("수정수정");
		dto.setContent("수정테스트");
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("도경수");
		dto.setTitle("제목테스트");
		dto.setContent("ㅇㄴㅎ새 ㄱㄴㅇㄴㅇㄹ");
		dto.setPasswd("123");
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void read(BbsDAO dao) {
		BbsDTO dto = dao.read(10);
		p(dto);
	}

	private static void total(BbsDAO dao) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("col", "");
		map.put("word", "");
		p("레코드 갯수 : "+dao.total(map));
		
	}
	private static void list(BbsDAO dao) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sno", 1);
		map.put("eno", 5);
		map.put("col", "");
		map.put("word", "");
		
		List<BbsDTO> list = dao.list(map);
		Iterator<BbsDTO> iter = list.iterator();
		while(iter.hasNext()) {
			BbsDTO dto = iter.next();
			p(dto);
			p("===================");
		}
	}
	private static void p(String str) {
		System.out.println(str);
	}
	private static void p(BbsDTO dto) {
		System.out.println("번 호 : "+dto.getBbsno());
		System.out.println("이 름 : "+dto.getWname());
		System.out.println("제 목 : "+dto.getTitle());
		System.out.println("내 용 : "+dto.getContent());
		System.out.println("조회수 : "+dto.getViewcnt());
		System.out.println("등록날짜 : "+dto.getWdate());
		System.out.println("비밀번호 : "+dto.getPasswd());
		
	}
}
