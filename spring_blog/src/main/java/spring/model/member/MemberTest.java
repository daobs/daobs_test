package spring.model.member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class MemberTest {

	public static void main(String[] args) {
		Resource rs = new ClassPathResource("META-INF/blog.xml");
		BeanFactory factory = new XmlBeanFactory(rs);
		MemberDAO dao = (MemberDAO)factory.getBean("memdao");
		/*blog.xml 에 저장되어진 bean객체를 가져와서 factory에서 불러와서 선언된 객체들선언, 
		 * 선언되어진 dao중에 MemberDAO dao라는 객체에 memdao라는 bean객체에 저장되어진 DAO객체를 사용하겠다고 선언함 */
		
//		list(dao);
//		total(dao);
//		read(dao);
//		create(dao);
//		update(dao);
//		delete(dao);
//		getGrade(dao);
//		loginCheck(dao);
//		getFname(dao);
		
		
	}


	private static void getFname(MemberDAO dao) {
		String fname = dao.getFname("user1");
		p("파일 명 :"+fname);
	}


	private static void loginCheck(MemberDAO dao) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", "abc");
		map.put("passwd", "1234");
		if(dao.loginCheck(map)) {
			p("로그인 성공");
		}else {
			p("로그인 실패");
		}
		
	}


	private static void getGrade(MemberDAO dao) {
		String grade= dao.getGrade("abc");
		p("회원등급 : "+grade);
	}


	private static void delete(MemberDAO dao) {
		if(dao.delete("abc")) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void update(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		dto.setEmail("cba@email.com");
		dto.setTel("010-9879-3453");
		dto.setZipcode("45423");
		dto.setAddress1("서울시 광진구");
		dto.setAddress2("공진동");
		dto.setJob("A04");
		dto.setId("abc");
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		dto.setId("abc");
		dto.setPasswd("1234");
		dto.setMname("김김김");
		dto.setEmail("abc1@email.com");
		dto.setJob("A03");
		dto.setTel("010-3453-1232");
		dto.setZipcode("12345");
		dto.setAddress1("seoul");
		dto.setAddress2("sdf");
		dto.setFname("member.jpg");
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void read(MemberDAO dao) {
		MemberDTO dto = dao.read("user1");
		p(dto);
	}

	private static void total(MemberDAO dao) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("col", "");
		map.put("word", "");
		p("레코드 갯수 : "+dao.total(map));
		
	}
	private static void list(MemberDAO dao) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sno", 1);
		map.put("eno", 3);
		map.put("col", "");
		map.put("word", "");
		
		List<MemberDTO> list = dao.list(map);
		Iterator<MemberDTO> iter = list.iterator();
		while(iter.hasNext()) {
			MemberDTO dto = iter.next();
			p(dto);
			p("===================");
		}
	}
	private static void p(String str) {
		System.out.println(str);
	}
	private static void p(MemberDTO dto) {
		System.out.println("아이디 : "+dto.getId());
		System.out.println("비밀번호 : "+dto.getPasswd());
		System.out.println("이 름 : "+dto.getMname());
		System.out.println("전화번호 : "+dto.getTel());
		System.out.println("이메일 : "+dto.getEmail());
		System.out.println("주 소 : "+"("+dto.getZipcode()+")"+dto.getAddress1()+dto.getAddress2());
		System.out.println("직 업 : "+dto.getJob());
		System.out.println("날 짜 : "+dto.getMdate());
		System.out.println("파일이름 : "+dto.getFname());
		System.out.println("회원등급 : "+dto.getGrade());
		
	}
}
