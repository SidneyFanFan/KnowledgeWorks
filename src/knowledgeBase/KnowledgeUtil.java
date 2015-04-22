package knowledgeBase;

import util.FileUtil;

public class KnowledgeUtil {
	public static KnowledgeObject readRootKnowledge() {
		// generate sample list
		KnowledgeObject everythingpromoted = new KnowledgeObject(
				"everythingpromoted");
		KnowledgeObject creature = new KnowledgeObject("creature");
		KnowledgeObject animal = new KnowledgeObject("animal");
		KnowledgeObject person = new KnowledgeObject("person");
		KnowledgeObject plant = new KnowledgeObject("plant");
		KnowledgeObject organics = new KnowledgeObject("organics");
		KnowledgeObject inorganics = new KnowledgeObject("inorganics");
		KnowledgeObject substance = new KnowledgeObject("substance");
		KnowledgeObject abstracting = new KnowledgeObject("abstracting");
		KnowledgeObject statical = new KnowledgeObject("statical");
		KnowledgeObject dynamic = new KnowledgeObject("dynamic");
		KnowledgeObject event = new KnowledgeObject("event");
		KnowledgeObject concept = new KnowledgeObject("concept");
		// construct
		everythingpromoted.addSubClass(substance);
		everythingpromoted.addSubClass(abstracting);
		substance.addSubClass(organics);
		substance.addSubClass(inorganics);
		abstracting.addSubClass(statical);
		abstracting.addSubClass(dynamic);
		organics.addSubClass(creature);
		creature.addSubClass(animal);
		creature.addSubClass(plant);
		animal.addSubClass(person);
		statical.addSubClass(concept);
		dynamic.addSubClass(event);

		// return
		KnowledgeObject root = everythingpromoted;
		return root;
	}

	public static String readSample() {
		String html = "";
		html = FileUtil.readFile("/Users/apple/Documents/workspace/GDMWeb/WebContent/www/data/sampleOntology.dat");
		return html;
	}
}
