package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.KW_DAO;

@Controller
@RequestMapping("/people")
public class KWController {

	KW_DAO kw = new KW_DAO();

	@RequestMapping(value = "/")
	public ModelAndView people(
			@RequestParam(value = "person", required = false, defaultValue = "") String person) {
		System.out.println("KWController: " + person);
		Map<String, List<String[]>> model = new HashMap<String, List<String[]>>();
		if (person.isEmpty()) {
			System.out.println("KWController: Receive people");
			List<String[]> director = kw.geDirectorDB();
			List<String[]> researchers = kw.geResearcherDB();
			List<String[]> acs = kw.geACDB();
			List<String[]> phds = kw.gePhDDB();
			List<String[]> mss = kw.geMSDB();
			List<String[]> bss = kw.geBSDB();
			model.put("director", director);
			model.put("researchers", researchers);
			model.put("acs", acs);
			model.put("phds", phds);
			model.put("mss", mss);
			model.put("bss", bss);
			return new ModelAndView("people", model);
		} else {
			return new ModelAndView(person, model);
		}

	}

	@RequestMapping(value = "/researcher")
	public ModelAndView researcher() {
		Map<String, List<String[]>> model = new HashMap<String, List<String[]>>();
		System.out.println("KWController: Receive people");
		List<String[]> director = kw.geDirectorDB();
		List<String[]> researchers = kw.geResearcherDB();
		List<String[]> acs = kw.geACDB();
		model.put("director", director);
		model.put("researchers", researchers);
		model.put("acs", acs);
		return new ModelAndView("researcher", model);

	}

	@RequestMapping(value = "/student")
	public ModelAndView student() {
		Map<String, List<String[]>> model = new HashMap<String, List<String[]>>();
		System.out.println("KWController: Receive people");
		List<String[]> phds = kw.gePhDDB();
		List<String[]> mss = kw.geMSDB();
		List<String[]> bss = kw.geBSDB();
		model.put("phds", phds);
		model.put("mss", mss);
		model.put("bss", bss);
		return new ModelAndView("student", model);

	}

}
