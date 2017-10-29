package spring.model.team;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class TeamTest {

	public static void main(String[] args) {
		Resource rs = new ClassPathResource("META-INF/blog.xml");
		BeanFactory factory = new XmlBeanFactory(rs);
		TeamDAO dao = (TeamDAO)factory.getBean("tdao");
		
		//create(dao);
		//list(dao);
		//total(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		
	}


	private static void delete(TeamDAO dao) {
		if(dao.delete(8)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void update(TeamDAO dao) {
		TeamDTO dto = new TeamDTO();
		dto.setTeamno(9);
		dto.setAddress1("서울");
		dto.setAddress2("강동구");
		dto.setZipcode("12345");
		dto.setPhone("010-3344-9876");
		dto.setSkill("java");
		dto.setHobby("영화");
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void create(TeamDAO dao) {
		TeamDTO dto = new TeamDTO();
		dto.setName("김준면");
		dto.setGender("남자");
		dto.setAddress1("인천시 남동구");
		dto.setAddress2("용현동");
		dto.setPhone("010-1343-1234");
		dto.setZipcode("23423");
		dto.setSkill("java");
		dto.setHobby("영화");
		dto.setFilename("member.jpg");
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
		
	}

	private static void read(TeamDAO dao) {
		TeamDTO dto = dao.read(6);
		p(dto);
	}

	private static void total(TeamDAO dao) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("col", "");
		map.put("word", "");
		p("레코드 갯수 : "+dao.total(map));
		
	}
	private static void list(TeamDAO dao) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sno", 1);
		map.put("eno", 5);
		map.put("col", "");
		map.put("word", "");
		
		List<TeamDTO> list = dao.list(map);
		Iterator<TeamDTO> iter = list.iterator();
		while(iter.hasNext()) {
			TeamDTO dto = iter.next();
			p(dto);
			p("===================");
		}
	}
	private static void p(String str) {
		System.out.println(str);
	}
	private static void p(TeamDTO dto) {
		System.out.println("번 호 : "+dto.getTeamno());
		System.out.println("이 름 : "+dto.getName());
		System.out.println("성 별 : "+dto.getGender());
		System.out.println("핸드폰번호 : "+dto.getPhone());
		System.out.println("스 킬 : "+dto.getSkill());
		System.out.println("파일이름 : "+dto.getFilename());
		System.out.println("우편번호 : "+dto.getZipcode());
		System.out.println("주 소 : "+dto.getAddress1());
		System.out.println("상세주소 : "+dto.getAddress2());
		System.out.println("취미 : "+dto.getHobby());
		
	}
}
