package spring.model.image;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ImageTest {

	public static void main(String[] args) {
		Resource rs = new ClassPathResource("META-INF/blog.xml");
		BeanFactory factory = new XmlBeanFactory(rs);
		ImageDAO dao = (ImageDAO)factory.getBean("idao");
		
//		list(dao);
//		total(dao);
//		read(dao);
//		create(dao);
//		update(dao);
//		delete(dao);
		passwdCheck(dao);
		//getRefnum(dao);
//		upViewcnt(dao);
		
	}

	

	private static void getRefnum(ImageDAO dao) {
		if(dao.getRefnum(10)) {
			p("부모글이 존재하므로 삭제불가");
		}else {
			p("삭제가능!");
		}
		
	}

	private static void passwdCheck(ImageDAO dao) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("imageno", 1);
		map.put("passwd","123");
		if(dao.passwdCheck(map)){
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void delete(ImageDAO dao) {
		if(dao.delete(2)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void update(ImageDAO dao) {
		ImageDTO dto = new ImageDTO();
		dto.setPname("김민지");
		dto.setTitle("수정수정");
		dto.setContent("수정테스트");
		dto.setImageno(3);
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void create(ImageDAO dao) {
		ImageDTO dto = new ImageDTO();
		dto.setFname("bb.jpg");
		dto.setPname("도경수");
		dto.setTitle("제목테스트");
		dto.setContent("ㅇㄴㅎ새 ㄱㄴㅇㄴㅇㄹ");
		dto.setPasswd("123");
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void read(ImageDAO dao) {
		ImageDTO dto = dao.read(1);
		p(dto);
	}

	private static void total(ImageDAO dao) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("col", "");
		map.put("word", "");
		p("레코드 갯수 : "+dao.total(map));
		
	}
	private static void list(ImageDAO dao) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sno", 1);
		map.put("eno", 5);
		map.put("col", "");
		map.put("word", "");
		
		List<ImageDTO> list = dao.list(map);
		Iterator<ImageDTO> iter = list.iterator();
		while(iter.hasNext()) {
			ImageDTO dto = iter.next();
			p(dto);
			p("===================");
		}
	}
	private static void p(String str) {
		System.out.println(str);
	}
	private static void p(ImageDTO dto) {
		System.out.println("번 호 : "+dto.getImageno());
		System.out.println("이 름 : "+dto.getPname());
		System.out.println("제 목 : "+dto.getTitle());
		System.out.println("내 용 : "+dto.getContent());
		System.out.println("파일이름 : "+dto.getFname());
		System.out.println("등록날짜 : "+dto.getWdate());
		System.out.println("비밀번호 : "+dto.getPasswd());
		System.out.println("grpno :"+dto.getGrpno());
		System.out.println("indent : "+dto.getIndent());
		System.out.println("ansnum : "+dto.getAnsnum());
		System.out.println("refnum : "+dto.getRefnum());
		
	}
}
