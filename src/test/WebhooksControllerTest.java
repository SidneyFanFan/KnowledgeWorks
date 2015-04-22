package test;

import static org.junit.Assert.*;

import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import util.FileUtil;
import controller.WebhooksController;

public class WebhooksControllerTest {

	static WebhooksController wbhooksController;
	String requestBody;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		wbhooksController = new WebhooksController();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		requestBody = FileUtil
				.readFile("/Users/apple/Documents/workspace/KnowledgeWorks/test_data/WebhooksTestJson.json");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		Map<String, Object> response = wbhooksController.webhooks("",
				requestBody);
		assertEquals("SidneyFanFan", response.get("Sender_Name"));
	}

}
