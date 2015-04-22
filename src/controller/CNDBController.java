package controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import structure.Triple;
import dao.CNDB_DAO;

@Controller
@RequestMapping("/cndbpedia")
public class CNDBController {

	private CNDB_DAO db = new CNDB_DAO();

	@RequestMapping(value = "/")
	public String defaultpage(Model model) {
		System.out
				.println("CNDBController: Receive empty and dispatch to introduction");
		return "intro";
	}

	@RequestMapping(value = "/introduction")
	public String introduction(Model model) {
		System.out.println("CNDBController: Receive introduction");
		return "intro";
	}

	@RequestMapping(value = "/search")
	public ModelAndView search(
			@RequestParam(value = "word", required = false, defaultValue = "") String word) {
		Map<String, List<Triple<String, String, String>>> model = new HashMap<String, List<Triple<String, String, String>>>();
		if (word.isEmpty()) {
			model.put("Information",
					new ArrayList<Triple<String, String, String>>());
			model.put("InfoBox",
					new ArrayList<Triple<String, String, String>>());
			model.put("Category",
					new ArrayList<Triple<String, String, String>>());
			model.put("Class", new ArrayList<Triple<String, String, String>>());
			model.put("Entity", new ArrayList<Triple<String, String, String>>());
			return new ModelAndView("search", model);
		}
		// try {
		// word = new String(word.getBytes("ISO-8859-1"), "utf-8");
		// } catch (UnsupportedEncodingException e) {
		// // debug
		// }

		List<Triple<String, String, String>> information = null;
		List<Triple<String, String, String>> infobox = null;
		List<Triple<String, String, String>> category = null;
		List<Triple<String, String, String>> eclass = null;
		List<Triple<String, String, String>> eclass2 = null;
		List<Triple<String, String, String>> entity = null;
		System.out.println("CNDBController: Receive word=" + word);
		information = db.getInformation(word);
		infobox = db.getInfobox(word);
		category = db.getCategory(word);
		eclass = db.getClass(word);
		eclass2 = db.getClass2(word);
		entity = db.getSameAs(word);

		// remove duplicated
		rmdup(information);
		rmdup(infobox);

		model.put("Information", information);
		model.put("InfoBox", infobox);
		model.put("Category", category);
		model.put("Class", eclass);
		model.put("Class2", eclass2);
		model.put("Entity", entity);
		return new ModelAndView("search", model);
	}

	private void rmdup(List<Triple<String, String, String>> information) {
		Triple<String, String, String> term1;
		Triple<String, String, String> term2;
		List<Triple<String, String, String>> rmList = new ArrayList<Triple<String, String, String>>();
		for (int i = 0; i < information.size(); i++) {
			term1 = information.get(i);
			for (int j = i + 1; j < information.size(); j++) {
				term2 = information.get(j);
				if (term1.getArg2().equals(term2.getArg2())) {
					// choose the longer one
					if (term1.getArg3().length() > term2.getArg3().length()) {
						rmList.add(term2);
					} else {
						rmList.add(term1);
					}
				}
			}
		}
		// remove
		information.removeAll(rmList);
	}

	public static void main(String[] args) {
		// test
		CNDBController a = new CNDBController();
		List<Triple<String, String, String>> information = new ArrayList<Triple<String, String, String>>();
		information.add(new Triple<String, String, String>("A", "attr", "1"));
		information.add(new Triple<String, String, String>("B", "attr", "11"));
		a.rmdup(information);
		System.out.println(information);
	}
}
