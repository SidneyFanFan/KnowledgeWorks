package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/probaseplus")
public class ProbasePlusController {

	@RequestMapping(value = "/")
	public String defaultpage(Model model) {
		System.out
				.println("ProbasePlusController: Receive empty and dispatch to query");
		model.addAttribute("word", "");
		return "query";
	}

	@RequestMapping(value = "/introduction")
	public String introduction(Model model) {
		System.out.println("ProbasePlusController: Receive introduction");
		return "intro";
	}

	@RequestMapping(value = "/query")
	public String query(
			@RequestParam(value = "word", required = false, defaultValue = "") String word,
			@RequestParam(value = "pbid", required = false, defaultValue = "") String pbid,
			@RequestParam(value = "method", required = false, defaultValue = "") String method,
			Model model) {
		if (method.equals("byword")) {
			System.out.println("ProbasePlusController: Receive word=" + word);
			// fetch pbwd data
			String url_pbwd_str = String.format(
					"http://10.141.208.25/kv/pbwd/%s", word);
			String pbwd_data = fetchData(url_pbwd_str);
			pbwd_data = parsePbwd(pbwd_data);
			model.addAttribute("word", word);
			model.addAttribute("pbid", pbwd_data);
			return "query";
		} else if (method.equals("byid")) {
			System.out.println("ProbasePlusController: Receive id=" + pbid);
			// fetch pbid data
			String url_pbid_str = String.format(
					"http://10.141.208.25/kv/pbid/%s", pbid);
			String pbid_data = fetchData(url_pbid_str);
			pbid_data = parsePbid(pbid_data);
			model.addAttribute("word", pbid_data);
			model.addAttribute("pbid", pbid);
			return "query";
		} else {
			model.addAttribute("word", "");
			model.addAttribute("pbid", "");
			return "query";
		}
	}

	private String parsePbid(String pbid_data) {
		// TODO Please check http://10.141.208.25/kv/pbid/id regularly
		// current format [ "'' hell's hurdles" ]
		String regex = "^\\[(.*)\"(.*)\"(.*)\\]$";
		Pattern p = Pattern.compile(regex);
		Matcher matcher = p.matcher(pbid_data);
		boolean ret = matcher.find();
		if (ret) {
			String pbwd = matcher.group(2);
			return pbwd.trim();
		}
		return null;
	}

	private String parsePbwd(String pbwd_data) {
		// TODO Please check http://10.141.208.25/kv/pbid/id regularly
		// current format [ "11345" ]
		String regex = "^\\[(.*)\"(.*)\"(.*)\\]$";
		Pattern p = Pattern.compile(regex);
		Matcher matcher = p.matcher(pbwd_data);
		boolean ret = matcher.find();
		if (ret) {
			String pbwd = matcher.group(2);
			return pbwd.trim();
		}
		return null;
	}

	private String fetchData(String url_str) {
		url_str = url_str.replace(" ", "%20");
		URL url = null;
		try {
			url = new URL(url_str);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		String charset = "utf-8";
		int sec_cont = 1000;
		try {
			URLConnection url_con = url.openConnection();
			url_con.setDoOutput(true);
			url_con.setReadTimeout(10 * sec_cont);
			url_con.setRequestProperty("User-Agent",
					"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)");
			InputStream htm_in = url_con.getInputStream();
			String data = InputStream2String(htm_in, charset);
			return data;
		} catch (IOException e) {
			return null;
		}
	}

	/**
	 * Method: InputStream2String Description: make InputStream to String
	 * 
	 * @param in_st
	 *            inputstream which need to be converted
	 * @param charset
	 *            encoder of value
	 * @throws IOException
	 *             if an error occurred
	 */
	public String InputStream2String(InputStream in_st, String charset)
			throws IOException {
		BufferedReader buff = new BufferedReader(new InputStreamReader(in_st,
				charset));
		StringBuffer res = new StringBuffer();
		String line = "";
		while ((line = buff.readLine()) != null) {
			res.append(line);
		}
		return res.toString();
	}

	public static void main(String[] args) {
		// for test
		ProbasePlusController pbpc = new ProbasePlusController();
		String url = "http://10.141.208.25/kv/pbwd/alan mruvka";
		System.out.println(url);
		System.out.println(pbpc.fetchData(url));
		System.out.println(pbpc.parsePbid("[ \"'' hell's hurdles\" ]"));
		System.out.println(pbpc.parsePbwd("[ \"11345\" ]"));
	}
}
