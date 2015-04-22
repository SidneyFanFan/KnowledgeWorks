package controller;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/Webhooks")
public class WebhooksController {

	private static String SECRET = "fudan@188";

	@RequestMapping(value = "/githubPush.do", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody Map<String, Object> webhooks(
			@RequestBody WebHooksJson requestBody) {
		// this is a post from github push
		Map<String, Object> response = new HashMap<String, Object>();
		String secret = requestBody.getSecret();
		String senderName = requestBody.getSenderName();
		response.put("Sender_Name", senderName);
		if (secret.equals(SECRET)) {
			response.put("Authority", "Accept");
		} else {
			response.put("Authority", "Denied");
		}
		// excute ssh to pull and compile project
		return response;
	}

	private class WebHooksJson implements Serializable {

		private static final long serialVersionUID = 1L;

		private String zen;
		private int hook_id;
		private String hook;
		private String respository;
		private String sender;

		String getSenderName() {
			JSONObject senderJsonObj = new JSONObject(sender);
			String senderName = senderJsonObj.getString("login");
			return senderName;
		}

		String getSecret() {
			JSONObject senderJsonObj = new JSONObject(hook);
			String secret = senderJsonObj.getJSONObject("config").getString(
					"secret");
			return secret;
		}

	}

}
