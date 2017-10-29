package spring.model.bbs;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class BbsDAOTest {
	
	private static BeanFactory beans;
	private static BbsDAO dao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("META-INF/blog.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		dao = (BbsDAO) beans.getBean("dao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testTotal() {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		assertEquals(dao.total(map), 20);
	}

	@Test 
	public void testGetRefnum() {
		int bbsno = 11;
		assertTrue(dao.getRefnum(bbsno));
	}

	@Test @Ignore
	public void testList() {
		
	}

	@Test @Ignore
	public void testRead() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testCreate() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testPasswdCheck() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testUpViewcnt() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testReplyRead() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testReplyCreate() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testUpAnsnum() {
		fail("Not yet implemented");
	}

}
