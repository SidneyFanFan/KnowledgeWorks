package controller;

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
			@RequestHeader String requestHeader, @RequestBody String requestBody) {
		// this is a post from github push
		Map<String, Object> response = new HashMap<String, Object>();
		JSONObject body = new JSONObject(requestBody);
		JSONObject config = body.getJSONObject("hook").getJSONObject("config");
		JSONObject sender = body.getJSONObject("sender");
		String secret = config.getString("secret");
		String senderName = sender.getString("login");
		response.put("Sender_Name", senderName);
		if (secret.equals(SECRET)) {
			response.put("Authority", "Accept");
		} else {
			response.put("Authority", "Denied");
		}
		// excute ssh to pull and compile project
		return response;
	}

}
