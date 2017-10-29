package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class TerminalTest {
	
	private static Terminal term;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		term = new Terminal();
		term.netConnect();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		term.netDisConnect();
	}

	@Before
	public void setUp() throws Exception {
		term.logon("user1", "1234");
	}

	@After
	public void tearDown() throws Exception {
		term.logoff();
	}

	@Test
	public void termnalConnected() {
		assertTrue(term.isLogon());
		
	}

	@Test
	public void getReturnMsg() {
		term.sendMessage("Hello");
		assertEquals("Hello", term.getReturnMsg());
	}

}
